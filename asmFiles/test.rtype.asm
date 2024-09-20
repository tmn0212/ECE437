#----------------------------------------------------------
# RISC-V Assembly
#----------------------------------------------------------

  #------------------------------------------------------------------
  # R-type Instruction (ALU) Test Program
  #------------------------------------------------------------------

  org 0x0000
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
