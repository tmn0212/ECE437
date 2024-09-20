org 0x0000
ori $5, $0, 5
ori $6, $0, 6
ori $7, $0, 7

ori $28, $0, 0xFFF8
ori $2, $0, 0xFFFC
addi $2, $2, -4
sw $5, 4($2)
addi $2, $2, -4
sw $6, 4($2)
addi $2, $2, -4
sw $7, 4($2)
jal $1, mul
halt 

mul:
    lw $5, 4($2)
    addi $2, $2, 4
    lw $6, 4($2)
    addi $2, $2, 4
    ori $29, $0, 0
    j loop

loop:
    add $29, $29, $5
    addi $6, $6, -1
    bne $6, $0, loop
    addi $2, $2, -4
    sw $29, 4($2)
    bne $2, $28, mul
    jr $1
