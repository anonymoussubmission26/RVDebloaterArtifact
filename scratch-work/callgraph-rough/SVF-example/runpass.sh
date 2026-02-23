# assume SVF is already build, set up environment variables

conda deactivate
cd $DSL_PATH/repos/SVF
source ./build.sh
. ./setup.sh

# return to rvd-callgraph/SVF-example
cd $DSL_PATH/rvd-callgraph/SVF-example

./env.sh

rm -rf build
mkdir build

cd build
cmake ..
make

# ./src/svf-example -dump-callgraph ../example.ll
# dot -Tpng callgraph_final.dot -o callgraph_final.png
# dot -Tpng callgraph_initial.dot -o callgraph_initial.png