#----------------------------------------------------------
# RISC-V Assembly
#----------------------------------------------------------
#--------------------------------------
# Test branch and jumps
#--------------------------------------
  org 0x0000
  lui $3, 0x0000B
  ori   $4, $0, 0x75C
  add $4, $4, $3
  addi $4, $4, 0x300
   ori   $10, $0, 0x080
   ori   $16, $0, jmpR
   beq   $0, $0, braZ
   sw    $4, 0($10)
 braZ:
  jal   braR
  sw    $4, 4($10)
 end:
  sw    $1, 16($10)
   HALT
braR:
  or    $11, $0, $1
   sw    $1, 8($10)
   jal   jmpR
  sw    $4, 12($10)
 jmpR:
  bne   $1, $11, end
   halt
