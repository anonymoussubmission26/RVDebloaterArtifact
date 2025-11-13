# Scratch Work

Note: The contents of this directory are not useful for the final project, they contain old work that was used in development of the project

1. **old-scripts**:  
    This directory contains several scripts that were used to test different iterations of the ArduPilot building and run systems as well as our implementation of ap-gllvm
    
    For example, there are different scripts with versions of the ArduPilot configure command `./waf configure`, which configures the environement for building
    - ```./waf configure --board sitl -j5```  
    for building normally using `gcc` for sitl board

    - ```./waf configure --board sitl --debug -j5```  
    for building with debug flags using `gcc` for sitl board

    - ```CXX=clang++ CC=clang ./waf configure --board sitl --debug -j5```  
    for building using `clang` instead of `gcc` for sitl board  
    we need --debug flag for preventing "floating point" errors when we tried to run simulation

    - ```CXX=gclang++ CC=gclang ./waf configure --board sitl --debug -j5```  
    for building for sitl board with `gllvm`'s `clang` wrappers, which allow bitcode extraction from the final executable

    - ```CXX=wllvm++ CC=wllvm ./waf configure --board sitl --debug -j5```  
    for building for sitl board with `wllvm`'s `clang` wrappers, which allow bitcode extraction from the final executable  
    *although we were never able to run with wllvm successfully*

Regardless of which commands we are using, we need to run `./waf copter -j5` to build and then run `sim_vehicle.py -v copter --console --map -w -N` to execute the simulation.

2. **callgraph-rough**:  
    This directory contains work done to develop a working callgraph generation system for the cpp file test1/test1.cpp which emulates complex control flow transfers analogous to those used in a firmware system like ArduPilot
