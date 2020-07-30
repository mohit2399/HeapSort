# machine has 12 registers 


# the data can be set by SET command
# format for SET command ----          SET `LOCATION` `VALUE`
# value can be 0-255

# format for mov command -------     MOV 	`REGS NUMBER` `VALUE` 

# JMP is a  command to jump -val steps in instruction pointer 
# format for JMP command-----     JMP `value`

# EXIT command for stoping the machine


SET 0 12
SET 1 11
SET 2 13
SET 3 5
SET 4 6
SET 5 7
SET 6 6         # total size of array (static)
SET 7 0         # will be used for swapping
SET 8 6         # will be used in the loop (same as REGISTER 6)
SET 9 1         # will be used in jump
SET 10 0        # used in heapify for largest
SET 11 0        # used in heapify for smallest

HEAP            # heapify all elements (creating max heap)

SWAP            # swaps value of register 0 with the register pointed by register 8
DEC             # decreases value of register 8 by 1  
JMP 13          # jumping to heap command
PRINT           # print register 0 to 5

EXIT            # stoping the machine
