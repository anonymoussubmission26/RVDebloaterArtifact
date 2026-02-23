#export LLVM_COMPILER=clang
export CXXFLAGS="-stdlib=libc++"
export LDFLAGS="-stdlib=libc++"
# export WLLVM_OUTPUT_LEVEL=DEBUG

bash ~/ap-callgraph/scripts/rebuild-gllvm.sh

cd ~/ardupilot
./waf distclean
CXX=clang++ CC=clang ./waf configure --board sitl -j5

# I wonder if multithreading is messing with the compilation process
# edit: i dont think it is
./waf copter -j5 > ~/ap-callgraph/ap-build-log.txt 2>&1
# ./waf copter > ~/ap-callgraph/ap-build-log.txt 2>&1

#get-bc ~/ardupilot/build/sitl/bin/arducopter
