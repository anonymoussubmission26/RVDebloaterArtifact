#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Module.h"
#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/FileSystem.h"
#include "llvm/Support/Path.h"
#include <fstream>
#include <unordered_set>
#include <vector>
#include <string>
#include <set>
#include <cxxabi.h>
#include "llvm/IR/InlineAsm.h"
#include "llvm/Config/llvm-config.h"

using namespace llvm;
using namespace std;

std::string demangle(const char *name) {
  int status = -1;

  std::unique_ptr<char, void (*)(void *)> res{
      abi::__cxa_demangle(name, NULL, NULL, &status), std::free};
  return (status == 0) ? res.get() : std::string(name);
}

namespace {

struct CallOverwrite : public ModulePass {
    static char ID;
    unordered_set<string> functionList; // Set to store function names
    // For Copter
    // std::set<string> modeNames = {"AUTO", "CIRCLE", "STABILIZE", "GUIDED", "RTL", "LOITER"};
    // For Plane
    // std::set<string> modeNames = {"FBWA", "CIRCLE", "STABILIZE", "GUIDED", "RTL", "QLOITER","MANUAL","QHOVER"};
    // std::set<string> modeNames = {"AUTO", "CIRCLE", "GUIDED", "RTL", "QLOITER","MANUAL","QHOVER"};
    // For Rover
    std::set<string> modeNames = {"AUTO", "CIRCLE", "GUIDED", "RTL", "LOITER","MANUAL"};
    // For PX4 (iris)
    // std::set<string> modeNames = {"initialized", "takeoff", "auto:mission", "auto:loiter", "auto:rtl"};


    CallOverwrite() : ModulePass(ID) {}


    // New version: Trying to fix the problem of not having space in the first step
    void loadFunctionList(const string &directory) {
        errs() << "Looking for function list files in: " << directory << "\n";

        for (const auto &mode : modeNames) {
            string filePath = directory + "/" + mode + "_functions.txt";
            errs() << "Loading from file: " << filePath << "\n";

            ifstream infile(filePath);
            if (!infile) {
                errs() << "Error: Cannot open file " << filePath << "\n";
                continue;
            }

            string line;
            while (getline(infile, line)) {
                // Trim leading and trailing spaces
                line.erase(line.begin(), find_if(line.begin(), line.end(), [](unsigned char ch) {
                    return !isspace(ch);
                }));
                line.erase(find_if(line.rbegin(), line.rend(), [](unsigned char ch) {
                    return !isspace(ch);
                }).base(), line.end());

                if (!line.empty()) {
                    // Find the first space to check for address
                    size_t spacePos = line.find(' ');
                    if (spacePos != string::npos) {
                        functionList.insert(line.substr(0, spacePos)); // Store only function name
                    } else {
                        functionList.insert(line); // Store entire line if no space (only function name exists)
                    }
                }
            }
            infile.close();
        }
    }


    // Function to read function names from the mode's *_functions.txt files
    // void loadFunctionList(const string &directory) {
    //     errs() << "Looking for function list files in: " << directory << "\n";

    //     // Iterate over each mode name to construct the file name
    //     for (const auto &mode : modeNames) {
    //         string filePath = directory + "/" + mode + "_functions.txt";
    //         errs() << "Loading from file: " << filePath << "\n";

    //         ifstream infile(filePath);
    //         if (!infile) {
    //             errs() << "Error: Cannot open file " << filePath << "\n";
    //             continue;
    //         }

    //         string line;
    //         while (getline(infile, line)) {
    //             // Remove any leading/trailing spaces
    //             // line.erase(remove_if(line.begin(), line.end(), ::isspace), line.end());

    //             // Remove leading spaces
    //             line.erase(line.begin(), find_if(line.begin(), line.end(), [](unsigned char ch) {
    //                 return !isspace(ch);
    //             }));

    //             // Remove trailing spaces
    //             line.erase(find_if(line.rbegin(), line.rend(), [](unsigned char ch) {
    //                 return !isspace(ch);
    //             }).base(), line.end());
                
    //             if (!line.empty()) {
    //                 // functionList.insert(line); // Add function name to the set
    //                 // Split the line by the first space to separate function name and address
    //                 // TODO: Correct this implementation since in this step, we don't have address and only function name
    //                 size_t spacePos = line.find(' ');
    //                 if (spacePos != string::npos) {
    //                     string functionName = line.substr(0, spacePos);
    //                     // Optionally, you can retrieve the address if needed
    //                     // string address = line.substr(spacePos + 1);
    //                     // Now store only the function name in the list
    //                     functionList.insert(functionName); // Add function name to the set
    //                 }
    //             }
    //         }
    //         infile.close();
    //     }
    // }
    GlobalVariable * materializeStringLiteral(Module& M, const char* data) {
      Constant * ary = ConstantDataArray::getString(M.getContext(), StringRef(data), false);
      GlobalVariable * gv = new GlobalVariable(M, ary->getType(), true, GlobalValue::PrivateLinkage, ary);
      return gv;
    }

