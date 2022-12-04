	.file	"main.cpp"
	.text
	.section	.text._ZNKSt5ctypeIcE8do_widenEc,"axG",@progbits,_ZNKSt5ctypeIcE8do_widenEc,comdat
	.align 2
	.p2align 4
	.weak	_ZNKSt5ctypeIcE8do_widenEc
	.type	_ZNKSt5ctypeIcE8do_widenEc, @function
_ZNKSt5ctypeIcE8do_widenEc:
.LFB1349:
	.cfi_startproc
	movl	%esi, %eax
	ret
	.cfi_endproc
.LFE1349:
	.size	_ZNKSt5ctypeIcE8do_widenEc, .-_ZNKSt5ctypeIcE8do_widenEc
	.text
	.p2align 4
	.globl	_Z10dotProductPfS_iS_
	.type	_Z10dotProductPfS_iS_, @function
_Z10dotProductPfS_iS_:
.LFB2109:
	.cfi_startproc
	movl	%edx, %r8d
	testl	%edx, %edx
	jle	.L9
	leal	-1(%rdx), %eax
	cmpl	$2, %eax
	jbe	.L10
	shrl	$2, %edx
	xorl	%eax, %eax
	pxor	%xmm1, %xmm1
	salq	$4, %rdx
	.p2align 4,,10
	.p2align 3
.L7:
	movups	(%rdi,%rax), %xmm0
	movups	(%rsi,%rax), %xmm3
	addq	$16, %rax
	mulps	%xmm3, %xmm0
	addss	%xmm0, %xmm1
	movaps	%xmm0, %xmm2
	shufps	$85, %xmm0, %xmm2
	addss	%xmm2, %xmm1
	movaps	%xmm0, %xmm2
	unpckhps	%xmm0, %xmm2
	shufps	$255, %xmm0, %xmm0
	addss	%xmm2, %xmm1
	addss	%xmm0, %xmm1
	cmpq	%rdx, %rax
	jne	.L7
	movl	%r8d, %eax
	andl	$-4, %eax
	testb	$3, %r8b
	je	.L4
.L5:
	movslq	%eax, %rdx
	movss	(%rdi,%rdx,4), %xmm0
	mulss	(%rsi,%rdx,4), %xmm0
	leal	1(%rax), %edx
	addss	%xmm0, %xmm1
	cmpl	%edx, %r8d
	jle	.L4
	movslq	%edx, %rdx
	addl	$2, %eax
	movss	(%rdi,%rdx,4), %xmm0
	mulss	(%rsi,%rdx,4), %xmm0
	addss	%xmm0, %xmm1
	cmpl	%eax, %r8d
	jle	.L4
	cltq
	movss	(%rsi,%rax,4), %xmm0
	mulss	(%rdi,%rax,4), %xmm0
	addss	%xmm0, %xmm1
.L4:
	movss	%xmm1, (%rcx)
	ret
	.p2align 4,,10
	.p2align 3
.L9:
	pxor	%xmm1, %xmm1
	movss	%xmm1, (%rcx)
	ret
.L10:
	xorl	%eax, %eax
	pxor	%xmm1, %xmm1
	jmp	.L5
	.cfi_endproc
.LFE2109:
	.size	_Z10dotProductPfS_iS_, .-_Z10dotProductPfS_iS_
	.p2align 4
	.globl	_Z16manualDotProductPfS_iS_
	.type	_Z16manualDotProductPfS_iS_, @function
_Z16manualDotProductPfS_iS_:
.LFB2110:
	.cfi_startproc
#APP
# 12 "dotProduct.h" 1
	vpxor %ymm0, %ymm0, %ymm0
vpxor %ymm3, %ymm3, %ymm3
.mainloop:
vmovups 0x0(%rdi), %ymm1
vmovups 0x0(%rsi), %ymm2
vmulps %ymm1, %ymm2, %ymm3
vaddps %ymm0, %ymm3, %ymm0
add $32, %rdi
add $32, %rsi
sub $8, %rdx
jnz .mainloop
vhaddps %ymm0, %ymm0, %ymm0
vhaddps %ymm0, %ymm0, %ymm0
vhaddps %ymm0, %ymm0, %ymm0
vmovups %ymm0, (%rcx)

