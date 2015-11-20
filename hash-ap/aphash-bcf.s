	.file	"aphash-bcf.bc"
	.text
	.globl	APHash
	.align	16, 0x90
	.type	APHash,@function
APHash:                                 # @APHash
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp3:
	.cfi_def_cfa_offset 16
.Ltmp4:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp5:
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	pushq	%rax
.Ltmp6:
	.cfi_offset %rbx, -24
	movl	x(%rip), %eax
	leal	-1(%rax), %ecx
	imull	%eax, %ecx
	testb	$1, %cl
	je	.LBB0_2
# BB#1:
	cmpl	$9, y(%rip)
	jg	.LBB0_19
.LBB0_2:
	movq	%rsp, %r10
	leaq	-16(%r10), %r9
	movq	%r9, %rsp
	movq	%rsp, %r11
	leaq	-16(%r11), %r8
	movq	%r8, %rsp
	movq	%rsp, %rax
	leaq	-16(%rax), %rdx
	movq	%rdx, %rsp
	movq	%rsp, %rbx
	leaq	-16(%rbx), %rcx
	movq	%rcx, %rsp
	movq	%rdi, -16(%r10)
	movl	%esi, -16(%r11)
	movl	$-1431655766, -16(%rax) # imm = 0xFFFFFFFFAAAAAAAA
	movl	$0, -16(%rbx)
	movl	$0, -16(%rbx)
	movl	x(%rip), %eax
	leal	-1(%rax), %ebx
	imull	%eax, %ebx
	testb	$1, %bl
	je	.LBB0_4
# BB#3:
	cmpl	$9, y(%rip)
	jle	.LBB0_4
.LBB0_19:
	movq	%rsp, %r8
	leaq	-16(%r8), %rcx
	movq	%rcx, %rsp
	leaq	-16(%rcx), %rdx
	movq	%rdx, %rsp
	leaq	-16(%rdx), %rbx
	movq	%rbx, %rsp
	leaq	-16(%rbx), %rax
	movq	%rax, %rsp
	movq	%rdi, -16(%r8)
	movl	%esi, -16(%rcx)
	movl	$-1431655766, -16(%rdx) # imm = 0xFFFFFFFFAAAAAAAA
	movl	$0, -16(%rbx)
	movl	$0, -16(%rbx)
	jmp	.LBB0_2
	.align	16, 0x90
.LBB0_17:                               #   in Loop: Header=BB0_4 Depth=1
	incq	(%r9)
	incl	(%rcx)
.LBB0_4:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_5 Depth 2
                                        #     Child Loop BB0_10 Depth 2
	movl	x(%rip), %eax
	leal	-1(%rax), %esi
	imull	%eax, %esi
	testb	$1, %sil
.LBB0_5:                                #   Parent Loop BB0_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	(%rcx), %esi
	movl	(%r8), %edi
	movl	x(%rip), %eax
	leal	-1(%rax), %ebx
	imull	%eax, %ebx
	testb	$1, %bl
	je	.LBB0_7
# BB#6:                                 #   in Loop: Header=BB0_5 Depth=2
	cmpl	$9, y(%rip)
	jg	.LBB0_5
	.align	16, 0x90
.LBB0_7:                                #   in Loop: Header=BB0_4 Depth=1
	cmpl	%edi, %esi
	jae	.LBB0_18
# BB#8:                                 #   in Loop: Header=BB0_4 Depth=1
	testb	$1, (%rcx)
	jne	.LBB0_12
# BB#9:                                 #   in Loop: Header=BB0_4 Depth=1
	movl	x(%rip), %eax
	leal	-1(%rax), %esi
	imull	%eax, %esi
	testb	$1, %sil
.LBB0_10:                               #   Parent Loop BB0_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	(%rdx), %esi
	movl	%esi, %eax
	shll	$7, %eax
	movq	(%r9), %rdi
	movsbl	(%rdi), %edi
	shrl	$3, %esi
	imull	%edi, %esi
	xorl	%eax, %esi
	movl	x(%rip), %eax
	leal	-1(%rax), %edi
	imull	%eax, %edi
	testb	$1, %dil
	je	.LBB0_13
