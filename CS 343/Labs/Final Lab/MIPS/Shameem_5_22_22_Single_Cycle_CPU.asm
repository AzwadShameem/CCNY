.data
integer1: .word 0x00000005
integer2: .word 0x00000006
integer3: .word 0x00000007
integer4: .word 0x00000008
integer5: .word 0x00000009

.text
lw $t0, integer1
lw $t1, integer2
lw $t2, integer3
lw $t3, integer4
lw $t4, integer5

add $t0, $t0, $t1
add $t0, $t0, $t2
add $t0, $t0, $t3
add $t0, $t0, $t4
sw $t0, integer1
