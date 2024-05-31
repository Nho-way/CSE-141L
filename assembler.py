operand = {"mof":"0000","mov":"0001","lsl":"0010","or":"0011","xor":"0100","rsl":"0101","add":"0110","lwr":"0111","sub":"1000","j":"1001","bne":"1010", "beq":"1011", "str":"1100", "bgt":"1101", "ble":"1110"}


with open("code.txt", "r") as file:
    lines = file.readlines()
    for line in lines:
        final = ""
        parts = line.split(" ")
        final += operand[parts[0]]
        if parts[0] == 'j':
            #write code to jump to a specific point
        elif parts[0] == 'bne':
            #write code to jump to a specific point
        elif parts[0] == 'beq':
            #write code to jump to a specific point
        elif parts[0] == 'bgt':
            #write code to jump to a specific point
        elif parts[0] == 'ble':
            #write code to jump to a specific point
        else:
            #get register
            register = int(parts[1][2:])
            register = bin(register)[2:]
            final += str(register)
            # get immediate value from lookup table
            if parts[0] == 'add' or parts[0] == 'sub':
                #add index of thing in lookup table
        mach_code = open("mach_code.txt", "w")
        mach_code.write(final)
        file.close()

