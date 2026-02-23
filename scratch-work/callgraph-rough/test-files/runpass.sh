# make sure the following environment variables are set:
#   $DSL_PATH
# and make sure SVF is built

# # assume SVF is already build, set up environment variables
# cd $DSL_PATH/repo/SVF
# . ./setup.sh

cd $DSL_PATH/rvd-callgraph/SVF-example
bash runpass.sh

# ensure the correct number of parameters are passed
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 dir_name graphviz_flag"
    exit 1
fi

# pass the name of your test as the first parameter
# your test should exist as test-files/$TEST_NAME/$TEST_NAME.cpp 
TEST_NAME=${1}

# the second parameter should specify whether to use graphviz or not
# it should equal 1 if yes or 0 for no
USE_GRAPH_VIZ=${2}

# navigate to your test file's directory
if cd $DSL_PATH/rvd-callgraph/test-files/$TEST_NAME; then
    # clean the current repository
    bash ../clean.sh $TEST_NAME

    # compile your file to llvm bitcode
    clang -O0 -emit-llvm -c $TEST_NAME.cpp -o $TEST_NAME.bc

    # run svf on your file
    # $DSL_PATH/rvd-callgraph/SVF-example/build/src/svf-example -dump-callgraph $TEST_NAME.bc
    wpa -ander -dump-callgraph test1.bc
    # dda -ander -dump-callgraph $TEST_NAME.bc
    # wpa -type -dump-icfg $TEST_NAME.bc

    # use graphviz to generate callgraph png file
    if [ $USE_GRAPH_VIZ ]; then
        dot -Tpng callgraph_final.dot -o callgraph_final.png
        dot -Tpng callgraph_initial.dot -o callgraph_initial.png
    fi
fi