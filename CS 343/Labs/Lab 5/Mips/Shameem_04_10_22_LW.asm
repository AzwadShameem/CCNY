.data
rs: .word 0x00000003
MDR: .word 0x00000000
.text
lw $s0, MDR
lw $s1, rs
# R [rt] (0x00000004) = M[R[rs] (0x00000003) + SignExtImm]
add $s0, $s1, 0x00000001
sw $s0, MDR
