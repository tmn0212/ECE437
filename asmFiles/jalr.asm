ori $5, $0, 5
ori $6, $0, 6
ori $7, $0, 7
ori $2, $0, 0xFFFC

jal $1, abc
addi $2, $2, -4
sw $6, 0($2)

halt

abc:
    addi $2, $2, -4
    sw $5, 0($2)
    jalr $1

addi $2, $2, -4
sw $7, 0($2)
halt
