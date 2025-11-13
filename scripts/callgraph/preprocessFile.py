import logging
import os
import sys
import json
import extractModeFuncs


sys.path.insert(0, '../../python-utils')

import util
import graph
import binaryAnalysis
import syscall as sycall
import re
import optparse

def setLogPath(logPath):
    """
    Set the property of the logger: path, config, and format
    :param logPath:
    :return:
    """
    if os.path.exists(logPath):
        os.remove(logPath)

    rootLogger = logging.getLogger("coverage")
    if options.debug:
        logging.basicConfig(filename=logPath, level=logging.DEBUG)
        rootLogger.setLevel(logging.DEBUG)
    else:
        logging.basicConfig(filename=logPath, level=logging.INFO)
        rootLogger.setLevel(logging.INFO)

#    ch = logging.StreamHandler(sys.stdout)
    consoleHandler = logging.StreamHandler()
    rootLogger.addHandler(consoleHandler)
    return rootLogger
#    rootLogger.addHandler(ch)


if __name__ == "__main__":

    """
    Find functions for modes
    """
    usage = "Usage: %prog -f <Target program cfg> -c <glibc callgraph file>"

    parser = optparse.OptionParser(usage=usage, version="1")

    parser.add_option("", "--modetopropertymap", dest="modetopropertymap", default=None, nargs=1,
                      help="File containing application to property mapping")

    parser.add_option("", "--cfgpath", dest="cfgpath", default=None, nargs=1,
                      help="Path to call function graphs")
    
    parser.add_option("", "--outputpath", dest="outputpath", default=None, nargs=1,
                      help="Path to output folder")

    parser.add_option("", "--modereductionpath", dest="modereductionpath", default=None, nargs=1,
                      help="Path to file to store mode reduction stats")

    parser.add_option("-d", "--debug", dest="debug", action="store_true", default=False,
                      help="Debug enabled/disabled")
    
    parser.add_option("", "--singlemodename", dest="singlemodename", default=None, nargs=1,
                      help="Name of single mode to run, if passed the enable/disable in the JSON file will not be considered")
    
    parser.add_option("-s", "--separator", dest="separator", default="->", nargs=1,
                      help="CFG file separator per line")
    
    (options, args) = parser.parse_args()
    rootLogger = setLogPath("createsyscallstats.log")

    try:
        modeToPropertyFile = open(options.modetopropertymap, 'r')
        modeToPropertyStr = modeToPropertyFile.read()
        modeToPropertyMap = json.loads(modeToPropertyStr)
    except Exception as e:
        rootLogger.warning("Trying to load mode to property map json from: %s, but doesn't exist: %s", options.modetopropertymap, str(e))
        rootLogger.debug("Finished loading json")
        sys.exit(-1)

    modeReductionFile = open(options.modereductionpath, 'w') # Should we have this?

    cfgbasepath = options.cfgpath
    outputbasepath = options.outputpath

    targetcfg = modeToPropertyMap.get("cfg", None)
    # modeName = "ModeAcro"
    # Set of Ardupilot Libraries (Assumed we have them!) TODO 1: Any better way rather than this? 
    #TODO 2: What about PX4 (and maybe other firmwares)?

    apLibs = "AP_"

    # acLibs = "AC_"
    # arLibs = "AR_"

    devicName = "Plane"

    # rcLibs = "RC_"
    # gcslibs = "GCS_"
    # mvlibs = "mavlink"

    # Should we have these two below commands?
    rvdefenderSecEvalOutputFilePath = modeToPropertyMap.get("sec-eval-rvdefender-output", None)
    rvdefenderSecEvalOutputFile = open(rvdefenderSecEvalOutputFilePath, 'w')

    for mode in modeToPropertyMap["modes"]:
        for modeName, modeDict in mode.items():
            if ( (not options.singlemodename and modeDict.get("enable","true") == "true") or (options.singlemodename and modeName == options.singlemodename) ):
                rootLogger.info("Extracting reachable (required) functions for %s", modeName)
                mastermain = modeDict.get("master", None)
                output = modeDict.get("output", None)
                output = outputbasepath + "/" + output
                # outputReachableFuncs = dict()
                reachableFuncs = list()  # Change here: using a list instead of a dictionary

                #targetcfg = appDict.get("cfg", None)

                if ( targetcfg ):
                    temporaltargetcfg = targetcfg.get("svftypefp", None)
                    directcfg = targetcfg.get("direct", None)
                    maintargetcfg = targetcfg.get("svftypefp", None)

                    startFuncsStr = mastermain
                    masterMainList = list()
                    if ( "," in startFuncsStr ):
                        masterMainList = startFuncsStr.split(",")
                    else:
                        masterMainList.append(startFuncsStr)

                    # Find callers (left side functions) in the final call graph for each mode
                    try:
                        cfgFile = open(cfgbasepath + "/" + maintargetcfg, 'r')
                        cfgLine = cfgFile.readline()
                        while ( cfgLine ):
                            caller = cfgLine.split(options.separator)[0].strip()
                            if((modeName in caller and caller not in masterMainList) or 
                               (apLibs in caller and caller not in masterMainList) or
                            #    (acLibs in caller and caller not in masterMainList) or
                            #    (arLibs in caller and caller not in masterMainList) or
                               (devicName in caller and caller not in masterMainList)):
                            #    (rcLibs in caller and caller not in masterMainList) or
                            #    (gcslibs in caller and caller not in masterMainList) or
                            #    (mvlibs in caller and caller not in masterMainList)):
                                masterMainList.append(caller)
                            cfgLine = cfgFile.readline()
                        cfgFile.close()
                    except Exception as e:
                        rootLogger.warning("Trying to load call graph from: %s, but doesn't exist: %s", cfgbasepath + "/" + maintargetcfg, str(e))
                        rootLogger.debug("Finished loading json")
                        sys.exit(-1)

                    if ( not os.path.exists(output) ):
                        accessibleFuncs = extractModeFuncs.processModes(cfgbasepath + "/" + maintargetcfg, masterMainList, modeName, None, output, options.debug, rootLogger)
                        reachableFuncs.extend(accessibleFuncs)  # Add reachable functions to the list
                        # rvdefenderSecEvalOutputFile.write(modeName + ":" + util.cleanStrList(accessibleFuncs).replace(" ", "") + "\n")
                        # util.writeDictToFile(outputReachableFuncs, output)
                        with open(output, "w") as outfile:
                            for func in reachableFuncs:
                                outfile.write(func + "\n")  # Each function name on a new line

                    # if ( os.path.exists(output) ):
                    else:
                        rootLogger.info("Output path is exist for mode %s", modeName)
                        # appModeDict = util.readDictFromFile(output)
                        
                       