# // ---------------------------------------------------------------------
# // ------- [cuhHub] Util Scripts - Combiner
# // ---------------------------------------------------------------------

# -----------------------------------------
# // ---- Imports
# -----------------------------------------
import os
import time

# -----------------------------------------
# // ---- Variables
# -----------------------------------------
mainPath = "src"
outputFile = "script.lua"

__allowedFileExtensions = [".lua"]
__fileExceptions = ["src/p1_framework/intellisense.lua"]
__folderExceptions = ["src/intellisense"]

# -----------------------------------------
# // ---- Functions
# -----------------------------------------
# // Read a file
def quickRead(path: str):
    with open(path, "r") as f:
        return f.read()
    
# // Write to a file
def quickWrite(path: str, content: str):
    with open(path, "w") as f:
        return f.write(content)
    
# // Check if path is in list
def pathInList(path: str, paths: list):
    for currentPath in paths:
        if os.path.samefile(path, currentPath):
            return True
        
    return False

# // Get contents of all files in a path
def recursiveRead(targetDir: str, allowedFileExtensions: list[str], fileExceptions: list[str], folderExceptions: list[str]) -> dict[str, str]:
    # list files
    files = os.listdir(targetDir)
    contents = {}
    
    # iterate through them
    for file in files:
        # get file-related variables
        _, extension = os.path.splitext(file)
        path = os.path.join(targetDir, file).replace("\\", "/") # replacing for formatting reasons
        
        # file extension check
        if extension == "":
            # file is folder, but is an exception
            if pathInList(path, folderExceptions):
                continue
            
            # file is folder, so read it too
            contents = {**contents, **recursiveRead(path, allowedFileExtensions, fileExceptions, folderExceptions)}
            
        # correct extension check
        if extension not in allowedFileExtensions:
            continue
            
        # exceptions check
        if pathInList(path, fileExceptions):
            continue
        
        # get file content
        content = quickRead(path)
        
        # append file content to contents
        contents[path] = content
        
    return contents

# -----------------------------------------
# // ---- Main
# -----------------------------------------
# // Setup
# prevent combining output file and this file
__fileExceptions.extend([outputFile, os.path.relpath(__file__)])

# // Main combine loop
while True:
    # wait
    time.sleep(0.1)
    
    # get content of all files
    result = recursiveRead(
        mainPath,
        __allowedFileExtensions,
        __fileExceptions,
        __folderExceptions
    )
    
    # print message
    print("Combined the following files:\n- " + "\n- ".join(result.keys()))
    
    # format result
    for path, content in result.items():
        newContent = [
            "----------------------------------------------",
            f"-- // [File] {path}",
            "----------------------------------------------",
            content
        ]
        
        result[path] = "\n".join(newContent)

    # dump it into output file
    try:
        quickWrite(outputFile, "\n\n".join(result.values()))
    except:
        print("Failed to output.")