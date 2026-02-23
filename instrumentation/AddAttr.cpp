#include "llvm/IR/Function.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Instructions.h"
#include "llvm/Pass.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/Operator.h"
#include "llvm/IR/GlobalValue.h"
#include "llvm/Support/CommandLine.h"
#include <llvm/Analysis/LoopInfo.h>
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/InlineAsm.h"
#include "llvm/Transforms/Utils/Cloning.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"

#include <string>
#include <unistd.h>
#include <set>
#include <iostream>
#include <fstream>
#include <cxxabi.h>
#include <sstream>
#include <unordered_map>
#include <regex>

using namespace llvm;
using namespace std;

namespace {

struct AddAttr : public ModulePass {
    static char ID;
    std::ofstream outputFile; // Declare an ofstream object

    AddAttr() : ModulePass(ID) {
        // Open the output file during the pass initialization
        outputFile.open("llvm_pass_output.txt", std::ios::out | std::ios::app); // Append mode
        if (!outputFile.is_open()) {
            errs() << "Error: Unable to open output file for writing.\n";
        }
    }

    ~AddAttr() {
        if (outputFile.is_open()) {
            outputFile.close(); // Close the file when done
        }
    }

    std::unordered_map<std::string, std::vector<std::string>> sectionMappings;

    // Function to demangle names
    std::string getMangledName(const std::string &demangled) {
        int status = 0;
        char *realname = abi::__cxa_demangle(demangled.c_str(), 0, 0, &status);
        std::string result = (status == 0) ? realname : demangled;
        free(realname);
        return result;
    }

    void loadFunctionMappings(const std::string &fileName) {
        std::ifstream file(fileName);
        if (!file.is_open()) {
            errs() << "Error: Unable to open file: " << fileName << "\n";
            return;
        }

        std::string line;
        std::string currentSection;
        std::regex sectionRegex(R"(\.(\w+)_section)");  // Extracts "LOITER" from ".LOITER_section"
        std::regex functionRegex(R"(\*\(([^)]+)\))");  // Extracts function names from *(function_name)
        std::smatch match;

        while (std::getline(file, line)) {
            // Match and capture section names dynamically
            if (std::regex_search(line, match, sectionRegex)) {
                currentSection = "." + match[1].str() + "_section";  // Ensure section name format
                continue;
            }
            // Add functions to the last matched section
            if (!currentSection.empty() && std::regex_search(line, match, functionRegex)) {
                std::string functionName = match[1].str();  // Extracted function name
                sectionMappings[currentSection].push_back(functionName);
            }
        }

        file.close();
    }

    bool runOnModule(Module &M) override {
        // Expand tilde (~) and get absolute path
        std::string filePath = std::string(getenv("HOME")) + "/rvd-project/RVDefender/profiles/custom.ld";
        loadFunctionMappings(filePath);

        // Iterate over all functions in the module
        for (Function &F : M) {
            std::string funcName = F.getName().str();

            // Flag to track if the function was assigned to any section
            bool assignedToAnySection = false;

            // Check if the function belongs to any section
            for (const auto &sectionMapping : sectionMappings) {
                const std::string &sectionName = sectionMapping.first;
                const std::vector<std::string> &functions = sectionMapping.second;

                if (std::find(functions.begin(), functions.end(), funcName) != functions.end()) {
                    // Write to file
                    outputFile << "Assigning section: " << sectionName << " to function: " << funcName << "\n";
                    F.setSection(sectionName); // Set the section of the function
                    assignedToAnySection = true; // Mark the function as assigned
                }
            }

            // If no section was assigned, log this
            if (!assignedToAnySection) {
                outputFile << "No section assigned to function: " << funcName << "\n";
            }
        }

        return true;  // This pass modifies the module
    }
};

} // namespace

char AddAttr::ID = 0;
static RegisterPass<AddAttr> X("add-attr", "adding attributes", false, false);