# BB#11:                                #   in Loop: Header=BB0_10 Depth=2
	cmpl	$10, y(%rip)
	jl	.LBB0_13
	jmp	.LBB0_10
	.align	16, 0x90
.LBB0_12:                               #   in Loop: Header=BB0_4 Depth=1
	movl	(%rdx), %esi
	movl	%esi, %eax
	shll	$11, %eax
	movq	(%r9), %rdi
	movsbl	(%rdi), %edi
	shrl	$5, %esi
	xorl	%edi, %esi
	addl	%eax, %esi
	notl	%esi
.LBB0_13:                               #   in Loop: Header=BB0_4 Depth=1
	movl	x(%rip), %eax
	leal	-1(%rax), %edi
	imull	%eax, %edi
	testb	$1, %dil
	je	.LBB0_15
# BB#14:                                #   in Loop: Header=BB0_4 Depth=1
	cmpl	$9, y(%rip)
	jg	.LBB0_20
	.align	16, 0x90
.LBB0_15:                               #   in Loop: Header=BB0_4 Depth=1
	xorl	%esi, (%rdx)
	movl	x(%rip), %eax
	leal	-1(%rax), %edi
	imull	%eax, %edi
	testb	$1, %dil
	je	.LBB0_17
# BB#16:                                #   in Loop: Header=BB0_4 Depth=1
	cmpl	$9, y(%rip)
	jle	.LBB0_17
.LBB0_20:                               #   in Loop: Header=BB0_4 Depth=1
	xorl	%esi, (%rdx)
	jmp	.LBB0_15
.LBB0_18:
	movl	(%rdx), %eax
	leaq	-8(%rbp), %rsp
	popq	%rbx
	popq	%rbp
	ret
.Ltmp7:
	.size	APHash, .Ltmp7-APHash
	.cfi_endproc

	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp11:
	.cfi_def_cfa_offset 16
.Ltmp12:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp13:
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	subq	$40, %rsp
.Ltmp14:
	.cfi_offset %rbx, -24
	movl	$0, -12(%rbp)
	movl	%edi, -16(%rbp)
	movq	%rsi, -24(%rbp)
	movq	8(%rsi), %rbx
	movq	%rbx, -32(%rbp)
	movq	%rbx, %rdi
	callq	strlen
	movq	%rbx, %rdi
	movl	%eax, %esi
	callq	APHash
	cmpl	$37524292, %eax         # imm = 0x23C9344
	movl	%eax, -36(%rbp)
	jne	.LBB1_6
# BB#1:
	movl	x(%rip), %eax
	leal	-1(%rax), %ecx
	imull	%eax, %ecx
	testb	$1, %cl
	je	.LBB1_3
# BB#2:
	cmpl	$9, y(%rip)
	jg	.LBB1_5
	jmp	.LBB1_3
.LBB1_6:
	movl	$.L.str1, %edi
	xorl	%eax, %eax
	callq	printf
	jmp	.LBB1_7
.LBB1_3:
	movl	$.L.str, %edi
	xorl	%eax, %eax
	callq	printf
	movl	x(%rip), %eax
	leal	-1(%rax), %ecx
	imull	%eax, %ecx
	testb	$1, %cl
	je	.LBB1_7
# BB#4:
	cmpl	$10, y(%rip)
	jge	.LBB1_5
.LBB1_7:
	xorl	%eax, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	ret
.LBB1_5:
	movl	$.L.str, %edi
	xorl	%eax, %eax
	callq	printf
	jmp	.LBB1_3
.Ltmp15:
	.size	main, .Ltmp15-main
	.cfi_endproc

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"The license key is correct!\n"
	.size	.L.str, 29

	.type	.L.str1,@object         # @.str1
.L.str1:
	.asciz	"The license key is incorrect!\n"
	.size	.L.str1, 31

	.type	x,@object               # @x
	.comm	x,4,4
	.type	y,@object               # @y
	.comm	y,4,4

	.ident	"Obfuscator-clang version 3.4 (tags/RELEASE_34/final) (based on LLVM 3.4svn)"
	.section	".note.GNU-stack","",@progbits
