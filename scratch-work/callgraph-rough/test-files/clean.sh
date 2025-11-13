# make sure the following environment variables are set:
#   $DSL_PATH

# ensure the correct number of parameters are passed
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 dir_name"
    exit 1
fi

# pass the name of your test as the first parameter
# your test should exist as test-files/$TEST_NAME/$TEST_NAME.cpp 
TEST_NAME=${1}

# ensure that $TEST_NAME specifies a valid directory
if cd $DSL_PATH/rvd-callgraph/test-files/$TEST_NAME; then
    # remove all files that aren't the main test .cpp file
    find . -type f ! -name "${TEST_NAME}.cpp" -exec rm -f {} +
fi