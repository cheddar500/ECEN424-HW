	.file	"3_65.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%8d   "
	.text
	.globl	print_matrix
	.type	print_matrix, @function
print_matrix:
.LFB23:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rdi, %r12
	movl	$0, %ebp
	jmp	.L2
.L3:
	movq	%rbp, %rax
	salq	$5, %rax
	addq	%r12, %rax
	movq	(%rax,%rbx,8), %rdx
	leaq	.LC0(%rip), %rsi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	addq	$1, %rbx
.L4:
	cmpq	$3, %rbx
	jle	.L3
	movl	$10, %edi
	call	putchar@PLT
	addq	$1, %rbp
.L2:
	cmpq	$3, %rbp
	jg	.L7
	movl	$0, %ebx
	jmp	.L4
.L7:
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE23:
	.size	print_matrix, .-print_matrix
	.globl	transpose
	.type	transpose, @function
transpose:
.LFB24:
	.cfi_startproc
	endbr64
	movl	$0, %edx
	jmp	.L9
.L10:
	movq	%rdx, %rsi
	salq	$5, %rsi
	addq	%rdi, %rsi
	movq	(%rsi,%rax,8), %r8
	movq	%rax, %rcx
	salq	$5, %rcx
	addq	%rdi, %rcx
	movq	(%rcx,%rdx,8), %r9
	movq	%r9, (%rsi,%rax,8)
	movq	%r8, (%rcx,%rdx,8)
	addq	$1, %rax
.L11:
	cmpq	%rax, %rdx
	jg	.L10
	addq	$1, %rdx
.L9:
	cmpq	$3, %rdx
	jg	.L13
	movl	$0, %eax
	jmp	.L11
.L13:
	ret
	.cfi_endproc
.LFE24:
	.size	transpose, .-transpose
	.globl	transpose_optimized
	.type	transpose_optimized, @function
transpose_optimized:
.LFB25:
	.cfi_startproc
	endbr64
	ret
	.cfi_endproc
.LFE25:
	.size	transpose_optimized, .-transpose_optimized
	.globl	main
	.type	main, @function
main:
.LFB26:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$152, %rsp
	.cfi_def_cfa_offset 176
	movl	$40, %ebp
	movq	%fs:0(%rbp), %rax
	movq	%rax, 136(%rsp)
	xorl	%eax, %eax
	movq	$1, (%rsp)
	movq	$2, 8(%rsp)
	movq	$3, 16(%rsp)
	movq	$4, 24(%rsp)
	movq	$1, 32(%rsp)
	movq	$2, 40(%rsp)
	movq	$3, 48(%rsp)
	movq	$4, 56(%rsp)
	movq	$1, 64(%rsp)
	movq	$2, 72(%rsp)
	movq	$3, 80(%rsp)
	movq	$4, 88(%rsp)
	movq	$1, 96(%rsp)
	movq	$2, 104(%rsp)
	movq	$3, 112(%rsp)
	movq	$4, 120(%rsp)
	movq	%rsp, %rbx
	movq	%rbx, %rdi
	call	print_matrix
	movl	$10, %edi
	call	putchar@PLT
	movq	%rbx, %rdi
	call	transpose
	movq	%rbx, %rdi
	call	print_matrix
	movq	136(%rsp), %rax
	xorq	%fs:0(%rbp), %rax
	jne	.L18
	movl	$0, %eax
	addq	$152, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L18:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE26:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
