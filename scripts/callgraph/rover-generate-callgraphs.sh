#!/bin/bash -e

# Configure SVF
echo "--- Configuring SVF ---"
export SVF_HOME=$SVF_PATH
export PATH=$SVF_HOME/Release-build/bin:$PATH
export CALLGRAPH_DIR=${RVD_PATH}/scripts/callgraph

# Navigate to the SVF directory
cd ${SVF_PATH}

# Build SVF
# source ./build.sh # Don't use "source" if you just run this command directly in the terminal 

# Setup SVF and add it to ${PATH}
# . ./setup.sh
# echo "--- Finished Configuring SVF ---"

# Navigate to working directory for generating callgraphs
cd ${RVD_PATH}/callgraphs

# Copy the bitcode to this directory
echo "--- Copying Bitcode to Callgraph Directory ---"
cp "${AP_BIN}/${BCF_NAME}" .

# # Generate whole program callgraph using SVF
echo "--- Generating Callgraph With SVF ---" # Modified SVF: Signature-based pruning heuristic
# svf-ex -ander -dump-callgraph "${BCF_NAME}" # Callgraphs will be stored in rvd-project/RVDebloater/callgraphs #Don't uncomment this
# wpa -print-fp -ander -dump-callgraph "${BCF_NAME}"  # Jan 28: Takes many hours, commented it # This takes ~ 50-60 minutes
# This will generate the main call graph which is pruned with "signature-based" heuristic
python3 $CALLGRAPH_DIR/convertSvfCfgToHumanReadable.py callgraph_final.dot > ./ardurover.svf.type.cfg
echo "--- Finished Generating Callgraph With SVF ---"

echo "--- Generating Other Callgraphs With SVF ---" # Address-based pruning heuristics
# These two below commands used for pruned the call graph based on "address-based" heuristics
spa -condition-cfg "${BCF_NAME}" 2>&1 | tee ./ardurover.svf.conditional.direct.calls.cfg
spa -simple "${BCF_NAME}" 2>&1 | tee ./ardurover.svf.function.pointer.allocations.wglobal.cfg
echo "--- Finished Generating Other Callgraph With SVF ---"

echo "--- Cleaning Callgraphs ---" # The last one: mainfunc 
python3 ${RVD_PATH}/python-utils/graphCleaner.py --fpanalysis --funcname main --output ./ardurover.svf.new.type.fp.wglobal.cfg --directgraphfile ./ardurover.svf.conditional.direct.calls.cfg --funcpointerfile ./ardurover.svf.function.pointer.allocations.wglobal.cfg -c ./ardurover.svf.type.cfg
# python3 ${RVD_PATH}/python-utils/graphCleaner.py --fpanalysis --funcname main --output ./arduplane.svf.new.type.fp.wglobal.cfg --directgraphfile ./arduplane.svf.conditional.direct.calls.cfg --funcpointerfile ./arduplane.svf.function.pointer.allocations.wglobal.cfg -c ./arduplane.svf.type.cfg
# python3 ${RVD_PATH}/python-utils/graphCleaner.py --fpanalysis --funcname _ZN6planeC2Ev --output ./arduplane.svf.new.type.fp.wglobal.cfg --directgraphfile ./arduplane.svf.conditional.direct.calls.cfg --funcpointerfile ./arduplane.svf.function.pointer.allocations.wglobal.cfg -c ./arduplane.svf.type.cfg
echo "--- Pruned Callgraph is Generated ---"


echo "--- Identifying Functions for Each Mode ---"
cd ${RVD_PATH}/scripts/callgraph
python3 preprocessFile.py --modetopropertymap rover.mode.to.properties.json --outputpath ../../outputs/ --modereductionpath ../../stats/modereduction.stats --cfgpath ../../callgraphs/ 
echo "--- Functions for Each Mode are Identified ---"




# # Uncomment the following to generate callgraph PNGs
# # dot -Tpng callgraph_final.dot -o callgraph_final.png # final version : direct and indirect jumps
# # dot -Tpng callgraph_initial.dot -o callgraph_initial.png # Note: callgraph_initial will not include complex control flow transfers (it just has direct jump

# # Rename whole program callgraph since we will need to make mode specifxic callgraphs
# echo "--- Renaming Whole Pogram Callgraph File ---"
# mv callgraph_final.dot whole_program_cg.dot
# cp whole_program_cg.dot ../instrumentation/whole_program_cg.dot

# TODO: Uncomment the above script lines to generate callgraph but it takes ~ 50-60 minutes
# Output of this script is the following
# callgraphs/whole_program_cg.dot - .dot file for whole program callgraph
# callgraphs/callgraph_initial.dot - .dot file for incomplete callgraph (no indirect jumps)
# callgraphs/${BCF_NAME} - uninstrumented bitcode file
