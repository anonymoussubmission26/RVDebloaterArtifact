export LLVM_COMPILER=clang
export CXXFLAGS="-stdlib=libc++"
export LDFLAGS="-stdlib=libc++"
# export WLLVM_OUTPUT_LEVEL=DEBUG

bash ~/ap-callgraph/scripts/rebuild-gllvm.sh

cd ~/ardupilot

./waf distclean
cd ArduPlane
CXX=gclang++ CC=gclang sim_vehicle.py -f quadplane --console --map -w -D
# CXX=clang++ CC=clang sim_vehicle.py -v copter --console --map -w -D -G

#/home/luke/ardupilot/modules/waf/waf-light configure --board sitl
#/home/luke/ardupilot/modules/waf/waf-light copter

