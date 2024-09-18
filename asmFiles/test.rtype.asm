<<<<<<< HEAD
=======
#----------------------------------------------------------
# RISC-V Assembly
#----------------------------------------------------------
>>>>>>> 5bd21b5eda985cc129168b5791851689fead6a2d

  #------------------------------------------------------------------
  # R-type Instruction (ALU) Test Program
  #------------------------------------------------------------------

  org 0x0000
<<<<<<< HEAD
  ori   $1,$zero,0xD269
  ori   $2,$zero,0x37F1

  ori   $21,$zero,0x80
  ori   $22,$zero,0xF0

# Now running all R type instructions
  or    $3,$1,$2
  and   $4,$1,$2
  andi  $5,$1,0xF
  addu  $6,$1,$2
  addiu $7,$3,0x8740
  subu  $8,$4,$2
  xor   $9,$5,$2
  xori  $10,$1,0xf33f
  ori   $14,$0,4 
  sllv  $11,$14,$1
  ori   $14,$0,5
  srlv  $12,$14,$1
  nor   $13,$1,$2
# Store them to verify the results
  sw    $13,0($22)
  sw    $3,0($21)
  sw    $4,4($21)
  sw    $5,8($21)
  sw    $6,12($21)
  sw    $7,16($21)
  sw    $8,20($21)
  sw    $9,24($21)
  sw    $10,28($21)
  sw    $11,32($21)
  sw    $12,36($21)
  halt  # that's all
=======
  ori   $4,$0,0x269
  lui   $3, 0x0000D
  add $4, $4, $3
  ori   $10,$0,0x37F1
  lui   $3, 0x00003
  add $10, $10, $3
  
  ori   $21,$0,0x80
  ori   $22,$0,0xF0
 
# Now running all R type instructions
  #or    $11,$4,$10
   and   $12,$4,$10
   andi  $13,$4,0xF
   add  $14,$4,$10
   addi $15,$11,0x8740
   sub  $5,$12,$10
   xor   $6,$13,$10
   xori  $7,$4,0xf33f
   ori   $31,$0,4 
   sll  $28,$4,$31
   ori   $31,$0,5
   srl  $29,$4,$31
# nor   $30,$4,$10 # No Nor in RV32
#  or $30, $4, $10
#  not $30, $30

# Store them to verify the results
  # sw    $30,0($22)
   sw    $11,0($21)
   sw    $12,4($21)
   sw    $13,8($21)
   sw    $14,12($21)
   sw    $15,16($21)
   sw    $5,20($21)
   sw    $6,24($21)
   sw    $7,28($21)
   sw    $28,32($21)
   #sw    $29,36($21)
   halt
# that's all
>>>>>>> 5bd21b5eda985cc129168b5791851689fead6a2d
