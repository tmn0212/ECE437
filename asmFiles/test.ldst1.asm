#----------------------------------------------------------
# RISC-V Assembly
#----------------------------------------------------------

  #------------------------------------------------------------------
  # Test lw sw
  #------------------------------------------------------------------

  org   0x0000
  ori   $4, $0, 0xF0
   ori   $10, $0, 0x100
   ori   $11, $0, 0x200
   ori   $12, $0, 0x300
   ori   $13, $0, 0x400
   lw    $14, 0($4)
   lw    $15, 4($4)
   lw    $5, 8($4)
   ori   $12, $0, 0x500
   ori   $13, $0, 0x600
   sw    $14, 0($10)
   sw    $15, 4($10)
   sw    $5, 8($10)
   halt      # that's all

  org   0x00F0
  cfw   0x7337
  cfw   0x2701
  cfw   0x1337
