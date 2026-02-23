#!/bin/bash -e

echo "--- Setting Environment Variables ---"
# Set Repository Environment Variables
export RVD_PATH=${RVD_PROJ}/RVDebloater
export AP_PATH=${RVD_PROJ}/ardupilot
# export SVF_PATH=${RVD_PROJ}/SVF
export SVF_PATH=${RVD_PATH}/SVF
# export LLVM_BUILD_DIR=${RVD_PROJ}/llvm-7/bin
export LLVM_BUILD_DIR=${RVD_PROJ}/llvm-project/bin
export AUTOTEST_BASE=${AP_PATH}/Tools/autotest
export PATH=${RVD_PROJ}/llvm-project/bin:$PATH

# Set some variables for our script
SIM_V_SCRIPT="${AUTOTEST_BASE}/sim_vehicle.py"
# AUTO_MISSION="${AUTOTEST_BASE}/run_mission.py"
# AUTO_MISSION="${AUTOTEST_BASE}/run_missionPlane.py"
AUTO_MISSION="${AUTOTEST_BASE}/run_missionRover.py"
INST_AP_SCRIPT="${RVD_PATH}/scripts/dependent/instrument-ap.sh"
# GEN_CG_SCRIPT="${RVD_PATH}/scripts/callgraph/generate-callgraphs.sh"
# GEN_CG_SCRIPT="${RVD_PATH}/scripts/callgraph/plane-generate-callgraphs.sh"
GEN_CG_SCRIPT="${RVD_PATH}/scripts/callgraph/rover-generate-callgraphs.sh"

BUILD_LOG_PATH="${RVD_PATH}/build-logs/ap-build-log.txt"
# RECOMP_FLAGS=(-no-pie -Wl,--export-dynamic -lpthread -lapr-1 -laprutil-1 -lpcre -o) # This doesn't work but it's the flags 
# RECOMP_FLAGS=(-no-pie -Wl,--export-dynamic -lpthread -lapr-1 -laprutil-1 -lpcre -lc++ -lc++abi -lm -lc -Wl,--wrap=malloc -o) # TODO: check these flags
RECOMP_FLAGS=(-no-pie -Wl,--gc-sections -lc++ -lc++abi -lm -lc -Wl,--wrap=malloc -Wl,--undefined=call_motors_shutdown_wrapper) 
LLVM_CLANG="${LLVM_BUILD_DIR}/clang"

# FRAME_ARG not needed for copter, set to "-f [frame]" if needed, 
# e.g. for VEHICLE="plane" => FRAME_ARG="-f quadplane"

# Use these for copter
# export VEHICLE="copter"
# FRAME_ARG=""

# Use these for plane
# export VEHICLE="plane"
# FRAME_ARG="-f quadplane"

export VEHICLE="rover"
FRAME_ARG=""

export BOARD="sitl" # or linux (or `run ./waf list_boards` in `$AP_PATH` to get other options)
# export BOARD="CubeBlack" # For real device

export AP_BIN="${AP_PATH}/build/${BOARD}/bin"
EXECF_NAME="ardu${VEHICLE}"
export BCF_NAME="ardu${VEHICLE}.bc"
OBJF_NAME="ardu${VEHICLE}.o"

# Set Environment Variables for Build (check `gllvm` is in the `PATH`, if not, add `go` and `gllvm` to PATH)
if ! which gclang 2>&1; then
    # Add go to the path
    export PATH=${PATH}:/usr/local/go/bin # go is here
    # Add GLLVM to path
    export PATH=${PATH}:$(go env GOPATH)/bin # gllvm is here (e.g., ${HOME}/go/bin)
fi

# Set this variable for GLLVM to find its compiler
export LLVM_COMPILER=clang

# For llvm clang 13 use the following   # Note: clang 13 is not working yet
# export PATH=${HOME}/llvm-project/build/bin:${PATH}

# For clang 7
export CXXFLAGS="-stdlib=libc++ -D_GLIBCXX_USE_CXX11_ABI=0"
export LDFLAGS="-stdlib=libc++ -lc++abi -lm"



# For Aion Rover
# Set to ARM Cortex-M4 Compiler (e.g., arm-none-eabi)
# export CC=arm-none-eabi-gcc
# export CXX=arm-none-eabi-g++
# export AS=arm-none-eabi-as
# Set additional flags
# export CXXFLAGS="-mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16"
# export LDFLAGS="-mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16"

# For clang 14 use the following
# export PATH=/usr/bin:${PATH}

# Set to clang 16
# echo "--- Set Clang to Version 16 from SVF ---"
# cd $SVF_PATH
# . ./setup.sh

# Comment out the following 2 lines for llvm clang 13
# export CXXFLAGS="-stdlib=libc++"
# export LDFLAGS="-stdlib=libc++ -lc++abi"

# Uncomment the line below to add debug statements
# export WLLVM_OUTPUT_LEVEL=DEBUG

