# Description: accepts a command (save, load, list);
#              'save' asks for a key to associate to current paste & adds to dict ()
#              'load' asks for a key & copies its value to paste
#              'list' shows key & values of all data

import sys
import clipboard
import json
# JavaScript Object Notation

SAVED_DATA = "clipboard.json" # file to store all the data
# creates a json file (passes a file & python dictionary e.g. {"key": "value"} as parameters)
def save_data(filepath, data):
    # 'w' (write) overrides file if exists or creates new file; 'open' opens the file
    with open(filepath, "w") as f:
        json.dump(data, f)  # dump data to a file
        
# reads a json file
def load_data(filepath):
    try: #handles an error if file does NOT exist
        with open(filepath, "r") as f: # 'r' (read mode)
            data = json.load(f) # py dict
            return data
    except: # error happened
        return {} # empty dict
            
# 1st argument = python file name
# 2nd arg =  command
if len(sys.argv) == 2:
    command = sys.argv[1]   # accept second argument
    data = load_data(SAVED_DATA) # file to load data
# takes clipboard's data & saves in json file (py dict)
    if command == "save":
        key = input("Enter a key: ") # creates key
        data[key] = clipboard.paste() # store current paste value with its associated key
        save_data(SAVED_DATA, data) # rewrites file to save the newly added data
    elif command == "load":
        key = input("Enter a key: ")
        if key in data: # search if key exists in our dict
            clipboard.copy(data[key])   # copies value-associated-key from dict
            print("Data copied to clipboard.")
        else:
            print("Key does not exist.")
    elif command == "list":
        print(data) # prints py dict
    else:
        print("Unknown command.")
else:
    print("Please pass exactly one command.")


