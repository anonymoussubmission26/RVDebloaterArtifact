export LLVM_COMPILER=clang
export CXXFLAGS="-stdlib=libc++"
export LDFLAGS="-stdlib=libc++"
# export WLLVM_OUTPUT_LEVEL=DEBUG

bash ~/ap-callgraph/scripts/rebuild-gllvm.sh

cd ~/ardupilot
./waf distclean
CXX=gclang++ CC=gclang ./waf configure --board sitl --debug -j5
# CXX=clang++ CC=clang ./waf configure --board sitl --debug -j5

# ./waf plane -j5 2>&1 | tee ~/ap-callgraph/ap-build-log.txt
./waf copter -j5 2>&1 | tee ~/ap-callgraph/ap-build-log.txt
# ./waf copter > ~/ap-callgraph/ap-build-log.txt 2>&1

get-bc ~/ardupilot/build/sitl/bin/arducopter
# get-bc ~/ardupilot/build/sitl/bin/arduplane

# llc -filetype=obj arduplane.bc

# sim_vehicle.py -v plane -f quadplane --console --map -w -N
sim_vehicle.py -v copter --console --map -w -N
