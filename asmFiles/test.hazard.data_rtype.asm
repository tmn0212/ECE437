#----------------------------------------------------------
# RISC-V Assembly
#----------------------------------------------------------

  #------------------------------------------------------------------
  # Hazard Test: Data Hazard (RAW) for RTYPE
  #------------------------------------------------------------------

  org 0x0000
  
  ori $21, $0, 0x400 # address for sw
  lui $8, 0xDEAD # make sure lui works
  ori $9, $0, 1
  ori $10, $0, 0x1234
  ori $11, $0, 0xBEEE
  add $11, $11, $8 # 1st data hazard, reuse $11
  add $12, $9, $11 # 2nd data hazard, reuse $11
  add $7, $11, $12 # 3rd data hazard with both operand

  # store values for double check
  sw $8, 0($21)
  sw $9, 4($21)
  sw $10, 8($21)
  sw $11, 12($21) # should see $11 = 0xDEADBEEE
  sw $12, 16($21) # should see $12 = 0xDEADBEEF
  sw $7, 20($21)
  
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

