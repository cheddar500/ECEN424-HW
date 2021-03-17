	.file	"getbrpen.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"cycle: "
.LC1:
	.string	"%u "
	.text
	.globl	dumpcycle
	.type	dumpcycle, @function
dumpcycle:
.LFB20:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	cmpl	$0, cindex(%rip)
	jle	.L2
	movl	$0, %ebx
.L3:
	movl	cycle(,%rbx,4), %esi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	printf
	leal	1(%rbx), %eax
	addq	$1, %rbx
	cmpl	%eax, cindex(%rip)
	jg	.L3
.L2:
	movl	$10, %edi
	call	putchar
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE20:
	.size	dumpcycle, .-dumpcycle
	.globl	sortcycle
	.type	sortcycle, @function
sortcycle:
.LFB21:
	.cfi_startproc
	movl	cindex(%rip), %edi
	movl	$1, %r8d
	movl	$1, %eax
	jmp	.L6
.L8:
	leal	-1(%rax), %ecx
	movslq	%ecx, %rdx
	movl	cycle(,%rdx,4), %esi
	movslq	%eax, %rdx
	movl	cycle(,%rdx,4), %edx
	cmpl	%edx, %esi
	jbe	.L7
	movslq	%eax, %r8
	movl	%esi, cycle(,%r8,4)
	movslq	%ecx, %rcx
	movl	%edx, cycle(,%rcx,4)
	movl	$0, %r8d
.L7:
	addl	$1, %eax
	jmp	.L6
.L10:
	movl	$1, %r8d
	movl	$1, %eax
.L6:
	cmpl	%edi, %eax
	jl	.L8
	testl	%r8d, %r8d
	je	.L10
	rep ret
	.cfi_endproc
.LFE21:
	.size	sortcycle, .-sortcycle
	.section	.rodata.str1.1
.LC2:
	.string	"Malloc failed\n"
	.text
	.globl	allocarrays
	.type	allocarrays, @function
allocarrays:
.LFB22:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	leal	0(,%rdi,4), %ebx
	movslq	%ebx, %rbx
	movq	%rbx, %rdi
	call	malloc
	movq	%rax, valA(%rip)
	testq	%rax, %rax
	jne	.L12
	movq	stderr(%rip), %rcx
	movl	$14, %edx
	movl	$1, %esi
	movl	$.LC2, %edi
	call	fwrite
	movl	$-1, %edi
	call	exit
.L12:
	movq	%rbx, %rdi
	call	malloc
	movq	%rax, valB(%rip)
	testq	%rax, %rax
	jne	.L11
	movq	stderr(%rip), %rcx
	movl	$14, %edx
	movl	$1, %esi
	movl	$.LC2, %edi
	call	fwrite
	movl	$-1, %edi
	call	exit
.L11:
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE22:
	.size	allocarrays, .-allocarrays
	.globl	initarrays1
	.type	initarrays1, @function
initarrays1:
.LFB23:
	.cfi_startproc
	testl	%edi, %edi
	jle	.L15
	leal	-1(%rdi), %eax
	leaq	4(,%rax,4), %rcx
	movl	$0, %eax
.L17:
	movq	valA(%rip), %rdx
	movl	$0, (%rdx,%rax)
	movq	valB(%rip), %rdx
	movl	$10, (%rdx,%rax)
	addq	$4, %rax
	cmpq	%rcx, %rax
	jne	.L17
.L15:
	rep ret
	.cfi_endproc
.LFE23:
	.size	initarrays1, .-initarrays1
	.globl	initarrays2
	.type	initarrays2, @function
initarrays2:
.LFB24:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movl	%edi, %ebx
	movl	$0, %edi
	call	srand48
	testl	%ebx, %ebx
	jle	.L18
	leal	-1(%rbx), %eax
	leaq	4(,%rax,4), %r12
	movl	$0, %ebx
.L20:
	movq	%rbx, %rbp
	addq	valA(%rip), %rbp
	call	mrand48
	movl	%eax, 0(%rbp)
	movq	%rbx, %rbp
	addq	valB(%rip), %rbp
	call	mrand48
	movl	%eax, 0(%rbp)
	addq	$4, %rbx
	cmpq	%r12, %rbx
	jne	.L20
.L18:
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE24:
	.size	initarrays2, .-initarrays2
	.globl	clearlist
	.type	clearlist, @function
clearlist:
.LFB25:
	.cfi_startproc
	movl	$0, cindex(%rip)
	ret
	.cfi_endproc
.LFE25:
	.size	clearlist, .-clearlist
	.section	.rodata.str1.1
.LC3:
	.string	"Best time = %u\n"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC5:
	.string	"  Difference exceeds threshold: "
	.align 8
.LC7:
	.string	"third best = %u, diff: %.2f%%\n"
	.text
	.globl	testbest
	.type	testbest, @function
testbest:
.LFB26:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	cycle(%rip), %esi
	movl	$.LC3, %edi
	movl	$0, %eax
	call	printf
	movl	cycle+8(%rip), %eax
	cvtsi2sdq	%rax, %xmm0
	movl	cycle(%rip), %eax
	cvtsi2sdq	%rax, %xmm1
	movapd	%xmm0, %xmm2
	subsd	%xmm1, %xmm2
	movapd	%xmm2, %xmm1
	divsd	%xmm0, %xmm1
	ucomisd	.LC4(%rip), %xmm1
	jbe	.L23
	movl	$.LC5, %edi
	movl	$0, %eax
	call	printf
	movl	cycle+8(%rip), %esi
	movl	%esi, %eax
	cvtsi2sdq	%rax, %xmm1
	movl	cycle(%rip), %eax
	cvtsi2sdq	%rax, %xmm0
	movapd	%xmm1, %xmm3
	subsd	%xmm0, %xmm3
	movapd	%xmm3, %xmm0
	mulsd	.LC6(%rip), %xmm0
	divsd	%xmm1, %xmm0
	movl	$.LC7, %edi
	movl	$1, %eax
	call	printf
