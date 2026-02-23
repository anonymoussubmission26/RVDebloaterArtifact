#!/bin/bash -e
# export PATH=/usr/bin:$PATH


echo "--- Setting Environment Variables ---"
# Set Repository Environment Variables
# export LLVM_DIR=${RVD_PROJ}/llvm-project
# export LLVM_BUILD_DIR=${LLVM_DIR}/bin

export LLVM_BUILD_DIR=/usr/lib/llvm-14/bin
export RVD_PATH=${RVD_PROJ}/RVDebloater

export PX_PATH=${RVD_PROJ}/PX4-Autopilot
export PX_BIN=${RVD_PROJ}/PX4-Autopilot/build/px4_sitl_default/bin
# export PX_BIN=${RVD_PROJ}/PX4-Autopilot/build/px4_fmu-v5_default/bin

export PATH=/usr/lib/llvm-14/bin:$PATH #It works if you install original gllvm (not ap-gllvm). You should change "install-ap-gllvm"
# export PATH=~/rvd-project/llvm-project/bin:$PATH
LLVM_CLANG="${LLVM_BUILD_DIR}/clang"
export BCF_NAME="px4.bc"
export EXECF_NAME="px4"
# INST_AP_SCRIPT="${RVD_PATH}/scripts/dependent/instrument-ap-PX.sh"
INST_AP_SCRIPT="${RVD_PATH}/scripts/dependent/instrument-px.sh"


# Set Environment Variables for Build (check `gllvm` is in the `PATH`, if not, add `go` and `gllvm` to PATH)
if ! which gclang 2>&1; then
    # Add go to the path
    export PATH=${PATH}:/usr/local/go/bin # go is here
    # Add GLLVM to path
    export PATH=${PATH}:$(go env GOPATH)/bin # gllvm is here (e.g., ${HOME}/go/bin)
fi

export CC=gclang
export CXX=gclang++
export CFLAGS="-w -fno-fat-lto-objects"
export CXXFLAGS="-w -fno-fat-lto-objects"
export LDFLAGS="-fno-lto -fuse-ld=gold"

# # Build ArduPilot
echo "--- Building Vehicle Executable ---"
cd ${PX_PATH}
# cmake -S . -B build/px4_sitl_default -G Ninja -DCMAKE_BUILD_TYPE=Debug -DBLAS_LIBRARIES=/usr/lib/x86_64-linux-gnu/openblas-pthread/libblas.so \
#     -DLAPACK_LIBRARIES=/usr/lib/x86_64-linux-gnu/openblas-pthread/liblapack.so \
#     -DBOOST_ROOT=/usr/include/boost \
#     -DBOOST_LIBRARYDIR=/usr/lib/x86_64-linux-gnu \
#     -DProtobuf_INCLUDE_DIR=/usr/include \
#     -DProtobuf_LIBRARIES=/usr/lib/x86_64-linux-gnu/libprotobuf.so \
#     -DCMAKE_PREFIX_PATH="/usr/lib/x86_64-linux-gnu/cmake/sdformat9;/usr/lib/x86_64-linux-gnu/cmake/ignition-math6;/usr/lib/x86_64-linux-gnu/cmake/ignition-transport8;/usr/lib/x86_64-linux-gnu/cmake/ignition-msgs5;/usr/lib/x86_64-linux-gnu/cmake/ignition-common3;/usr/local/lib/tinyobjloader/cmake;/usr/lib/x86_64-linux-gnu/cmake/ignition-common3-graphics;/usr/lib/x86_64-linux-gnu/cmake/ignition-fuel_tools4" \
#     -DCMAKE_LIBRARY_PATH="/usr/lib/x86_64-linux-gnu:/lib/x86_64-linux-gnu" \
#     -DDL_FOUND=TRUE \
#     -DDL_LIBRARIES=/usr/lib/x86_64-linux-gnu/libdl.so.2
# ninja -C build/px4_sitl_default

# px4_fmu-v5_default
# cmake -S . -B build/px4_sitl_default -G Ninja -DCMAKE_BUILD_TYPE=Debug \
#     -DBLAS_LIBRARIES=/usr/lib/x86_64-linux-gnu/openblas-pthread/libblas.so \
#     -DLAPACK_LIBRARIES=/usr/lib/x86_64-linux-gnu/openblas-pthread/liblapack.so \
#     -DBOOST_ROOT=/usr/include/boost \
#     -DBOOST_LIBRARYDIR=/usr/lib/x86_64-linux-gnu \
#     -DProtobuf_INCLUDE_DIR=/usr/include \
#     -DProtobuf_LIBRARIES=/usr/lib/x86_64-linux-gnu/libprotobuf.so \
#     -DCMAKE_PREFIX_PATH="/usr/lib/x86_64-linux-gnu/cmake/sdformat9;/usr/lib/x86_64-linux-gnu/cmake/ignition-math6;/usr/lib/x86_64-linux-gnu/cmake/ignition-transport8;/usr/lib/x86_64-linux-gnu/cmake/ignition-msgs5;/usr/lib/x86_64-linux-gnu/cmake/ignition-common3;/usr/local/lib/tinyobjloader/cmake;/usr/lib/x86_64-linux-gnu/cmake/ignition-common3-graphics;/usr/lib/x86_64-linux-gnu/cmake/ignition-fuel_tools4" \
#     -DCMAKE_LIBRARY_PATH="/usr/lib/x86_64-linux-gnu:/lib/x86_64-linux-gnu" \
#     -DDL_FOUND=TRUE \
#     -DDL_LIBRARIES=/usr/lib/x86_64-linux-gnu/libdl.so.2 \
#     -DCONFIG_ROVER=ON  # Enabling ground vehicle config