# 0 "" 2
#NO_APP
	ret
	.cfi_endproc
.LFE2110:
	.size	_Z16manualDotProductPfS_iS_, .-_Z16manualDotProductPfS_iS_
	.p2align 4
	.globl	_Z14DPPSdotProductPfS_iS_
	.type	_Z14DPPSdotProductPfS_iS_, @function
_Z14DPPSdotProductPfS_iS_:
.LFB2111:
	.cfi_startproc
#APP
# 34 "dotProduct.h" 1
	vpxor %ymm3, %ymm3, %ymm3
.main:
vmovups 0x0(%rdi), %ymm1
vmovups 0x0(%rsi), %ymm2
vdpps $0xFF, %ymm1, %ymm2, %ymm0
vaddps %ymm0, %ymm3, %ymm3
add $32, %rdi
add $32, %rsi
sub $8, %rdx
jnz .main
vhaddps %ymm3, %ymm3, %ymm3
vmovups %ymm3, (%rcx)

# 0 "" 2
#NO_APP
	ret
	.cfi_endproc
.LFE2111:
	.size	_Z14DPPSdotProductPfS_iS_, .-_Z14DPPSdotProductPfS_iS_
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"Array Size : "
.LC7:
	.string	"Dot Product Answer : "
.LC9:
	.string	"Total time: "
.LC10:
	.string	" seconds."
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB2112:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movl	$4, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	.p2align 4,,10
	.p2align 3
.L36:
	pxor	%xmm1, %xmm1
	movq	.LC1(%rip), %rax
	cvtsi2sdl	%r12d, %xmm1
	movq	%rax, %xmm0
	call	pow@PLT
	cvttsd2sil	%xmm0, %ebx
	movslq	%ebx, %r13
	salq	$2, %r13
	movq	%r13, %rdi
	call	_Znam@PLT
	movq	%r13, %rdi
	movq	%rax, %rbp
	call	_Znam@PLT
	movq	%r13, %rdi
	movq	%rax, %r15
	call	_Znam@PLT
	movq	%rax, %r14
	testl	%ebx, %ebx
	je	.L18
	leal	-1(%rbx), %eax
	cmpl	$1598, %eax
	jbe	.L17
	movq	%r15, %xmm0
	movq	%rbp, %xmm7
	xorl	%ecx, %ecx
	movl	%ebx, 16(%rsp)
	punpcklqdq	%xmm7, %xmm0
	leaq	16(%rsp), %rsi
	movl	$16, %edx
	leaq	main._loopfn.0(%rip), %rdi
	movups	%xmm0, 24(%rsp)
	call	GOMP_parallel@PLT
