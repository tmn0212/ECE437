#----------------------------------------------------------
# RISC-V Assembly
#----------------------------------------------------------

  #------------------------------------------------------------------
  # Hazard Test: Control hazard for branches
  #------------------------------------------------------------------

  org 0x0000
  
  ori $21, $0, 0x408 # address for sw
  
  ori $9, $0, 22
  ori $10, $0, 22
  lui $12, 0xDEAD
  ori $11, $0, 0xBEEF

  beq $9, $10, taken # control hazard with beq
  ori $11, $0, 0
  addi $11, $0, 1
  ori $11, $0, 0xBAD

  taken:
    add $12, $12, $11

  # store values for double check
  sw $9, 0($21)
  sw $10, 4($21)
  sw $11, 8($21)
  sw $12, 12($21) # should see $12 = 0xDEADBEEF
  
  halt
  
  # double check if halt is working
  ori $9, $0, 0xBAD
  ori $10, $0, 0xBAD
  ori $11, $0, 0xBAD
  ori $12, $0, 0xBAD
  sw $9, 0($21)
  sw $10, 4($21)
  sw $11, 8($21)
  sw $12, 12($21)
  halt
    