cmake -S . -B build/px4_sitl_default -G Ninja -DCMAKE_BUILD_TYPE=Debug \
  -DCMAKE_C_COMPILER=$CC -DCMAKE_CXX_COMPILER=$CXX \
  -DBLAS_LIBRARIES=/usr/lib/x86_64-linux-gnu/openblas-pthread/libblas.so \
  -DLAPACK_LIBRARIES=/usr/lib/x86_64-linux-gnu/openblas-pthread/liblapack.so \
  -DBOOST_ROOT=/usr/include/boost \
  -DBOOST_LIBRARYDIR=/usr/lib/x86_64-linux-gnu \
  -DProtobuf_INCLUDE_DIR=/usr/include \
  --DProtobuf_LIBRARY=/usr/lib/x86_64-linux-gnu/libprotobuf.so \
  -DTBB_DIR=/usr/lib/x86_64-linux-gnu/cmake/TBB \
  -DCMAKE_EXE_LINKER_FLAGS="-no-pie" \
  -DCMAKE_PREFIX_PATH="/usr/lib/x86_64-linux-gnu/cmake/sdformat9;/usr/lib/x86_64-linux-gnu/cmake/ignition-math6;/usr/lib/x86_64-linux-gnu/cmake/ignition-transport8;/usr/lib/x86_64-linux-gnu/cmake/ignition-msgs5;/usr/lib/x86_64-linux-gnu/cmake/ignition-common3;/usr/local/lib/tinyobjloader/cmake;/usr/lib/x86_64-linux-gnu/cmake/ignition-common3-graphics;/usr/lib/x86_64-linux-gnu/cmake/ignition-fuel_tools4" \
  -DDL_FOUND=TRUE \
  -DDL_LIBRARIES=/lib/x86_64-linux-gnu/libdl.so \
  -DCONFIG_ROVER=ON

ninja -C build/px4_sitl_default

# make px4_sitl_default gazebo-classic_iris


# make px4_sitl gazebo-classic_iris_ide

# make px4_sitl_default
echo "--- Finished Generating Vehicle Executable ---"

# echo "--- Building Gazebo ---"
# cd ${PX_PATH}/Tools/simulation/gazebo-classic/sitl_gazebo-classic
# rm -rf build
# mkdir build
# # export _MAVLINK_INCLUDE_DIR=${PX_PATH}/src/modules/mavlink/mavlink/include
# cd build
# cmake .. 
# make -j$(nproc)
# echo "--- Finished Building Gazebo ---"


# Check if the build directory exists, meaning it's already been built
# if [ ! -d "build/px4_sitl_default" ]; then
#   echo "Building the SITL executable..."
#   make px4_sitl_default CLANG=1
# else
#   echo "SITL already built. Skipping build step."
# fi

# Build Gazebo Classic plugins
# echo "--- Building Gazebo Classic Plugins ---"
# cd ${PX_PATH}
# DONT_RUN=1 make px4_sitl_default gazebo_classic


# Extract bitcode
echo "--- Extracting Bitcode ---"
cd "${PX_BIN}"
get-bc $EXECF_NAME # Generated bitcode file which is located inside ${AP_BIN}, e.g. rvd_project/ardupilot/build/sitl/bin/arducopter.bc
echo "--- Finished Extracting Bitcode ---"

# Now launch Gazebo
# cd ${PX_PATH}
# make px4_sitl_default gazebo

# echo " --- New HERE --"
# cd ${PX_PATH}
# DONT_RUN=1 make px4_sitl_default gazebo_iris
# source ./Tools/simulation/gazebo-classic/setup_gazebo.bash ${PX_PATH} ${PX_BIN}
# export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:${PX_PATH}:${PX_PATH}/Tools/simulation/gazebo-classic
# gazebo --verbose ${PX_PATH}/Tools/simulation/gazebo-classic/sitl_gazebo-classic/worlds/iris_irlock.world




# Instrument the ArduPilot bitcode
echo "--- Running Instrumentation Script ---"
# cp "${EXECF_NAME}" "${EXECF_NAME}"-uninstr
${INST_AP_SCRIPT}
echo "--- Finished Instrumentaion Script ---"

