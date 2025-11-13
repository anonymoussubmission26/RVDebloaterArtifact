# Test1

1. To generate callgraph for `test1.bc` run: 
    
    ```bash
    wpa -ander -dump-callgraph test1.bc
    ```
    or
   ```
   svf-ex -dunmp-callgraph test1.bc
   ```

3. To geneate `PNG` for callgraph run:

    ```bash
    dot -Tpng callgraph_final.dot -o callgraph_final.png
    ```
