org 0x0000
ori $3, $0, 2024
ori $4, $0, 8
ori $5, $0, 16
ori $6, $0, 30
ori $7, $0, 365
addi $4, $4, -1
addi $3, $3, -2000

addi $2, $2, -4
sw $5, 4($2) # CurrentDay
addi $2, $2, -4
sw $6, 4($2) # 30
addi $2, $2, -4
sw $4, 4($2) # CurrentMonth - 1
addi $2, $2, -4
sw $7, 4($2) # 365
addi $2, $2, -4
sw $3, 4($2) # CurrentYear - 2000
jal $1, mul
ori $11, $10, 0
jal $1, mul
ori $12, $10, 0
lw $13, 4($2)
addi $2, $2, 4
add $11, $11, $12
add $11, $11, $13

halt


mul:
    lw $8, 4($2) # CurrentDay
    addi $2, $2, 4
    lw $9, 4($2) # 30
    addi $2, $2, 4
    ori $10, $0, 0

loop:
    add $10, $10, $8
    addi $9, $9, -1
    bne $9, $0, loop
    jr $1
