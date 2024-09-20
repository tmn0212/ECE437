org 0x0000
ori $5, $0, 5
ori $6, $0, 6
ori $7, $0, 0

ori $2, $0, 0xFFFC
addi $2, $2, -4
sw $5, 4($2)
addi $2, $2, -4
sw $6, 4($2)
jal $1, mul
addi $2, $2, -4
sw $7, 4($2)

halt 

mul:
    lw $5, 4($2)
    addi $2, $2, 4
    lw $6, 4($2)
    addi $2, $2, 4
    j loop

loop:
    add $7, $7, $5
    addi $6, $6, -1
    bne $6, $0, loop
    jr $1
