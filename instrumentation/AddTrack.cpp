
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
#include "llvm/Support/FileSystem.h"

#include <string> 
#include <unistd.h> 
#include <set>
#include <iostream>
#include <fstream>
#include <cxxabi.h>

using namespace llvm;
using namespace std;

// Demangles the function name.
std::string demangle(const char *name) {
  int status = -1;

  std::unique_ptr<char, void (*)(void *)> res{
      abi::__cxa_demangle(name, NULL, NULL, &status), std::free};
  return (status == 0) ? res.get() : std::string(name);
}
Value *findVariableValue(Function &F, const std::string &varName) {
  for (BasicBlock &BB : F) {
      for (Instruction &I : BB) {
          if (AllocaInst *AI = dyn_cast<AllocaInst>(&I)) {
              if (AI->getName() == varName) {
                  // Look for the store to this alloca
                  for (User *U : AI->users()) {
                      if (StoreInst *SI = dyn_cast<StoreInst>(U)) {
                          return SI->getValueOperand(); // This is the stored value
                      }
                  }
              }
          }
      }
  }
  return nullptr;
}
void injectCall(IRBuilder<> &builder, Function *mode_entry, Value *base_mode) {
  LLVMContext &Ctx = builder.getContext();

  Value *bm  = builder.CreateZExtOrBitCast(base_mode,Type::getInt8Ty(Ctx));
  // builder.CreateCall(mode_entry, {bm});
}
namespace {

  struct TrackInst : public ModulePass {

    std::string funcPatchName = "set_mode";
    int mode_id = 0;

    
    static char ID;
    TrackInst() : ModulePass(ID) {}

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