    Instruction * AddGlobalGEP(Module& M, string str) {
      GlobalVariable * GV = materializeStringLiteral(M, str.c_str());
      Type * GVT = GV->getType()->getElementType();
      vector<Value *> indices;
      indices.push_back(ConstantInt::get(IntegerType::get(M.getContext(), 32), 0));
      indices.push_back(ConstantInt::get(IntegerType::get(M.getContext(), 32), 0));
      GetElementPtrInst * GI = GetElementPtrInst::Create(GVT, GV, ArrayRef<Value *>(indices));
      return GI;
    }

    bool runOnModule(Module &M) override {
        Function *dummyFunc = M.getFunction("dummy_fn");
        // Function *StoreReturnAddr = M.getFunction("store_return_addr");
        Function *StoreReturnAddr = M.getFunction("log_return_address");


        if (!dummyFunc) {
            errs() << "Error: dummy_fn not found in module!\n";
            return false;
        }

        if (!StoreReturnAddr) {
            errs() << "Error: StoreReturnAddr not found in module!\n";
            return false;
        }

        // Load the function list from the appropriate directory
        loadFunctionList("/home/mohsen/rvd-project/RVDefender/profiles"); 

        int numInstrumented = 0;
        int indirect_counter = 0;
        int indirect_bool = 0;
        int ret_counter = 0;
        int init = 0;
        

        int function_number = 0;

        // Iterate through all functions in the module
        for (Function &F : M) { 
            function_number++;

            if (F.isDeclaration()) continue;
            // std::string demangledName = demangle(F.getName().str().c_str());
            // if (demangledName == "Copter::set_mode(Mode::Number, ModeReason)") continue;
          
            // ------------------ NEW: insert indirect call at start of is_taking_off for attack------------------
            // if ((F.getName() == "_ZNK10ModeGuided13is_taking_offEv")) {
            if ((F.getName() == "_ZN10ModeGuided8navigateEv")) {
            // if ((F.getName() == "_ZN10ModeGuided23do_user_takeoff_start_mEf")) {
                // errs() << "The function is: " << F.getName() << "\n";
                // Initialins = false;
                LLVMContext &Ctx = M.getContext();
                BasicBlock &entry = F.getEntryBlock();
                // Entry block insertion
                IRBuilder<> Builder(&*F.getEntryBlock().getFirstInsertionPt());

                Function *targetFunc = M.getFunction("call_function_from_file");
                if (!targetFunc) {
                    errs() << "[ERROR] call_function_from_file not found in module\n";
                    return false; // fixed return
                }

                // Static/global flag
                GlobalVariable *flag = M.getGlobalVariable("call_once_flag");
                if (!flag) {
                    flag = new GlobalVariable(M, Type::getInt1Ty(Ctx), false,
                                            GlobalValue::InternalLinkage,
                                            ConstantInt::getFalse(Ctx),
                                            "call_once_flag");
                }

                // Load flag
                Value *flagVal = Builder.CreateLoad(Type::getInt1Ty(Ctx), flag, "flag_val");

                // Create an 'if' condition using a **select + call** (no new BBs needed)
                Value *notCalled = Builder.CreateNot(flagVal);

                // Only call if notCalled
                Instruction *callInst = Builder.CreateCall(targetFunc->getFunctionType(),
                                                        Builder.CreateBitCast(targetFunc,
                                                                                targetFunc->getFunctionType()->getPointerTo()),
                                                        {});
                Builder.CreateStore(ConstantInt::getTrue(Ctx), flag); 

                errs() << "[RVDefender] Calling to call_function_from_file is instrumented \n";

            }
            for (BasicBlock &BB : F) {
                for (BasicBlock::iterator BI = BB.begin(), BE = BB.end(); BI != BE;) {
                    Instruction *Inst = &(*BI);
                    ++BI;  // Increment before modifying the IR

                    // Check if the instruction is a function call
                    if (CallInst *callInst = dyn_cast<CallInst>(Inst)) {
                        Function *calledFunc = callInst->getCalledFunction();
                        IRBuilder<> Builder(callInst);

                        if (!calledFunc){
                            // continue; // Skip indirect calls
                            // Value *calledValue = callInst->getCalledValue();
                            #if LLVM_VERSION_MAJOR >= 14
                                Value *calledValue = callInst->getCalledOperand();
                            #else
                                Value *calledValue = callInst->getCalledValue();
                            #endif

                            if (!calledValue) printf("calledValue is NULL \n"); // continue;
                            // Value *funcPtrStr = Builder.CreateGlobalStringPtr("INDIRECT_CALL", "func_ptr_name");
                            indirect_bool = 1;
                            // Value *funcNameStr = Builder.CreateGlobalStringPtr("INDIRECT_CALL", "func_name");
                            // ConstantInt * indirectBoolVal = ConstantInt::get(IntegerType::get(M.getContext(), 32), indirect_bool);
                            Value *funcPtr = Builder.CreateBitCast(calledValue, Type::getInt8PtrTy(M.getContext()));


                            // Value *NextInstAddr = Builder.CreateCall(
                            //     InlineAsm::get(FunctionType::get(Int32Ty, {}, false),
                            //    "adr $0, .+4", "=r", true));


                            // Get the caller function's address
                            // Value *callerFuncPtr = Builder.CreateBitCast(&F, Type::getInt8PtrTy(M.getContext()));

                            // Instruction *nextInst = callInst->getNextNode();
                            // if (nextInst) {
                            //     // errs() << "Next instruction: " << *nextInst << "\n"; 
                            // } else {
                            //     errs() << "Call is the last instruction in the block.\n";
                            // }

                            // Builder.CreateCall(dummyFunc,{indirectBoolVal,funcNameStr,funcPtr}); // Log indirect calls
                            Builder.CreateCall(dummyFunc,{funcPtr}); // Log indirect calls

                            // Builder.CreateCall(StoreReturnAddr, {NextInstAddr});

                            indirect_counter++;
                            // if(init == 0){
                            //     init = 1;
                            //     errs() << &F << F << "\n";
                            // }

                            continue;
                            // Builder.CreateCall(dummyFunc, {funcPtrStr}); // Log indirect calls
                            // numInstrumented++;

                        } 
                        

                        // // Check if the function is in our list
                        // if (functionList.find(calledFunc->getName().str()) != functionList.end()) {
                        //     // IRBuilder<> Builder(callInst);

                        //     // Instruction * GI = AddGlobalGEP(M, calledFunc->getName());
                        //     // GI->insertBefore(callInst);
                        //     // vector<Value *> args;
                        //     // args.push_back(GI);
                        //     indirect_bool = 0;

                        //     Value *funcNameStr = Builder.CreateGlobalStringPtr(calledFunc->getName(), "func_name");
                        //     ConstantInt * indirectBoolVal = ConstantInt::get(IntegerType::get(M.getContext(), 32), indirect_bool);
                        //     Value *funcPtr = Builder.CreateBitCast(calledFunc, Type::getInt8PtrTy(M.getContext()));

                        //     // // Get the caller function's address
                        //     // Value *callerFuncPtr = Builder.CreateBitCast(&F, Type::getInt8PtrTy(M.getContext()));

                        //     Builder.CreateCall(dummyFunc,{indirectBoolVal,funcNameStr,funcPtr}); // Insert dummy_fn before the call
                        //     numInstrumented++;
                        // }
                    }

                    else if (ReturnInst *RetInst = dyn_cast<ReturnInst>(Inst)){
                        if (functionList.find(F.getName().str()) != functionList.end()) {

                        
                        IRBuilder<> Builder(RetInst);

                        // Insert logging before return
                        // Builder.SetInsertPoint(RetInst);
                        
                        Value *retAddr = Builder.CreateCall(
                            Intrinsic::getDeclaration(F.getParent(), Intrinsic::returnaddress),
                            {ConstantInt::get(Type::getInt32Ty(F.getContext()), 0)}
                        );

                        Builder.CreateCall(StoreReturnAddr, {retAddr});
                        // Builder.CreateCall(StoreReturnAddr);
                        
                        ret_counter++;

                        // Print the return instruction's address and the target address (if available)
                        // if (RetInst->getReturnValue()) {
                        //     // If the return value exists, print it
                        //     errs() << "Return Instruction in function: " << F.getName() << "\n";
                        //     errs() << "Return Value: " << *RetInst->getReturnValue() << "\n";
                        //     errs() << "Return Value: " << *RetInst << "\n";

                        // } else {
                        //     errs() << "Return Instruction in function: " << F.getName() << " with no return value\n";
                        //     errs() << "Return instruction: " << *RetInst << "\n";

                        // }
                        // // If there's no explicit return value, this indicates an unconditional jump
                        // if (RetInst->getFunction()->isDeclaration()) {
                        //     errs() << "This return is from a function declaration.\n";
                        // }
                        // // Print the target address of the return instruction
                        // errs() << "Return Instruction Address: " << &RetInst << "\n";
                        }
                    }
                }
            }
            
        }

        errs() << numInstrumented << " call sites instrumented! \n";
        errs() << indirect_counter << " indirect call sites detected! \n";
        errs() << ret_counter << " return instructions detected! \n";
        errs() << function_number << "are exist in the module\n";
        
        return numInstrumented > 0;
    }
};

} // namespace

char CallOverwrite::ID = 0;
static RegisterPass<CallOverwrite> X("overwrite-call", "Instrument specific call sites with dummy_fn", false, false);
