onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /system_tb/CLK
add wave -noupdate /system_tb/nRST
add wave -noupdate -group dpif /system_tb/DUT/CPU/DP/dpif/halt
add wave -noupdate -group dpif /system_tb/DUT/CPU/DP/dpif/ihit
add wave -noupdate -group dpif /system_tb/DUT/CPU/DP/dpif/imemREN
add wave -noupdate -group dpif /system_tb/DUT/CPU/DP/dpif/imemload
add wave -noupdate -group dpif /system_tb/DUT/CPU/DP/dpif/imemaddr
add wave -noupdate -group dpif /system_tb/DUT/CPU/DP/dpif/dhit
add wave -noupdate -group dpif /system_tb/DUT/CPU/DP/dpif/datomic
add wave -noupdate -group dpif /system_tb/DUT/CPU/DP/dpif/dmemREN
add wave -noupdate -group dpif /system_tb/DUT/CPU/DP/dpif/dmemWEN
add wave -noupdate -group dpif /system_tb/DUT/CPU/DP/dpif/flushed
add wave -noupdate -group dpif /system_tb/DUT/CPU/DP/dpif/dmemload
add wave -noupdate -group dpif /system_tb/DUT/CPU/DP/dpif/dmemstore
add wave -noupdate -group dpif /system_tb/DUT/CPU/DP/dpif/dmemaddr
add wave -noupdate -group cuif /system_tb/DUT/CPU/DP/cuif/Instruction
add wave -noupdate -group cuif /system_tb/DUT/CPU/DP/cuif/MemWr
add wave -noupdate -group cuif /system_tb/DUT/CPU/DP/cuif/ALUOP
add wave -noupdate -group cuif /system_tb/DUT/CPU/DP/cuif/RegWr
add wave -noupdate -group cuif /system_tb/DUT/CPU/DP/cuif/ALUSrc
add wave -noupdate -group cuif /system_tb/DUT/CPU/DP/cuif/MemtoReg
add wave -noupdate -group cuif /system_tb/DUT/CPU/DP/cuif/imm
add wave -noupdate -group cuif /system_tb/DUT/CPU/DP/cuif/PCSrc
add wave -noupdate -expand -group pc /system_tb/DUT/CPU/DP/pc/zero
add wave -noupdate -expand -group pc /system_tb/DUT/CPU/DP/pc/PCSrc
add wave -noupdate -expand -group pc /system_tb/DUT/CPU/DP/pc/ihit
add wave -noupdate -expand -group pc /system_tb/DUT/CPU/DP/pc/return_addr
add wave -noupdate -expand -group pc /system_tb/DUT/CPU/DP/pc/npc
add wave -noupdate -expand -group pc /system_tb/DUT/CPU/DP/pc/iaddr
add wave -noupdate -expand -group pc /system_tb/DUT/CPU/DP/PC/next_iaddr
add wave -noupdate -expand -group pc /system_tb/DUT/CPU/DP/pc/Instruction
add wave -noupdate -expand -group pc /system_tb/DUT/CPU/DP/pc/op
add wave -noupdate -expand -group pc /system_tb/DUT/CPU/DP/pc/haltop
add wave -noupdate -group rfif /system_tb/DUT/CPU/DP/rfif/WEN
add wave -noupdate -group rfif /system_tb/DUT/CPU/DP/rfif/wsel
add wave -noupdate -group rfif /system_tb/DUT/CPU/DP/rfif/rsel1
add wave -noupdate -group rfif /system_tb/DUT/CPU/DP/rfif/rsel2
add wave -noupdate -group rfif /system_tb/DUT/CPU/DP/rfif/wdat
add wave -noupdate -group rfif /system_tb/DUT/CPU/DP/RF/next_register
add wave -noupdate -group rfif /system_tb/DUT/CPU/DP/RF/register
add wave -noupdate -group rfif /system_tb/DUT/CPU/DP/rfif/rdat1
add wave -noupdate -group rfif /system_tb/DUT/CPU/DP/rfif/rdat2
add wave -noupdate -group alu /system_tb/DUT/CPU/DP/alu/PortA
add wave -noupdate -group alu /system_tb/DUT/CPU/DP/alu/PortB
add wave -noupdate -group alu /system_tb/DUT/CPU/DP/alu/ALUOP
add wave -noupdate -group alu /system_tb/DUT/CPU/DP/alu/Negative
add wave -noupdate -group alu /system_tb/DUT/CPU/DP/alu/OutputPort
add wave -noupdate -group alu /system_tb/DUT/CPU/DP/alu/Overflow
add wave -noupdate -group alu /system_tb/DUT/CPU/DP/alu/Zero
add wave -noupdate -group ifid /system_tb/DUT/CPU/DP/pl1/Instruction
add wave -noupdate -group ifid /system_tb/DUT/CPU/DP/pl1/pc
add wave -noupdate -group ifid /system_tb/DUT/CPU/DP/pl1/next_Instruction
add wave -noupdate -group ifid /system_tb/DUT/CPU/DP/pl1/next_pc
add wave -noupdate -group ifid /system_tb/DUT/CPU/DP/pl1/ihit
add wave -noupdate -group ifid /system_tb/DUT/CPU/DP/pl1/dhit
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/pl2/Instruction
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/pl2/pc
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/pl2/rdat1
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/pl2/rdat2
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/pl2/imm
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/pl2/ALUOP
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/pl2/PCSrc
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/pl2/next_PCSrc
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/pl2/ALUSrc
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/pl2/RegWr
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/pl2/MemtoReg
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/pl2/MemWr
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/pl2/ihit
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/pl2/dhit
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/pl2/halt
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/pl2/wsel
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/pl2/next_Instruction
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/pl2/next_pc
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/pl2/next_rdat1
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/pl2/next_rdat2
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/pl2/next_imm
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/pl2/next_ALUOP
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/pl2/next_ALUSrc
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/pl2/next_RegWr
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/pl2/next_MemtoReg
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/pl2/next_MemWr
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/pl2/next_halt
add wave -noupdate -group idex /system_tb/DUT/CPU/DP/pl2/next_wsel
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/pl3/Instruction
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/pl3/pc
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/pl3/rdat1
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/pl3/rdat2
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/pl3/ALUOut
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/pl3/ihit
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/pl3/dhit
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/pl3/zero
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/pl3/MemWr
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/pl3/MemtoReg
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/pl3/RegWr
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/pl3/halt
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/pl3/wsel
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/pl3/PCSrc
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/pl3/next_PCSrc
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/pl3/next_Instruction
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/pl3/next_pc
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/pl3/next_rdat1
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/pl3/next_rdat2
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/pl3/next_ALUOut
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/pl3/next_zero
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/pl3/next_MemWr
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/pl3/next_MemtoReg
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/pl3/next_RegWr
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/pl3/next_halt
add wave -noupdate -group exmem /system_tb/DUT/CPU/DP/pl3/next_wsel
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/pl4/pc
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/pl4/dmemload
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/pl4/ALUOut
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/pl4/MemtoReg
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/pl4/RegWr
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/pl4/dhit
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/pl4/ihit
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/pl4/halt
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/pl4/wsel
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/pl4/next_pc
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/pl4/next_dmemload
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/pl4/next_ALUOut
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/pl4/next_MemtoReg
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/pl4/next_RegWr
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/pl4/next_halt
add wave -noupdate -group memwb /system_tb/DUT/CPU/DP/pl4/next_wsel
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {662655 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {1313648490 ps} {1313934290 ps}
