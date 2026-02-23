#!/bin/bash -e

# cp ${1} ${SHARD_PATH}/fine-cfg/bcs/.
# echo "[*] Building kernel call graph"

export SHARD_CG=/home/luke/dsl-callgraph/shard-cg-pass

cd ${SHARD_CG}/fine-cfg/
./run_on_linux.sh

# cp tests/linux/linux_call_graph_fcfg ${SHARD_CG}/callgraph/.
# cp tests/linux/linux_call_graph_sig ${SHARD_CG}/callgraph/.
# cp bcs/text1.bc ${SHARD_CG}/callgraph/.
# cd ${SHARD_PATH}/guest-kernel/callgraph/.
# sed -e '1,5d' < linux_call_graph_fcfg &> tmp && cat tmp &> linux_call_graph_fcfg && head -n -4 linux_call_graph_fcfg &> tmp && cat tmp &> linux_call_graph_fcfg
# sed -e '1,4d' < linux_call_graph_sig &> tmp && cat tmp &> linux_call_graph_sig && head -n -1 linux_call_graph_sig &> tmp && cat tmp &> linux_call_graph_sig
# python create_targets.py linux_call_graph_sig linux_call_graph_fcfg &> callsites_info
# sed -e '1,2d' < callsites_info &> tmp && cat tmp &> callsites_info
# cp callsites_info ${SHARD_PATH}/guest-kernel/instrumentation/cfi/.

# echo "[*] Created kernel call graph"