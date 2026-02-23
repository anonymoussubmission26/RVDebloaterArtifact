import sys

svfcfg = sys.argv[1]
cfgfile = open(svfcfg, 'r')

addrToFuncName = dict()

# First pass to gather function names and remove unnecessary text
cfgline = cfgfile.readline()
while cfgline:
    if cfgline.strip().startswith("Node") and "label" in cfgline:
        splittedLine = cfgline.split()
        addr = splittedLine[0]
        params = cfgline.replace(addr, "").split(",")
        for param in params:
            if "label" in param:
                # Extract the function name inside the {fun: } label
                name = param[param.index("{")+1:param.index("}")]
                
                # Remove any leftover information like CallGraphNode or braces
                name = name.replace("CallGraphNode ID:", "").strip()
                name = name.replace("{", "").replace("}", "").strip()

                # Remove extra text like `fun:` if present and clean the string
                if "fun:" in name:
                    name = name.replace("fun:", "").strip()
                
                # Handle the case where there is more info after a "|"
                if "|" in name:
                    name = name.split("|")[0]

                addrToFuncName[addr] = name  # Store clean function name
    cfgline = cfgfile.readline()

# Second pass to print function call relationships
cfgfile = open(svfcfg, 'r')  # Reopen the file for the second pass
cfgline = cfgfile.readline()
while cfgline:
    if cfgline.strip().startswith("Node") and "->" in cfgline:
        caller = cfgline.split("->")[0].strip()
        callee = cfgline.split("->")[1].strip()
        
        if "[" in callee:
            callee = callee[:callee.index("[")]
        if ";" in callee:
            callee = callee.replace(";", "")

        # Handle srander option which adds sX at the end of function names
        if ":" in caller:
            caller = caller[:caller.index(":")]

        if addrToFuncName.get(caller, None) and addrToFuncName.get(callee, None):
            # Print only function names without extra info
            print(f"{addrToFuncName[caller]} -> {addrToFuncName[callee]}")
        else:
            if callee != "Node0x5644c96bb370":
                print(f"Problem with caller: {caller} or callee: {callee}, hasn't been defined")
    cfgline = cfgfile.readline()