# Build ArduPilot
echo "--- Building Vehicle Executable for ${BOARD} ---"
cd ${AP_PATH}
# # Clean the build and configure directories
./waf distclean 
# # Configure waf build system with gclang instead of default compiler (other commands are in "RVDebloater/scratch-work/README.m")
CXX=gclang++ CC=gclang ./waf configure --board ${BOARD} --debug -j5
# For Aion Rover
# ./waf configure --board ${BOARD} -j5
# # Build the vehicle executable
./waf "${VEHICLE}" -j5 2>&1 | tee "${BUILD_LOG_PATH}" # Generated executable file is located inside ${AP_BIN}, e.g. rvd_project/ardupilot/build/sitl/bin/arducopter
echo "--- Finished Generating Vehicle Executable ---"

# Extract bitcode
echo "--- Extracting Bitcode ---"
cd "${AP_BIN}"
get-bc $EXECF_NAME # Generated bitcode file which is located inside ${AP_BIN}, e.g. rvd_project/ardupilot/build/sitl/bin/arducopter.bc
echo "--- Finished Extracting Bitcode ---"

# Run script to generate callgraphs
echo "--- Running Generate Callgraph Script ---"
# ${GEN_CG_SCRIPT}
echo "--- Finished Generate Callgraph Script ---"

# Instrument the ArduPilot bitcode
echo "--- Running Instrumentation Script ---"
${INST_AP_SCRIPT}
echo "--- Finished Instrumentaion Script ---"

# Compile bitcode back to exec
echo "--- Generating Instrumented Executable from Bitcode ---"
# Rename uninstrumented executable so it isn't overwritten
mv "${EXECF_NAME}" "${EXECF_NAME}"-uninstr # We store uninstrumented executable in ${AP_BIN}, e.g. rvd-project/ardupilot/build/sitl/bin
# Generate instrumented object file from instrumented bitcode (use one of these following two commands)
# llc -filetype=obj "${BCF_NAME}" # We store our instrumented executable also in ${AP_BIN}, e.g. rvd-project/ardupilot/build/sitl/bin
# "--target=${TARGET}" "-march=${MARCH}" "-mcpu=${MCPU}" "${BCF_NAME}" -c
# "${LLVM_CLANG}" -c "${BCF_NAME}" -o "${OBJF_NAME}" -O0 # Removed -g, maybe we need it
echo "--- Object File Generated ---"
# Generate instrumented executable from object file
echo "--- Generating Instrumented Executable File from Object File ---"
# "${LLVM_CLANG}" "${AP_BIN}/${OBJF_NAME}" "${RECOMP_FLAGS[@]}" "${AP_BIN}/${EXECF_NAME}" -v # Removed -g, maybe we need it #-T "${RVD_PATH}/profiles/custom.ld"
"${LLVM_CLANG}" "${BCF_NAME}" -flto -O2 -ffunction-sections -fdata-sections "${RECOMP_FLAGS[@]}" -o "${AP_BIN}/${EXECF_NAME}"
strip --strip-debug "${AP_BIN}/${EXECF_NAME}"
echo "--- Finished Generating Instrumented Executable ---"

# Copy instrumented and uninstrumneted exectuables to instrumentation directory rvd-project/RVDebloater/instrumentation
echo "--- Copying Executables to Instrumentation Directory ---"
cp "${EXECF_NAME}"-uninstr ${RVD_PROJ}/RVDebloater/instrumentation/"${EXECF_NAME}"-uninstr
cp "${EXECF_NAME}" ${RVD_PROJ}/RVDebloater/instrumentation/"${EXECF_NAME}"-instr
cp "${EXECF_NAME}" ${RVD_PROJ}/RVDebloater/profiles/"${EXECF_NAME}"
cp "${EXECF_NAME}" ${RVD_PROJ}/RVDebloater/outputs/"${EXECF_NAME}"

# Uncomment below instructions after having mode_profile
# echo "--- Extraction Script for Profiles ---"
# cd ${RVD_PROJ}/RVDebloater/profiles
# # python3 FunctionsName_to_Mode.py 
# python3 identifyAddress.py
# cd ${AP_PATH}
# echo "--- Finished Extraction Script ---"

# echo "--- Start Address Script for Static Analysis ---"
# cd ${RVD_PROJ}/RVDebloater/outputs
# python3 identifyAddress.py
# cd ${AP_PATH}
# echo "--- Finished Script ---"

# Run the simulation for ${VEHICLE} and ${BOARD}
echo "--- Running Simulation ---"
# time ${SIM_V_SCRIPT} -v ${VEHICLE} ${FRAME_ARG} --console --map -w -N #28 Jan 2025: Uncomment it if you want manually run RV
# 28 Jan 2025: I added these below commands for running RV automatically with different missions
cp ${RVD_PATH}/scripts/run_missionRover.py ${AUTOTEST_BASE}
cp -r ${RVD_PATH}/mission ${AUTOTEST_BASE}/
# cd ${AP_PATH}/ArduCopter
# cd ${AP_PATH}/ArduPlane
cd ${AP_PATH}/Rover
${AUTO_MISSION}

# -v parameter is not required if you are already in the correct directory i.e. ${AP_PATH}/ArduCopter, ${AP_PATH}/ArduPlane, etc.
# ${SIM_V_SCRIPT} ${FRAME_ARG} --console --map -w -N