.L18:
	movl	$13, %edx
	leaq	.LC2(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	leaq	_ZSt4cout(%rip), %rdi
	movl	%ebx, %esi
	call	_ZNSolsEi@PLT
	movq	%rax, %r13
	movq	(%rax), %rax
	movq	-24(%rax), %rax
	movq	240(%r13,%rax), %rdi
	testq	%rdi, %rdi
	je	.L15
	cmpb	$0, 56(%rdi)
	je	.L24
	movsbl	67(%rdi), %esi
.L25:
	movq	%r13, %rdi
	call	_ZNSo3putEc@PLT
	movq	%rax, %rdi
	call	_ZNSo5flushEv@PLT
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movq	%rax, %r13
	testl	%ebx, %ebx
	je	.L39
	leal	-1(%rbx), %eax
	cmpl	$2, %eax
	jbe	.L40
	movl	%ebx, %edx
	xorl	%eax, %eax
	pxor	%xmm1, %xmm1
	shrl	$2, %edx
	salq	$4, %rdx
	.p2align 4,,10
	.p2align 3
.L28:
	movups	0(%rbp,%rax), %xmm0
	movups	(%r15,%rax), %xmm4
	addq	$16, %rax
	mulps	%xmm4, %xmm0
	movaps	%xmm0, %xmm3
	movaps	%xmm0, %xmm2
	addss	%xmm1, %xmm3
	shufps	$85, %xmm0, %xmm2
	movaps	%xmm2, %xmm1
	movaps	%xmm0, %xmm2
	unpckhps	%xmm0, %xmm2
	shufps	$255, %xmm0, %xmm0
	addss	%xmm3, %xmm1
	addss	%xmm2, %xmm1
	addss	%xmm0, %xmm1
	cmpq	%rdx, %rax
	jne	.L28
	movl	%ebx, %eax
	andl	$-4, %eax
	testb	$3, %bl
	je	.L26
.L27:
	movslq	%eax, %rcx
	movss	(%r15,%rcx,4), %xmm0
	mulss	0(%rbp,%rcx,4), %xmm0
	leaq	0(,%rcx,4), %rdx
	leal	1(%rax), %ecx
	addss	%xmm0, %xmm1
	cmpl	%ecx, %ebx
	jle	.L26
	movss	4(%r15,%rdx), %xmm0
	mulss	4(%rbp,%rdx), %xmm0
	addl	$2, %eax
	addss	%xmm0, %xmm1
	cmpl	%eax, %ebx
	jle	.L26
	movss	8(%r15,%rdx), %xmm0
	mulss	8(%rbp,%rdx), %xmm0
	addss	%xmm0, %xmm1
.L26:
	movss	%xmm1, (%r14)
	movl	$21, %edx
	leaq	.LC7(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	movss	%xmm1, 8(%rsp)
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movss	8(%rsp), %xmm1
	pxor	%xmm0, %xmm0
	leaq	_ZSt4cout(%rip), %rdi
	cvtss2sd	%xmm1, %xmm0
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movq	%rax, %rbp
	movq	(%rax), %rax
	movq	-24(%rax), %rax
	movq	240(%rbp,%rax), %r14
	testq	%r14, %r14
	je	.L15
	cmpb	$0, 56(%r14)
	je	.L30
	movsbl	67(%r14), %esi
.L31:
	movq	%rbp, %rdi
	call	_ZNSo3putEc@PLT
	movq	%rax, %rdi
	call	_ZNSo5flushEv@PLT
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movl	$12, %edx
	leaq	.LC9(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	subq	%r13, %rax
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	divsd	.LC8(%rip), %xmm0
	movsd	%xmm0, 8(%rsp)
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movsd	8(%rsp), %xmm0
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movl	$9, %edx
	leaq	.LC10(%rip), %rsi
	movq	%rax, %rbp
	movq	%rax, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	0(%rbp), %rax
	movq	-24(%rax), %rax
	movq	240(%rbp,%rax), %r13
	testq	%r13, %r13
	je	.L15
	cmpb	$0, 56(%r13)
	je	.L32
	movsbl	67(%r13), %esi
.L33:
	movq	%rbp, %rdi
	call	_ZNSo3putEc@PLT
	movq	%rax, %rdi
	call	_ZNSo5flushEv@PLT
	movq	_ZSt4cout(%rip), %rax
	leaq	_ZSt4cout(%rip), %rdx
	movq	-24(%rax), %rax
	movq	240(%rdx,%rax), %rbp
	testq	%rbp, %rbp
	je	.L15
	cmpb	$0, 56(%rbp)
	je	.L34
	movsbl	67(%rbp), %esi
.L35:
	leaq	_ZSt4cout(%rip), %rdi
	addl	$1, %r12d
	call	_ZNSo3putEc@PLT
	movq	%rax, %rdi
	call	_ZNSo5flushEv@PLT
	cmpl	$17, %r12d
	jne	.L36
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L34:
	.cfi_restore_state
	movq	%rbp, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	0(%rbp), %rax
	movl	$10, %esi
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rdx
	movq	48(%rax), %rax
	cmpq	%rdx, %rax
	je	.L35
	movq	%rbp, %rdi
	call	*%rax
	movsbl	%al, %esi
	jmp	.L35
	.p2align 4,,10
	.p2align 3
.L32:
	movq	%r13, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	0(%r13), %rax
	movl	$10, %esi
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rdx
	movq	48(%rax), %rax
	cmpq	%rdx, %rax
	je	.L33
	movq	%r13, %rdi
	call	*%rax
	movsbl	%al, %esi
	jmp	.L33
	.p2align 4,,10
	.p2align 3
.L30:
	movq	%r14, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	(%r14), %rax
	movl	$10, %esi
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rdx
	movq	48(%rax), %rax
	cmpq	%rdx, %rax
	je	.L31
	movq	%r14, %rdi
	call	*%rax
	movsbl	%al, %esi
	jmp	.L31
	.p2align 4,,10
	.p2align 3
.L24:
	movq	%rdi, 8(%rsp)
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	8(%rsp), %rdi
	movl	$10, %esi
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rdx
	movq	(%rdi), %rax
	movq	48(%rax), %rax
	cmpq	%rdx, %rax
	je	.L25
	call	*%rax
	movsbl	%al, %esi
	jmp	.L25
	.p2align 4,,10
	.p2align 3
.L17:
	cmpl	$2, %eax
	jbe	.L37
	movl	%ebx, %edx
	xorl	%eax, %eax
	shrl	$2, %edx
	salq	$4, %rdx
	.p2align 4,,10
	.p2align 3
.L21:
	movaps	.LC3(%rip), %xmm5
	movaps	.LC4(%rip), %xmm6
	movups	%xmm5, 0(%rbp,%rax)
	movups	%xmm6, (%r15,%rax)
	addq	$16, %rax
	cmpq	%rax, %rdx
	jne	.L21
	movl	%ebx, %eax
	andl	$-4, %eax
	testb	$3, %bl
	je	.L18
.L19:
	movslq	%eax, %rcx
	movl	$0x4121eb85, 0(%rbp,%rcx,4)
	leaq	0(,%rcx,4), %rdx
	movl	$0x41223d71, (%r15,%rcx,4)
	leal	1(%rax), %ecx
	cmpl	%ecx, %ebx
	jle	.L18
	addl	$2, %eax
	movl	$0x4121eb85, 4(%rbp,%rdx)
	movl	$0x41223d71, 4(%r15,%rdx)
	cmpl	%eax, %ebx
	jle	.L18
	movl	$0x4121eb85, 8(%rbp,%rdx)
	movl	$0x41223d71, 8(%r15,%rdx)
	jmp	.L18
	.p2align 4,,10
	.p2align 3
.L39:
	pxor	%xmm1, %xmm1
	jmp	.L26
.L40:
	pxor	%xmm1, %xmm1
	xorl	%eax, %eax
	jmp	.L27
.L37:
	xorl	%eax, %eax
	jmp	.L19
.L15:
	call	_ZSt16__throw_bad_castv@PLT
	.cfi_endproc
.LFE2112:
	.size	main, .-main
	.p2align 4
	.type	_GLOBAL__sub_I__Z10dotProductPfS_iS_, @function
_GLOBAL__sub_I__Z10dotProductPfS_iS_:
.LFB2648:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	leaq	_ZStL8__ioinit(%rip), %rdi
	call	_ZNSt8ios_base4InitC1Ev@PLT
	movq	_ZNSt8ios_base4InitD1Ev@GOTPCREL(%rip), %rdi
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	leaq	__dso_handle(%rip), %rdx
	leaq	_ZStL8__ioinit(%rip), %rsi
	jmp	__cxa_atexit@PLT
	.cfi_endproc
.LFE2648:
	.size	_GLOBAL__sub_I__Z10dotProductPfS_iS_, .-_GLOBAL__sub_I__Z10dotProductPfS_iS_
	.section	.init_array,"aw"
	.align 8
	.quad	_GLOBAL__sub_I__Z10dotProductPfS_iS_
	.text
	.p2align 4
	.type	main._loopfn.0, @function
main._loopfn.0:
.LFB2654:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	movq	%rdi, %r13
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	movq	16(%rdi), %rbx
	movq	8(%rdi), %rbp
	call	omp_get_num_threads@PLT
	movl	%eax, %r12d
	call	omp_get_thread_num@PLT
	movl	%eax, %ecx
	movl	0(%r13), %eax
	cltd
	idivl	%r12d
	cmpl	%edx, %ecx
	jge	.L69
	addl	$1, %eax
	xorl	%edx, %edx
.L69:
	imull	%eax, %ecx
	addl	%ecx, %edx
	leal	(%rax,%rdx), %edi
	cmpl	%edi, %edx
	jge	.L62
	movslq	%edx, %r8
	leaq	0(,%r8,4), %r9
	leaq	1(%r8), %rsi
	leaq	0(%rbp,%r9), %r10
	leaq	(%rbx,%rsi,4), %r11
	movq	%r10, %rcx
	subq	%r11, %rcx
	cmpq	$8, %rcx
	ja	.L74
.L78:
	movss	.LC5(%rip), %xmm1
	movss	.LC6(%rip), %xmm0
.L75:
	movss	%xmm1, (%rbx,%r8,4)
	movss	%xmm0, 0(%rbp,%r8,4)
	movq	%rsi, %r8
	cmpl	%esi, %edi
	jg	.L79
.L62:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L74:
	.cfi_restore_state
	leal	-1(%rax), %ecx
	cmpl	$3, %ecx
	jbe	.L78
	movl	%eax, %esi
	movaps	.LC3(%rip), %xmm1
	leaq	(%rbx,%r9), %r8
	xorl	%ecx, %ecx
	shrl	$2, %esi
	movaps	.LC4(%rip), %xmm0
	salq	$4, %rsi
	.p2align 4,,10
	.p2align 3
.L66:
	movups	%xmm1, (%r8,%rcx)
	movups	%xmm0, (%r10,%rcx)
	addq	$16, %rcx
	cmpq	%rsi, %rcx
	jne	.L66
	movl	%eax, %ecx
	andl	$-4, %ecx
	addl	%ecx, %edx
	cmpl	%ecx, %eax
	je	.L62
	movss	.LC5(%rip), %xmm1
	movss	.LC6(%rip), %xmm0
	movslq	%edx, %rax
	movss	%xmm1, (%rbx,%rax,4)
	movss	%xmm0, 0(%rbp,%rax,4)
	leal	1(%rdx), %eax
	cmpl	%eax, %edi
	jle	.L62
	cltq
	addl	$2, %edx
	movss	%xmm1, (%rbx,%rax,4)
	movss	%xmm0, 0(%rbp,%rax,4)
	cmpl	%edx, %edi
	jle	.L62
	movslq	%edx, %rdx
	movss	%xmm1, (%rbx,%rdx,4)
	movss	%xmm0, 0(%rbp,%rdx,4)
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L79:
	.cfi_restore_state
	addq	$1, %rsi
	jmp	.L75
	.cfi_endproc
.LFE2654:
	.size	main._loopfn.0, .-main._loopfn.0
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	0
	.long	1073741824
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC3:
	.long	1092742021
	.long	1092742021
	.long	1092742021
	.long	1092742021
	.align 16
.LC4:
	.long	1092762993
	.long	1092762993
	.long	1092762993
	.long	1092762993
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC5:
	.long	1092742021
	.align 4
.LC6:
	.long	1092762993
	.section	.rodata.cst8
	.align 8
.LC8:
	.long	0
	.long	1104006501
	.hidden	__dso_handle
	.ident	"GCC: (Debian 10.2.1-6) 10.2.1 20210110"
	.section	.note.GNU-stack,"",@progbits
