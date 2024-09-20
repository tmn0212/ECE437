ori $5, $0, 5
ori $6, $0, 6
ori $2, $0, 0xFFFC

addi $2, $2, -4
sw $5, 0($2)

halt

sw $6, 0($2)

halt
