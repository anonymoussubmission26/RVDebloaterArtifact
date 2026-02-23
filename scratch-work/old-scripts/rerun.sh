export LLVM_COMPILER=clang
export CXXFLAGS="-stdlib=libc++"
export LDFLAGS="-stdlib=libc++ -lc++abi"

# uncomment the line below to add debug statements
# export WLLVM_OUTPUT_LEVEL=DEBUG

# uncomment to rebuild gllvm if necessary
# bash ~/ap-callgraph/scripts/rebuild-gllvm.sh

# clean, compile and build ardupilot
cd ~/ardupilot
./waf distclean
CXX=gclang++ CC=gclang ./waf configure --board sitl -j5
./waf copter -j5 2>&1 | tee ~/ap-callgraph/ap-build-log.txt

# extract bitcode
cd ~/ardupilot/build/sitl/bin/
get-bc arducopter

# ...run our instrumentation here on arducopter.bc

# now copmile bitcode back to exec
mv arducopter arducopter_uninstr # rename uninstrumented executable so it isn't overwritten
clang -c -g arducopter.bc -o arducopter.o
clang -g arducopter.o -no-pie -Wl,--export-dynamic -lpthread -lapr-1 -laprutil-1 -lpcre -lc++ -lc++abi -lm -lc -Wl,--wrap=malloc -o arducopter

# uncomment the line below to reun the simulation
sim_vehicle.py -v copter --console --map -w -N