#----------------------------------------------------------
# RISC-V Assembly
#----------------------------------------------------------

  #------------------------------------------------------------------
  # Tests lui lw sw
  #------------------------------------------------------------------

  org   0x0000
  lui   $7, 0xFEEDB
  
  lui $9, 0xFFFFF
  ori   $4, $0, 0xF00  
  nop # 2 nops to have $4 from WB to EX stage
  nop
  nop
  sub $4, $4, $9
  
  ori   $10, $0, 0x0800
  nop # 2 nops to have $10 from WB to EX stage
  nop
  nop
  sub $10, $10, $9
  
  lui $8, 0xEEF
  nop # 2 nops to have $8 from WB to EX stage
  nop
  nop
  srli $8, $8, 12
  nop # 2 nops to have $8 from WB to EX stage
  nop
  nop
  add   $7, $8, $7
  nop
  nop
  nop
  lw    $11,0($4)
   lw    $12,4($4)
   lw    $13,8($4)
   nop
  nop
  nop
  sw    $11,0($10)
   sw    $12,4($10)
   sw    $13,8($10)
   sw    $7,12($10)
   halt      # that's all

  org   0x0F00
  cfw   0x7337
  cfw   0x2701
  cfw   0x1337

