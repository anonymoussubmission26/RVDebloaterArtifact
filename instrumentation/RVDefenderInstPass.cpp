// RVDefender Instrument tool

#include "llvm/IR/Instructions.h"
#include "llvm/Pass.h"
#include "llvm/IR/InstIterator.h"
#include "llvm/IR/Function.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/ADT/Statistic.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Value.h"
#include "llvm/IR/GlobalValue.h"
#include "llvm/IR/GlobalVariable.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Type.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/Analysis/LoopInfo.h"
#include "llvm/Analysis/PostDominators.h"
#include "llvm/IR/Dominators.h"
#include "llvm/IR/IntrinsicInst.h"
#include "llvm/ADT/SCCIterator.h"
#include "llvm/Analysis/PostDominators.h"
#include "llvm/IR/Dominators.h"

#include <cxxabi.h>
#include <iostream>
#include <map>
#include <memory>
#include <queue>
#include <string>
#include <unordered_map>
#include <unordered_set>

using namespace llvm;
using namespace std;

#define __DEBUG__

// Output strings for debugging
std::string debug_str;
raw_string_ostream debug(debug_str);

// Strings for output
std::string output_str;
raw_string_ostream output(output_str);



// Demangles the function name.
std::string demangle(const char *name) {
  int status = -1;

  std::unique_ptr<char, void (*)(void *)> res{
      abi::__cxa_demangle(name, NULL, NULL, &status), std::free};
  return (status == 0) ? res.get() : std::string(name);
}

void topoSortBBs(Function *F) {
  vector<BasicBlock *> tempBB;
  //debug<<"PrintFunction:" << F->print() << "\n";

  for (scc_iterator<Function *> I = scc_begin(F), IE = scc_end(F); I != IE;
       ++I) {
        // debug << "New SSC " <<"\n";

    // Obtain the vector of BBs in this SCC and print it out.
    const std::vector<BasicBlock *> &SCCBBs = *I;

    for (std::vector<BasicBlock *>::const_iterator BBI = SCCBBs.begin(),
                                                   BBIE = SCCBBs.end();
         BBI != BBIE; ++BBI) {

      BasicBlock *b = const_cast<llvm::BasicBlock *>(*BBI);
      tempBB.push_back(b);
       for (BasicBlock::const_iterator It = b->begin(); It != b->end(); ++It) {

        Instruction *ins = const_cast<llvm::Instruction *>(&*It);
        // debug << "Instr: " << *ins <<"\n";

      }

      // debug<<"----------------BB endd--------------\n";
      
    }
  }

  reverse(tempBB.begin(), tempBB.end());
  //return tempBB;
}

// Returns the source code line number cooresponding to the LLVM instruction.
// Returns -1 if the instruction has no associated Metadata.
int getSourceCodeLine(Instruction *I) {
  // Get debugInfo associated with every instruction.
  llvm::DebugLoc debugInfo = I->getDebugLoc();

  int line = -1;
  if (debugInfo)
    line = debugInfo.getLine();

  return line;
}

namespace {
struct RVDefenderInstPass : public ModulePass {
  static char ID;
  RVDefenderInstPass() : ModulePass(ID) {}

  // Function to get or create a printf declaration
  Function* getPrintfDeclaration(Module &M) {
    LLVMContext &Context = M.getContext();
    Function *PrintfFunc = M.getFunction("printf");
    
    if (PrintfFunc)
      return PrintfFunc;
    
    // Define the printf function prototype
    std::vector<Type*> printfArgs(1, Type::getInt8PtrTy(Context));
    FunctionType *PrintfType = FunctionType::get(Type::getInt32Ty(Context), printfArgs, true);
    PrintfFunc = Function::Create(PrintfType, Function::ExternalLinkage, "printf", M);
    
    return PrintfFunc;
  }

  void insertPrintfCall(Function *F, Module &M, std::string funcName) {
    // Get or create the printf function
    Function *PrintfFunc = getPrintfDeclaration(M);

    // Create the format string for printf
    LLVMContext &Context = M.getContext();
    std::string formatStr = "Function called: %s\n";
    Constant *FormatStrConst = ConstantDataArray::getString(Context, formatStr);
    
    GlobalVariable *FormatStrGV = new GlobalVariable(
        M, 
        FormatStrConst->getType(), 
        true, 
        GlobalVariable::PrivateLinkage, 
        FormatStrConst, 
        ".str"
    );
    
    // Get the entry block of the function
    BasicBlock &EntryBlock = F->getEntryBlock();
    IRBuilder<> Builder(&EntryBlock.front());

    // Create the printf call
    Value *FormatStrPtr = Builder.CreatePointerCast(FormatStrGV, Type::getInt8PtrTy(Context));
    Value *FuncName = Builder.CreateGlobalStringPtr(funcName);
    Builder.CreateCall(PrintfFunc, {FormatStrPtr, FuncName});
  }

  virtual bool runOnModule(Module &M) override {
    std::string funcPatchName = "Copter::set_mode";

    // Iterate over functions in the module
    for (Function &F : M) {
      if (F.isDeclaration())
        continue;

      std::string funcName = demangle(F.getName().str().c_str());

      if (funcName.find(funcPatchName) != std::string::npos) {
        errs() << "Function found: " << funcName << "\n";
        insertPrintfCall(&F, M , funcName);
      }
    }

    return false;
  }
};
}

char RVDefenderInstPass::ID = 0;
static RegisterPass<RVDefenderInstPass> X("instrumentcode",
                                           "Pass to instrument mode controller");
