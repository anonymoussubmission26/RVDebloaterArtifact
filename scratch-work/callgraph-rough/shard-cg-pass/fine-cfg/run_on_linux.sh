echo "[*] Running struct field sensitive algorithm!"
./run_fcfg.sh bcs/test1.bc &> tests/output/call_graph_fcfg
echo "[*] Running signature matching algorithm!"
./run_sig.sh bcs/test1.bc &> tests/output/call_graph_sig
echo "[*] Done"