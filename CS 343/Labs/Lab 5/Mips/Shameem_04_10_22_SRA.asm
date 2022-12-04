.data
rs: .word 0x00000002
rd: .word 0x00000000

.text
lw $s0, rs
lw $s2, rd

# rd = rt << shamt
sra $s2, $s0, 0x00000002
sw $s0, rd
