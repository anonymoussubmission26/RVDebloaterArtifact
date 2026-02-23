#include "llvm/IR/Function.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Instructions.h"
#include "llvm/Pass.h"
#include "llvm/Support/raw_ostream.h"
#include <string>

using namespace llvm;

namespace {

  struct PrintLogFnInstructionsPass : public ModulePass {
    static char ID;
    PrintLogFnInstructionsPass() : ModulePass(ID) {}

    bool runOnModule(Module &M) override {
      // Find the function named "log_fn"
      Function *logFn = M.getFunction("log_fn");

      // If "log_fn" exists, print all its instructions
      if (logFn && !logFn->isDeclaration()) {
        errs() << "Function: " << logFn->getName() << "\n";

        // Iterate over all basic blocks in "log_fn"
        for (auto &BB : *logFn) {
          // Iterate over all instructions in each basic block
          for (auto &Instr : BB) {
            Instr.print(errs());
            errs() << "\n";
          }
        }

        errs() << "End of instructions for function: " << logFn->getName() << "\n";
      } else {
        errs() << "Function 'log_fn' not found or is a declaration.\n";
      }

      return false; // No modification to the IR, so return false
    }
  };

}

char PrintLogFnInstructionsPass::ID = 0;
static RegisterPass<PrintLogFnInstructionsPass> X("print-log-fn-instr", "Prints all instructions of the function named 'log_fn'", false, false);

