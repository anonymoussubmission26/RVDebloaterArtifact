import logging
import os
import sys
import json

sys.path.insert(0, '../../python-utils')

import util
import graph
import binaryAnalysis
import re
import optparse


def processModes(targetcfg, startNodes, modename, edgefilterlist, output, debug, rootLogger):
    # masterMainFuncList = list()
    # if ( "," in mastermain):
    #     masterMainFuncList = mastermain.split(",")
    # else:
    #     masterMainFuncList.append(mastermain)


    edgeFilterList = list()
    if ( edgefilterlist ):
        if ( "," in edgefilterlist ):
            edgeFilterList = edgefilterlist.split(",")
        else:
            edgeFilterList.append(edgefilterlist)
    # else:
        # edgeFilterList = masterMainFuncList


    finalGraph = graph.Graph(rootLogger)
    finalGraph.createGraphFromInputWithFilter(targetcfg, "->", edgeFilterList)

    
    # rootLogger.info("-------------Extraction master reachable functions---------")
    # specificFunction1 = "_ZN8ModeAuto3runEv"
    accessibleFuncs = set()
    for startNode in startNodes:
        # if mainFunc == specificFunction1:
            # rootLogger.info("Functions for %s", startNode)
            # accessibleFuncs.update(finalGraph.getFuncsFromStartNode(startNode, list(), list()))
            accessibleFuncs.update(finalGraph.accessibleFromStartNode(startNode, list(), list()))


    # specificFunction2 = "_ZN8ModeAuto4initEb"
    # workerFunctions = set()
    # for mainFunc in masterMainFuncList:
        # if mainFunc == specificFunction2:  # Process only the specific function
            # rootLogger.info("Processing functions for %s", mainFunc)
            # workerFunctions.update(applicationGraph.getLeavesFromStartNode(mainFunc, list(), list()))
        
    rootLogger.info("*" * 80)

    rootLogger.info("len(Accessible Functions): %d", len(accessibleFuncs))

    # rootLogger.info("len(workerFunctions): %d", len(workerFunctions))

    rootLogger.info("Reachable Functions:")
    rootLogger.info("*" * 80)
    #rootLogger.info("*****************************************************************************")
    # Uncomment below if you want to print the result
    # for function in sorted(accessibleFuncs):  # Sort for better readability
    #     rootLogger.info(function)
    
    return accessibleFuncs

    # mminusw = sorted(workerFunctions.difference(masterFunctions))
    # for function in sorted(mminusw):  # Sort for better readability
        # rootLogger.info(function)

    
