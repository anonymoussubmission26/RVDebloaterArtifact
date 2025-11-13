#!/bin/bash -e

echo "--- Adding Instrumentation to ArduPilot Bitcode ---"
export LLVM_BUILD_DIR=/usr/lib/llvm-14/bin
export PATH=/usr/lib/llvm-14/bin:$PATH 

# export LLVM_BUILD_DIR=${RVD_PROJ}/llvm-project/build
# OPT="${LLVM_BUILD_DIR}/bin/opt"
# LLVMAUTOPATCHFIRST="${LLVM_BUILD_DIR}/lib/LLVMRVDebloaterInst.so"

# LINE_TO_ADD='add_subdirectory(RVDebloater/RVDebloaterInst)'
# FILE="${RVD_PROJ}/llvm-project/llvm/lib/Transforms/CMakeLists.txt"

# LLVM_PASS_SRC_FOLDER=${RVD_PROJ}/llvm-project/llvm/lib/Transforms/RVDebloater
# mkdir -p ${LLVM_PASS_SRC_FOLDER}

# Navigate to instrumentation working directory
cd ${RVD_PATH}/instrumentation

# Copy uninstrumented bitcode to working directory
echo "--- Copying Bitcode to Working Directory ---"
# We will store an instrumented and uninstrumented copy of the bitcode in rvd-project/RVDebloater/instrumentation
cp ${PX_BIN}/${BCF_NAME} px4-uninstr.bc

make

# *** VERY IMPORTANT NOTE (7 Apr): Removed many redundant instructions from these functions for memory overhead (if you need them check []_main.c functions.) ***
# For iris
llvm-link px4-uninstr.bc req_funcs_px4.bc -o px4-uninstr-linked.bc


# llvm-link -o=ardu${VEHICLE}-uninstr-linked.bc ardu${VEHICLE}-uninstr.bc req_funcs.bc

# TODO: the order of runnig these two passes are important?!
# opt -load ./lib/AddDPFuncs.so -enable-new-pm=0 -dp-funcs px4-uninstr-linked.bc -o px4-instr-linked.bc
opt -load ./lib/CallOverwrite.so -enable-new-pm=0 -overwrite-call px4-uninstr-linked.bc -o px4-instr-linked.bc
# opt -load ./lib/AddTrack.so -enable-new-pm=0 -track-funcs px4-instr-linked.bc -o px4-instr-linked.bc
opt -load ./lib/AddEnforce.so -enable-new-pm=0 -enforce-funcs px4-instr-linked.bc -o px4-instr-linked.bc

# opt -load ./lib/AddAttr.so -add-attr ardu${VEHICLE}-instr-linked.bc -o ardu${VEHICLE}-instr-linked.bc

# opt -load ./lib/CheckDPFuncs.so -print-log-fn-instr ardu${VEHICLE}-instr-linked.bc -o ardu${VEHICLE}-instr-linked-copy.bc


# Build LLVM with LLVMAutoPatchFirst
# mkdir -p $LLVM_PASS_SRC_FOLDER/RVDebloaterInst
# cp ./RVDebloaterInstPass.cpp ./CMakeLists.txt ./Hello.exports $LLVM_PASS_SRC_FOLDER/RVDebloaterInst/.
# # Check if the line is already present in the file
# if ! grep -Fxq "$LINE_TO_ADD" "$FILE"; then
#     # If the line is not found, add it to the file
#     echo "$LINE_TO_ADD" >> "$FILE"
# fi
# # echo 'add_subdirectory(RVDebloater/RVDebloaterInst)' >> ${RVD_PROJ}/llvm-project/llvm/lib/Transforms/CMakeLists.txt
# cd "${LLVM_BUILD_DIR}"
# ninja

# "${OPT}" -S -enable-new-pm=0 -load "${LLVMAUTOPATCHFIRST}" -time-passes -instrumentcode ${RVD_PATH}/instrumentation/ardu${VEHICLE}-uninstr.bc -o ${RVD_PATH}/instrumentation/ardu${VEHICLE}-instr.bc

# TODO: Run LLVM Pass on arducopter-uninstr.bc to produce arducopter-instr.bc and then delete the following line
# For now we just rename arducopter-uninstr.bc to arducopter.bc
# cp ardu${VEHICLE}-uninstr.bc ardu${VEHICLE}-instr.bc # Delete this eventually

# Copy instrumented bitcode back to ardupilot bin directory
echo "--- Copying Instrumented Bitcode to Ardupilot Bin ---"
cp ${RVD_PATH}/instrumentation/px4-instr-linked.bc ${PX_BIN}/${BCF_NAME}
# cp ${RVD_PATH}/instrumentation/ardu${VEHICLE}-uninstr-linked.bc ${AP_BIN}/${BCF_NAME}

# Also copy uninstrumented bitcode to ardupilot bin directory
echo "--- Copying Uninstrumented Bitcode to Ardupilot Bin ---"
cp ${RVD_PATH}/instrumentation/px4-uninstr.bc ${PX_BIN}/px4-uninstr.bc

echo "--- Finished Instrumenting ArduPilot Bitcode ---"
