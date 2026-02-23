
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
#include <cxxabi.h>

#include <string> 
#include <unistd.h> 
#include <set>
#include <iostream>
#include <fstream>
#include "llvm/Support/FileSystem.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;
using namespace std;

std::string demangle(const char *name) {
  int status = -1;

  std::unique_ptr<char, void (*)(void *)> res{
      abi::__cxa_demangle(name, NULL, NULL, &status), std::free};
  return (status == 0) ? res.get() : std::string(name);
}

namespace {

  struct SSProt : public ModulePass {
    static char ID;
    SSProt() : ModulePass(ID) {}
    
    GlobalVariable * materializeStringLiteral(Module& M, const char* data) {
      Constant * ary = ConstantDataArray::getString(M.getContext(), StringRef(data), false);
      GlobalVariable * gv = new GlobalVariable(M, ary->getType(), true, GlobalValue::PrivateLinkage, ary);
      return gv;
    }

    Instruction * AddGlobalGEP(Module& M, string str) {
      std::string funcName = str + '\0';  // Add explicit null terminator to avoid concatenation
      Constant * nameStr = ConstantDataArray::getString(M.getContext(), funcName, true);

      // Create a unique global variable to store the function name
      GlobalVariable * gv = new GlobalVariable(
          M, nameStr->getType(), true, GlobalValue::PrivateLinkage, nameStr, "FuncName"
      );

      // Generate a GEP to get the pointer to the first character of the string
      std::vector<Value *> indices = {
          ConstantInt::get(IntegerType::get(M.getContext(), 32), 0),
          ConstantInt::get(IntegerType::get(M.getContext(), 32), 0)
      };
      
      GetElementPtrInst * GI = GetElementPtrInst::CreateInBounds(gv->getType()->getElementType(), gv, indices);
      return GI;
    }

    bool runOnModule(Module& M) {
      Function * log_fn = M.getFunction("log_fn");
      int num_instrumented = 0;
      std::vector<std::string> functionNames;
      int init = 0;

      // Open a file for writing
      std::error_code EC;
      llvm::raw_fd_ostream File("instrumented_functions.txt", EC, llvm::sys::fs::OF_Text);

      if (EC) {
        errs() << "Error opening file: " << EC.message() << "\n";
        return false;
      }

      for(Module::iterator mit = M.getFunctionList().begin(); mit != M.getFunctionList().end(); ++mit) {
        Function * func = &*mit;
        if(func->isDeclaration() || func == log_fn) continue;
        // if(num_instrumented == 1154) errs() << "First function:" << func->getName() << "\n";
        std::string funcName = demangle(func->getName().str().c_str());
        // Create GlobalVariable for function name

        Instruction * first = &*(&*func->begin())->begin();

        ConstantInt * Id = ConstantInt::get(IntegerType::get(M.getContext(), 32), num_instrumented);
        ConstantInt * size = ConstantInt::get(IntegerType::get(M.getContext(), 32), func->getName().size());
        Instruction * GI = AddGlobalGEP(M, func->getName().str());
        GI->insertBefore(first);
        Value * funcPtr = ConstantExpr::getBitCast(func, Type::getInt8PtrTy(M.getContext()));

        // Write function name to file
        File << func->getName() << "\n";

        // if(init == 0 ){
          // init = 1;
          // errs() << *func << "\n";
          // errs() << &func << "\n";

        // }
        vector<Value *> args;
        args.push_back(Id);
        args.push_back(GI);
        args.push_back(size);
        args.push_back(funcPtr);

        CallInst * CI = CallInst::Create(log_fn->getFunctionType(), log_fn, ArrayRef<Value *>(args));
        CI->insertBefore(first);
        // Instruction * first_new = &*(&*func->begin())->begin();
        // errs() << *first_new << "\n";

        num_instrumented++;
      }
      errs() << num_instrumented << " functions instrumented\n";
      return true;
    }
  };
}

char SSProt::ID = 0;
static RegisterPass<SSProt> X("dp-funcs", "profiling functions", false, false);