.L23:
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE26:
	.size	testbest, .-testbest
	.section	.rodata.str1.8
	.align 8
.LC8:
	.string	"fatal error: overflowed cycle array\n"
	.text
	.globl	addtolist
	.type	addtolist, @function
addtolist:
.LFB27:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	cindex(%rip), %edx
	leal	1(%rdx), %eax
	movl	%eax, cindex(%rip)
	movslq	%edx, %rdx
	movl	%edi, cycle(,%rdx,4)
	cmpl	$20, %eax
	jle	.L37
	movq	stderr(%rip), %rcx
	movl	$36, %edx
	movl	$1, %esi
	movl	$.LC8, %edi
	call	fwrite
	movl	$-1, %edi
	call	exit
.L37:
	call	sortcycle
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE27:
	.size	addtolist, .-addtolist
	.globl	absdiff
	.type	absdiff, @function
absdiff:
.LFB28:
	.cfi_startproc
	movl	%edi, %eax
	subl	%esi, %eax
	movl	%esi, %edx
	subl	%edi, %edx
	cmpl	%esi, %edi
	cmovle	%edx, %eax
	ret
	.cfi_endproc
.LFE28:
	.size	absdiff, .-absdiff
	.globl	measurecnt
	.type	measurecnt, @function
measurecnt:
.LFB29:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	movl	$0, 12(%rsp)
	movl	$1, %ebx
.L46:
	movl	12(%rsp), %eax
	addl	$1, %eax
	movl	%eax, 12(%rsp)
	call	start_counter
	leal	-1(%rbx), %edx
	testl	%ebx, %ebx
	jle	.L43
.L44:
	movl	12(%rsp), %ecx
	addl	$1, %ecx
	movl	%ecx, 12(%rsp)
	subl	$1, %edx
	cmpl	$-1, %edx
	jne	.L44
.L43:
	call	get_counter
	addl	%ebx, %ebx
	cmpl	$999999, %eax
	jbe	.L46
	movl	%ebx, %eax
	addq	$16, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE29:
	.size	measurecnt, .-measurecnt
	.globl	measure
	.type	measure, @function
measure:
.LFB30:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	movl	%edi, %ebx
	movl	$0, 12(%rsp)
	movl	12(%rsp), %eax
	addl	$1, %eax
	movl	%eax, 12(%rsp)
	call	start_counter
	testl	%ebx, %ebx
	jle	.L49
	movq	valB(%rip), %r9
	movq	valA(%rip), %r8
	movl	$0, %eax
.L52:
	movl	(%r9,%rax,4), %ecx
	movl	(%r8,%rax,4), %edx
	movl	%edx, %esi
	subl	%ecx, %esi
	movl	%ecx, %edi
	subl	%edx, %edi
	cmpl	%edx, %ecx
	cmovge	%edi, %esi
	movl	%esi, %edx
	movl	12(%rsp), %ecx
	addl	%ecx, %edx
	movl	%edx, 12(%rsp)
	addq	$1, %rax
	cmpl	%eax, %ebx
	jg	.L52
.L49:
	call	get_counter
	movl	$0, %edx
	divl	%ebx
	addq	$16, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE30:
	.size	measure, .-measure
	.section	.rodata.str1.8
	.align 8
.LC9:
	.string	"Measuring using %d iterations\n"
	.align 8
.LC10:
	.string	"Cycles per function call, predictable branches"
	.align 8
.LC11:
	.string	"Cycles per function call, unpredictable branches"
	.text
	.globl	main
	.type	main, @function
main:
.LFB31:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	call	measurecnt
	movl	%eax, %ebp
	movl	%eax, %esi
	movl	$.LC9, %edi
	movl	$0, %eax
	call	printf
	movl	%ebp, %edi
	call	allocarrays
	movl	%ebp, %edi
	call	initarrays1
	movl	$0, cindex(%rip)
	movl	$20, %ebx
.L56:
	movl	%ebp, %edi
	call	measure
	movl	%eax, %edi
	call	addtolist
	subl	$1, %ebx
	jne	.L56
	movl	$.LC10, %edi
	call	puts
	movl	$0, %eax
	call	testbest
	movl	%ebp, %edi
	call	initarrays2
	movl	$0, cindex(%rip)
	movl	$20, %ebx
.L58:
	movl	%ebp, %edi
	call	measure
	movl	%eax, %edi
	call	addtolist
	subl	$1, %ebx
	jne	.L58
	movl	$.LC11, %edi
	call	puts
	movl	$0, %eax
	call	testbest
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE31:
	.size	main, .-main
	.comm	valB,8,8
	.comm	valA,8,8
	.comm	cindex,4,4
	.comm	cycle,80,32
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC4:
	.long	1202590843
	.long	1064598241
	.align 8
.LC6:
	.long	0
	.long	1079574528
	.ident	"GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-36)"
	.section	.note.GNU-stack,"",@progbits
