ori $2, $0, 4
ori $3, $0, 6
ori $2, $0, 0xFFFC

addi $2, $2, -4
jal abc
sw $2, 0($2)
halt

abc:
    sw $3, 0($2)
    halt