# Compile bitcode back to exec
echo "--- Generating Instrumented Executable from Bitcode ---"
cd "${PX_BIN}"
mv "${EXECF_NAME}" "${EXECF_NAME}"-uninstr
# "${LLVM_CLANG}" -o "${EXECF_NAME}" ${BCF_NAME} -no-pie -Wl,-z,notext \
#  -lpthread -ldl -lm -lrt -lstdc++ -lprotobuf \
#  -lgz-msgs10 \
#  -lgz-transport13 -lignition-math6 -lignition-msgs5 -lignition-common3 \
#  -lignition-transport8 -lignition-fuel_tools4 \
#  -L/usr/lib/x86_64-linux-gnu
# cd "${PX_PATH}" 
"${LLVM_CLANG}" ${BCF_NAME} \
  -flto -O2 -ffunction-sections -fdata-sections -fuse-ld=lld \
  -Wl,-z,notext,--gc-sections \
  -no-pie \
  -ldl -lm -lrt -lstdc++ -lprotobuf \
  -lgz-msgs10 -lgz-transport13 -lignition-math6 -lignition-msgs5 -lignition-common3 \
  -lignition-transport8 -lignition-fuel_tools4 \
  -L/usr/lib/x86_64-linux-gnu \
  -o "${EXECF_NAME}"
strip --strip-debug ${EXECF_NAME}
echo "--- Finished Generating Instrumented Executable from Bitcode ---"


# Copy instrumented and uninstrumneted exectuables to instrumentation directory rvd-project/RVDebloater/instrumentation
echo "--- Copying Executables to Instrumentation Directory ---"
cp "${EXECF_NAME}"-uninstr ${RVD_PROJ}/RVDebloater/instrumentation/"${EXECF_NAME}"-uninstr
cp "${EXECF_NAME}" ${RVD_PROJ}/RVDebloater/instrumentation/"${EXECF_NAME}"-instr
cp "${EXECF_NAME}" ${RVD_PROJ}/RVDebloater/profiles/"${EXECF_NAME}"
cp "${EXECF_NAME}" ${RVD_PROJ}/RVDebloater/outputs/"${EXECF_NAME}"
echo "--- Finished Copying Executables to Instrumentation Directory ---"

# Uncomment below instructions after having mode_profile
echo "--- Extraction Script for Profiles ---"
cd ${RVD_PROJ}/RVDebloater/profiles
python3 identifyAddress.py
cd ${AP_PATH}
echo "--- Finished Extraction Script ---"

MODEL_DIR="${PX_PATH}/Tools/simulation/gazebo-classic/sitl_gazebo-classic/models/iris"

# Ensure correct model.sdf exists
if [ ! -f "${MODEL_DIR}/iris.sdf" ]; then
    echo "iris.sdf not found. Trying to create it from iris.sdf.jinja..."
    cp "${MODEL_DIR}/iris.sdf.jinja" "${MODEL_DIR}/iris.sdf"
fi

# Fix model.config to match what PX4 expects
cat > "${MODEL_DIR}/model.config" <<EOF
<?xml version="1.0"?>
<model>
  <name>iris</name>
  <version>1.0</version>
  <sdf version='1.6'>iris.sdf</sdf>

  <author>
   <name>Lorenz Meier and Thomas Gubler</name>
   <email>lorenz@px4.io</email>
  </author>

  <description>
    This is a model of the 3DR Iris Quadrotor.
  </description>
</model>
EOF

model_directory="${PX_PATH}/Tools/simulation/gazebo-classic/sitl_gazebo-classic/models"

# unset GAZEBO_MODEL_PATH
# export GAZEBO_MODEL_PATH=${PX_PATH}/Tools/simulation/gazebo-classic/sitl_gazebo-classic/models

# source ${PX_PATH}/Tools/simulation/gazebo-classic/setup_gazebo.bash ${PX_PATH} ${PX_BIN}

# Launch SITL
"${PX_PATH}/Tools/simulation/gazebo-classic/sitl_run.sh" \
  "${PX_BIN}/px4" none iris none "${PX_PATH}" "${PX_PATH}/build/px4_sitl_default" 



# sleep 3

# # Run PX4 with Gazebo (No need to rebuild PX4, just run your custom executable)
# echo "--- Launching PX4 with Gazebo ---"
# # Source Gazebo setup script
# source ${PX_PATH}/Tools/simulation/gazebo-classic/setup_gazebo.bash ${PX_PATH} ${PX_BIN}
# export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:${PX_PATH}:${PX_PATH}/Tools/simulation/gazebo-classic

# # Launch Gazebo with PX4
# gazebo --verbose ${PX_PATH}/Tools/simulation/gazebo-classic/sitl_gazebo-classic/worlds/iris_irlock.world
