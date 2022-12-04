.data
rt: .word 0x00000000
rs: .word 0x00000003

.text
lw $s0, rt
lw $s1, rs

# rd = rt & zeroExtImm
andi $s0, $s1, 0x00000001
sw $s0, rt
