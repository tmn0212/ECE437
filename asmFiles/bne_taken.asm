org 0x0000
ori $5, $0, 5
ori $6, $0, 6
ori $7, $0, 7
ori $2, $0, 0xFFFC

bne $6, $7, stuff
addi $2, $2, -4
sw $6, 0($2)
halt

stuff:
    addi $2, $2, -4
    sw $5, 0($2)
    halt
