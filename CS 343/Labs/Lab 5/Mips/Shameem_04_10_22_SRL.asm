.data
rd: .word 0x00000000
rt: .word 0x00000002

.text
lw $s0, rd
lw $s1, rt

# rd = rt << shamt
srl $s0, $s1, 1
sw $s0, rd
