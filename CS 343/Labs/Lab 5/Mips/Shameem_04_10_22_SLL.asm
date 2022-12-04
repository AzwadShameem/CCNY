.data
rd: .word 0x00000002
rt: .word 0x00000002

.text
lw $s0, rd
lw $s1, rt

# rd = rt << shamt
sll $s0, $s1, 1
sw $s0, rd