    bool runOnModule(Module& M) {
      Function * mode_entry = M.getFunction("mode_entry");
      // Function * set_mode_entry = M.getFunction("Mode::set_mode");
      // errs() << mode_entry << " " << set_mode_entry << "\n";
      int i = 0;
      // Find the set_mode function
      Function* set_mode_func = nullptr;
      for (Function& func : M) {
        std::string demangledName = demangle(func.getName().str().c_str());
        // if (demangledName == "Copter::set_mode(Mode::Number, ModeReason)") { // For Copter
        // if (demangledName == "Plane::set_mode_by_number(Mode::Number, ModeReason)") { // For Plane
        if (demangledName == "Rover::set_mode(Mode::Number, ModeReason)") { // For Rover
        // if (demangledName == "Commander::handle_command(vehicle_command_s const&)") { // For PX4 (old)
        // if (demangledName == "Commander::custom_command(int, char**)") { // For PX4
          set_mode_func = &func;
          i++;
          errs() << "Found 'set_mode' function in main if: " << demangledName << " "<< i << "\n";
          for (auto &arg : func.args()) {
            errs() << " - " << arg.getName() << " : ";
            arg.getType()->print(errs());
            errs() << "\n";
          }
          // errs() << "Function is: " << *set_mode_func << "\n";
          break;
        }
        // else if(demangledName.find("set_mode") != std::string::npos){ // For Ardupilot
        // else if(demangledName.find("Commander::custom_command") != std::string::npos){ // For PX4
        //   // set_mode_func = &func;
        // // //   errs() << "Function is: " << *set_mode_func << "\n";
        //   errs() << "Found 'set_mode' function: " << demangledName << " "<< i << "\n";
        // }
      }
      if (!set_mode_func) {
        errs() << "Function 'set_mode' not found in the module.\n";
        return false;
      }
      // std::error_code EC;
      // raw_fd_ostream outFile("set_mode_func.ll", EC, sys::fs::OF_Text);
      // set_mode_func->print(outFile);
      // outFile.close();
      //////////*********** FOR ArduCopter *************////////////
      // if (set_mode_func->arg_size() >= 2) {
      //     auto ArgIter = set_mode_func->arg_begin();
      //     std::advance(ArgIter, 1); 
      //     Argument *secondArg = &*ArgIter;
      //     // errs() << "Second argument of " << set_mode_func->getName() << " is: " << *secondArg << "\n";
      //     // Instruction * first = &*(&*set_mode_func->begin())->begin();
      //     // Iterate over all basic blocks in `set_mode`
      //     for (BasicBlock &BB : *set_mode_func) {
      //       for (Instruction &I : BB) {
      //         // Check if the instruction is a return instruction
      //         if (ReturnInst *retInst = dyn_cast<ReturnInst>(&I)) {
      //           // errs() << "Found Return Insts: " << *retInst << "\n";
      //           // Trace the value being returned
      //           Value *retVal = retInst->getReturnValue();
      //           if (LoadInst *loadInst = dyn_cast<LoadInst>(retVal)) {
      //             Value *ptr = loadInst->getPointerOperand();
      //               // Trace back the value stored in the pointer
      //               for (User *U : ptr->users()) {
      //                 if (StoreInst *storeInst = dyn_cast<StoreInst>(U)) {
      //                   Value *storedVal = storeInst->getValueOperand();
      //                   // Check if the stored value is a constant boolean true
      //                   if (ConstantInt *constInt = dyn_cast<ConstantInt>(storedVal)) {
      //                       if (constInt->isOne()) { // Found "return true"
      //                         // errs() << "Found Return true Insts.\n";
      //                         vector<Value *> args;
      //                         args.push_back(secondArg);  
      //                         CallInst *CI = CallInst::Create(mode_entry->getFunctionType(), mode_entry, ArrayRef<Value *>(args));
      //                         CI->insertBefore(storeInst);
      //                         errs() << "Inserted call to 'mode_entry' before 'return true'.\n";
      //                     }
      //                   }
      //               }
      //             }
      //           } 
      //         }
      //       }
      //     }
      //     // // CI->insertBefore(first);
      //     // Instruction * Newfirst = &*(&*set_mode_func->begin())->begin();
      //     // errs() << "Inserted call to 'mode_entry' at the beginning of 'set_mode'. " << *Newfirst << "\n";
      // } else {
      //     errs() << "Function " << set_mode_func->getName() << " does not have enough arguments.\n";
      // }
      /////////******** FOR ArduCopter ******************//////////



      ////////********* FOR ArduPlane & ArduRover*******************//////////
      if (set_mode_func->arg_size() >= 2) {
          auto ArgIter = set_mode_func->arg_begin();
          std::advance(ArgIter, 1); 
          Argument *secondArg = &*ArgIter;
          // errs() << "Second argument of " << set_mode_func->getName() << " is: " << *secondArg << "\n";
          Instruction * first = &*(&*set_mode_func->begin())->begin();
          // Iterate over all basic blocks in `set_mode`
          for (BasicBlock &BB : *set_mode_func) {
            for (Instruction &I : BB) {
              // Check if the instruction is a return instruction
              if (ReturnInst *retInst = dyn_cast<ReturnInst>(&I)) {
                // errs() << "Found Return Insts: " << *retInst << "\n";
                // Trace the value being returned
                Value *retVal = retInst->getReturnValue();
                if (LoadInst *loadInst = dyn_cast<LoadInst>(retVal)) {
                  Value *ptr = loadInst->getPointerOperand();
                    // Trace back the value stored in the pointer
                    for (User *U : ptr->users()) {
                      if (StoreInst *storeInst = dyn_cast<StoreInst>(U)) {
                        Value *storedVal = storeInst->getValueOperand();
                        // Check if the stored value is a constant boolean true
                        if (ConstantInt *constInt = dyn_cast<ConstantInt>(storedVal)) {
                            //if (!constInt->isZero()) { // Ignore "return false"
                              // errs() << "Found Return true Insts.\n";
                              vector<Value *> args;
                              args.push_back(secondArg);  
                              CallInst *CI = CallInst::Create(mode_entry->getFunctionType(), mode_entry, ArrayRef<Value *>(args));
                              CI->insertBefore(first);
                              errs() << "Inserted call to 'mode_entry' before 'return true'.\n";
                          // }
                        }
                    }
                  }
                } 
              }
            }
          }
          // // CI->insertBefore(first);
          // Instruction * Newfirst = &*(&*set_mode_func->begin())->begin();
          // errs() << "Inserted call to 'mode_entry' at the beginning of 'set_mode'. " << *Newfirst << "\n";
      } else {
          errs() << "Function " << set_mode_func->getName() << " does not have enough arguments.\n";
      }
      ////////********* FOR ArduPlane *******************//////////

      // ////////********* FOR PX4*******************//////////
      // if (set_mode_func->arg_size() >= 2) {
      //     auto ArgIter = set_mode_func->arg_begin();
      //     // std::advance(ArgIter, 1); 
      //     Argument *firstArg = &*ArgIter++;
      //     Argument *secondArg = &*ArgIter;
      //     // errs() << "Second argument of " << set_mode_func->getName() << " is: " << *secondArg << "\n";
      //     Instruction * first = &*(&*set_mode_func->begin())->begin();
      //     // Iterate over all basic blocks in `set_mode`
      //     for (BasicBlock &BB : *set_mode_func) {
      //       for (Instruction &I : BB) {
      //         // Step 1: Look for call to strcmp
      //           if (auto *call = dyn_cast<CallInst>(&I)) {
      //             Function *callee = call->getCalledFunction();
      //             if (callee && callee->getName() == "strcmp") {
      //               Value *arg0 = call->getArgOperand(0);
      //               Value *arg1 = call->getArgOperand(1);
      //               // errs() << "HERE1.\n";
      //               // Optional: Check if one arg is "mode"
      //               if (ConstantDataArray *cda = dyn_cast<ConstantDataArray>(
      //                       cast<GlobalVariable>(cast<ConstantExpr>(arg1)->getOperand(0))->getInitializer())) {
      //                 if (cda->isCString() && (cda->getAsCString() == "mode" || cda->getAsCString() == "takeoff" || cda->getAsCString() == "land")) {
      //                   // errs() << "HERE2.\n";
      //                   // Step 2: Find branch that uses this strcmp
      //                   for (User *U : call->users()) {
      //                     if (ICmpInst *icmp = dyn_cast<ICmpInst>(U)) {
      //                       for (User *icmpUser : icmp->users()) {
      //                         if (BranchInst *br = dyn_cast<BranchInst>(icmpUser)) {
      //                           if (br->isConditional()) {
      //                             // Step 3: The true branch goes into the 'if' block
      //                             BasicBlock *modeBlock = br->getSuccessor(1); // or 1 depending on condition

      //                             // Step 4: Insert your instruction at beginning of `modeBlock`
      //                             IRBuilder<> builder(&*modeBlock->getFirstInsertionPt());
      //                             errs() << "Found if statement.\n";
      //                             vector<Value *> args = {firstArg, secondArg};
      //                             // args.push_back(secondArg);  
      //                             // CallInst *CI = CallInst::Create(mode_entry->getFunctionType(), mode_entry, ArrayRef<Value *>(args));
      //                             // CI->insertBefore(first);
      //                             builder.CreateCall(mode_entry, args);
      //                             errs() << "Inserted call to 'mode_entry' after if statement. Args:"<< *firstArg << ", " << *secondArg<<"\n";
      //                           }
      //                         }
      //                       }
      //                     }
      //                   }
      //                 }
      //               }
      //             }
      //           }
      //       }
      //     }
      // } else {
      //     errs() << "Function " << set_mode_func->getName() << " does not have enough arguments.\n";
      // }
      ////////********* FOR PX4 *******************//////////




      
      ////////********* TODO: Working on it FOR PX4 (handle_command function) *******************//////////
      // uint16_t VEHICLE_CMD_DO_SET_MODE = 176;
      // // std::error_code EC;
      // // llvm::raw_fd_ostream outFile("switch_blocks_output.txt", EC, llvm::sys::fs::OF_Text);
      
      // for (BasicBlock &BB : *set_mode_func) {
      //   for (Instruction &I : BB) {
      //     if (auto *SI = dyn_cast<SwitchInst>(&I)) {
      //       outFile << "Switch instruction:\n";
      //       SI->print(outFile);
      //       outFile << "\n";

      //       // Print default block
      //       BasicBlock *defaultBB = SI->getDefaultDest();
      //       outFile << "\n--- Default Block ---\n";
      //       defaultBB->print(outFile);

      //       // Use a set to avoid duplicate basic blocks
      //       std::set<BasicBlock*> printedBlocks;
      //       printedBlocks.insert(defaultBB);

      //       // Print all case blocks
      //       for (auto &Case : SI->cases()) {
      //           ConstantInt *CI = dyn_cast<ConstantInt>(Case.getCaseValue());
      //           BasicBlock *caseBlock = Case.getCaseSuccessor();
      //           if (printedBlocks.insert(caseBlock).second) { // only print if not already printed
      //               outFile << "\n--- Case Value: " << CI->getZExtValue() << " ---\n";
      //               caseBlock->print(outFile);
      //           }
      //       }
      //       for (auto &Case : SI->cases()) {
      //         if (ConstantInt *CI = dyn_cast<ConstantInt>(Case.getCaseValue())) {
      //           if (CI->getZExtValue() == VEHICLE_CMD_DO_SET_MODE) {
      //                         printf("Come inside!\n");
      //                         BasicBlock *caseBlock = Case.getCaseSuccessor();
      //                         errs() << "The basic block is:\n";
      //                         caseBlock->print(errs());
      //                         // Traverse to find insertion point (e.g., before 'break')
      //                         Instruction *insertionPt = caseBlock->getTerminator();
      //                         IRBuilder<> builder(insertionPt);
      
      //                         // Locate or extract your variables (base_mode, etc.)
      //                         // You may need to traverse instructions in this block or previous to extract them
      //                         Value *base_mode = findVariableValue(*set_mode_func,"base_mode");
      //                         builder.CreateCall(mode_entry,{base_mode});

      //                         // Value *custom_main_mode = ...;
      //                         // Value *custom_sub_mode = ...;
      //                         // Value *cmd_result = ...;
      
      //                         // injectCall(builder, set_mode_func, base_mode);
      //               }
      //             }
      //           }
      //         }
      //       }
      //     }
      ////////********* TODO: Working on it FOR PX4 (handle_command function) *******************//////////




      // Previous impelementation
    //   if (set_mode_func->arg_size() >= 2) {
    //     auto ArgIter = set_mode_func->arg_begin();
    //     std::advance(ArgIter, 1);  // Move to the second argument (Mode&)
    //     Argument *secondArg = &*ArgIter;

    //     // Ensure the second argument is a pointer to Mode object
    //     if (secondArg->getType()->isPointerTy()) {
    //         // Get the type of 'new_mode' (which is a reference to a Mode object)
    //       llvm::Type* newModeType = secondArg->getType();

    //       // If 'new_mode' is a pointer (which it likely is since it's passed as reference)
    //       if (llvm::PointerType* ptrType = llvm::dyn_cast<llvm::PointerType>(newModeType)) {
    //           // Dereference the pointer to get the underlying 'Mode' class type
    //           llvm::Type* modeType = ptrType->getElementType();

    //           // If the type is a struct, we can inspect its fields
    //           if (llvm::StructType* structType = llvm::dyn_cast<llvm::StructType>(modeType)) {
    //               // Assuming 'Number' is an enum inside Mode, find the field representing 'Number'
    //               // If you know the field's index or name (e.g., 'Number'), you can access it here:
    //               // In this case, 'Number' is the second element in 'Mode'
    //               llvm::Type* numberType = structType->getElementType(1);  // Index might vary

    //               // The underlying type of 'Number' is 'uint8_t', which corresponds to i8 in LLVM
    //               if (numberType->isIntegerTy(8)) {
    //                   llvm::errs() << "The deepest type of new_mode is uint8_t (i8).\n";

    //                     // Create an IRBuilder instance for inserting instructions
    //                     IRBuilder<> builder(set_mode_func->getContext());

    //                     // Set the insert point at the beginning of the function's entry block
    //                     builder.SetInsertPoint(&set_mode_func->getEntryBlock().front());

    //                     // Create the GEP (GetElementPtr) instruction to access the 'Number' field inside Mode
    //                     llvm::Value* gep = builder.CreateStructGEP(structType, secondArg, 1, "new_mode_field");

    //                     // Create the load instruction to load the value of 'Number' (which is uint8_t)
    //                     llvm::Value* newModeValue = builder.CreateLoad(gep, "new_mode_value");

    //                     // Create the call to mode_entry with newModeValue (uint8_t)
    //                     builder.CreateCall(mode_entry, {newModeValue});
    //               }
    //           }
    //       }
    //     }
    // } else {
    //     errs() << "Function " << set_mode_func->getName() << " does not have enough arguments.\n";
    // }
    ////////********* FOR ArduPlane *******************//////////


      // // Iterate over all basic blocks in `set_mode`
      // for (BasicBlock &BB : *set_mode_func) {
      //   for (Instruction &I : BB) {
      //     // Check if the instruction is a return instruction
      //     if (ReturnInst *retInst = dyn_cast<ReturnInst>(&I)) {
      //       // Check if it returns a constant true value
      //       if (ConstantInt *constInt = dyn_cast<ConstantInt>(retInst->getReturnValue())) {
      //         if (constInt->isOne()) { // Return true
      //             // Prepare arguments for the function call
      //             std::vector<Value *> args;
      //             auto ArgIter = set_mode_func->arg_begin();
      //             std::advance(ArgIter, 0); // Example if you need first argument
      //             args.push_back(&*ArgIter);

      //             // Create the call instruction
      //             CallInst *CI = CallInst::Create(mode_entry->getFunctionType(), mode_entry, args);

      //             // Insert the call instruction before the return true
      //             CI->insertBefore(retInst);

      //             errs() << "Inserted call to 'mode_entry' before 'return true'.\n";
      //         }
      //       }
      //     }
      //   }
      // }




      // ** Added for checking the switching mode functions ** //
      // LLVMContext &Context = M.getContext();
      // // Declare the printf function
      // std::vector<Type*> printfArgs;
      // printfArgs.push_back(Type::getInt8PtrTy(Context)); // const char*
      // FunctionType *printfType = FunctionType::get(
      //     Type::getInt32Ty(Context), // int return type
      //     printfArgs, 
      //     true                       // Variadic function
      // );
      // Function *printfFunc = cast<Function>(M.getOrInsertFunction("printf", printfType));

      // int j = 0; // Counter for messages
      // std::set<int> specificIndices = {22, 23, 9, 10};

      // for (Function &func : M) {
      //     std::string demangledName = demangle(func.getName().str().c_str());
      //     if (demangledName.find("set_mode") != std::string::npos) {
      //         i++;

      //         // Create a basic block iterator to find the entry block
      //         BasicBlock &entryBlock = func.getEntryBlock();

      //         IRBuilder<> builder(&entryBlock, entryBlock.begin());

      //         // Create the format string
      //         std::string formatStr = "I am from " + std::to_string(i) + "\n";
      //         Value *formatStrValue = builder.CreateGlobalStringPtr(formatStr);

      //         // Insert the printf call
      //         builder.CreateCall(printfFunc, {formatStrValue});
      //         if (specificIndices.count(i)) {
      //           errs() << "Function name for i=" << i << ": " << demangledName << "\n";
      //         }
      //     }
      // }
      // ** End of Added for checking the switching mode functions ** //


      // Ensure set_mode has the expected number of arguments
      // if (set_mode_func->arg_size() != 2) {
      //   errs() << "'set_mode' function does not have exactly 2 arguments.\n";
      //   return false;
      // }

      // Get the first argument (mode_id)

      // for (auto &arg : set_mode_func->args()) {
      //   errs() << "Original Argument type: ";
      //   arg.getType()->print(errs());
      //   errs() << "\n";

      //   // Check if the argument type is a pointer (likely representing %class.Mode*)
      //   if (arg.getType()->isPointerTy()) {
      //       // Get the integer type with 8 bits (i8) in the context
      //       Type *int8Type = Type::getInt8Ty(M.getContext());

      //       // Optionally create a cast to reinterpret as i8 if needed in the pass
      //       // IRBuilder<> Builder(&set_mode_func->getEntryBlock()); // or any other insertion point

      //       // Create the cast to i8 (if needed in instructions or transformations)
      //       // Value *castedArg = Builder.CreatePtrToInt(&arg, int8Type);
            
      //       errs() << "Reinterpreted Argument as i8: ";
      //       // castedArg->getType()->print(errs());
      //       errs() << "\n";
      //   } else if (arg.getType()->isIntegerTy(8)) {
      //       errs() << "This argument is already i8.\n";
      //   }
      // }
      
      // auto arg_iter = set_mode_func->arg_begin();
      // Argument* mode_id_arg = &*arg_iter; 

      // Instruction * GI = AddGlobalGEP(M, arg_iter);
      // Instruction * first = &*(&*set_mode_func->begin())->begin();
      // Id->insertBefore(first);




      // vector<Value *> args;
      // args.push_back(arg_iter);  // Assuming this is the mode argument

      // CallInst *CI = CallInst::Create(mode_entry->getFunctionType(), mode_entry, ArrayRef<Value *>(args));
      // CI->insertBefore(first);
      // Instruction * Newfirst = &*(&*set_mode_func->begin())->begin();

      // errs() << "Inserted call to 'mode_entry' at the beginning of 'set_mode'. " << *Newfirst << "\n";

      // Instruction * first = &*(&*func->begin())->begin();
      // ConstantInt * Id = ConstantInt::get(IntegerType::get(M.getContext(), 32), num_instrumented);
      // vector<Value *> args;
      // args.push_back(Id);
      // CallInst * CI = CallInst::Create(mode_entry->getFunctionType(), mode_entry, ArrayRef<Value *>(args));
      // CI->insertBefore(first);
      
      return true;
    }
  };
}

char TrackInst::ID = 0;
static RegisterPass<TrackInst> X("track-funcs", "profiling functions", false, false);
