.data 
	a: .word 5
        b: .word 10
      	answer: .word 0
.text
main: 
	lw $t0, a
        lw $t1, b 
	jal gcd
	sw $v0, answer 
	li $v0, 10
	syscall
	
gcd: 
	addi $sp, $sp, -12 
	sw $t3, 8($sp)
        sw $t2, 4($sp) 
	sw $ra, 0($sp) 
        add $t2, $t0, $zero 
	add $t3, $t1, $zero 
    	div $t0, $t1
    	mfhi $t2 
    	sw $t2, 4($sp)
    	bne $t2, $zero, L1 
	add $v0, $zero, $t1 
	addi $sp, $sp 12 
	jr $ra
	
L1: 
	add $t0, $t1, $zero 
	lw $t2, 4($sp) 
	add $t1, $t2, $zero 
	jal gcd
        lw $ra, 0($sp) 
	lw $t2, 4($sp) 
    	lw $t3, 8($sp) 
	addi $sp, $sp, 12 
    	jr $ra 