#----------------------------------------------------------
# RISC-V Assembly
#----------------------------------------------------------

  #------------------------------------------------------------------
  # Hazard Test: Data Hazard (RAW) for LW (ITYPE_LW)
  #------------------------------------------------------------------

  org 0x0000
  
  ori $21, $0, 0x404 # address for sw
  ori $20, $0, 0x800 # address for lw to use
  lui $8, 0xDEAD # make sure lui works
  ori $11, $0, 0xBEEE 
  sw $11, 0($20) # make sure sw works
  sw $8, 4($20) 
  sw $9
  ori $8, $0, 1
  ori $9, $0, 1
  lw $10, 4($20) # lw $10 = 0xDEAD0000
  add $11, $10, $9 # 1st hazard, reuse $10
  lw $12, 0($20) # lw $12 = 0xBEEE
  add $12, $12, $11 # 2nd hazard, reuse $12
  
  # store values for double check
  sw $8, 0($21)
  sw $9, 4($21)
  sw $10, 8($21)
  sw $11, 12($21) # should see $11 = DEAD0001
  sw $12, 16($21) # should see $12 = DEADBEEF
  
  halt
  
  # double check if halt is working
  ori $8, $0, 0xBAD
  ori $9, $0, 0xBAD
  ori $10, $0, 0xBAD
  ori $11, $0, 0xBAD
  ori $12, $0, 0xBAD
  sw $8, 0($21)
  sw $9, 4($21)
  sw $10, 8($21)
  sw $11, 12($21)
  sw $12, 16($21)
  halt