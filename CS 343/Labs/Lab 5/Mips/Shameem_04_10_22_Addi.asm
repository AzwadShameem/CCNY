.data
rt: .word 0x00000000
rs: .word 0x00000003

.text
lw $s0, rt
lw $s1, rs

# rd = rt + signExtImm
addi $s0, $s1, 1
sw $s0, rt
