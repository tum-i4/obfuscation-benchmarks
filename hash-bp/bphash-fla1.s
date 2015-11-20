	.file	"bphash-fla1.bc"
	.text
	.globl	BPHash
	.align	16, 0x90
	.type	BPHash,@function
BPHash:                                 # @BPHash
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp2:
	.cfi_def_cfa_offset 16
.Ltmp3:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp4:
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	$0, -16(%rbp)
	movl	$0, -20(%rbp)
	movl	$0, -20(%rbp)
	jmp	.LBB0_1
	.align	16, 0x90
.LBB0_4:                                #   in Loop: Header=BB0_1 Depth=1
	incq	-8(%rbp)
	incl	-20(%rbp)
.LBB0_1:                                # %loopEntry
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_2 Depth 2
	movl	$130158332, -24(%rbp)   # imm = 0x7C20EFC
	jmp	.LBB0_2
	.align	16, 0x90
.LBB0_11:                               #   in Loop: Header=BB0_2 Depth=2
	movl	-16(%rbp), %eax
	shll	$7, %eax
	movq	-8(%rbp), %rcx
	movsbl	(%rcx), %ecx
	xorl	%eax, %ecx
	movl	%ecx, -16(%rbp)
	movl	$-1827381900, -24(%rbp) # imm = 0xFFFFFFFF93145D74
.LBB0_2:                                # %loopEntry
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-24(%rbp), %eax
	cmpl	$-645859346, %eax       # imm = 0xFFFFFFFFD980F7EE
	jg	.LBB0_5
# BB#3:                                 # %loopEntry
                                        #   in Loop: Header=BB0_2 Depth=2
	cmpl	$-1827381900, %eax      # imm = 0xFFFFFFFF93145D74
	jne	.LBB0_2
	jmp	.LBB0_4
	.align	16, 0x90
.LBB0_5:                                # %loopEntry
                                        #   in Loop: Header=BB0_2 Depth=2
	cmpl	$-645859345, %eax       # imm = 0xFFFFFFFFD980F7EF
	je	.LBB0_12
# BB#6:                                 # %loopEntry
                                        #   in Loop: Header=BB0_2 Depth=2
	cmpl	$1133866326, %eax       # imm = 0x43956D56
	je	.LBB0_11
# BB#7:                                 # %loopEntry
                                        #   in Loop: Header=BB0_2 Depth=2
	cmpl	$130158332, %eax        # imm = 0x7C20EFC
	jne	.LBB0_2
# BB#8:                                 #   in Loop: Header=BB0_2 Depth=2
	movl	-20(%rbp), %eax
	cmpl	-12(%rbp), %eax
	movl	$1133866326, %eax       # imm = 0x43956D56
	jb	.LBB0_10
# BB#9:                                 # %select.mid
                                        #   in Loop: Header=BB0_2 Depth=2
	movl	$-645859345, %eax       # imm = 0xFFFFFFFFD980F7EF
.LBB0_10:                               # %select.end
                                        #   in Loop: Header=BB0_2 Depth=2
	movl	%eax, -24(%rbp)
	jmp	.LBB0_2
.LBB0_12:
	movl	-16(%rbp), %eax
	popq	%rbp
	ret
.Ltmp5:
	.size	BPHash, .Ltmp5-BPHash
	.cfi_endproc

	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp9:
	.cfi_def_cfa_offset 16
.Ltmp10:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp11:
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	subq	$40, %rsp
.Ltmp12:
	.cfi_offset %rbx, -24
	movl	$0, -16(%rbp)
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	movq	8(%rsi), %rbx
	movq	%rbx, -40(%rbp)
	movq	%rbx, %rdi
	callq	strlen
	movq	%rbx, %rdi
	movl	%eax, %esi
	callq	BPHash
	movl	%eax, -44(%rbp)
	movl	%eax, -12(%rbp)
	movl	$-1120092329, -48(%rbp) # imm = 0xFFFFFFFFBD3CBF57
	jmp	.LBB1_1
	.align	16, 0x90
.LBB1_10:                               # %loopEntry
                                        #   in Loop: Header=BB1_1 Depth=1
	xorl	%eax, %eax
	callq	printf
	movl	$1237159872, -48(%rbp)  # imm = 0x49BD8FC0
.LBB1_1:                                # %loopEntry
                                        # =>This Inner Loop Header: Depth=1
	movl	-48(%rbp), %eax
	cmpl	$1237159871, %eax       # imm = 0x49BD8FBF
	jg	.LBB1_11
# BB#2:                                 # %loopEntry
                                        #   in Loop: Header=BB1_1 Depth=1
	cmpl	$-1363909701, %eax      # imm = 0xFFFFFFFFAEB463BB
	je	.LBB1_9
# BB#3:                                 # %loopEntry
                                        #   in Loop: Header=BB1_1 Depth=1
	cmpl	$-1120092329, %eax      # imm = 0xFFFFFFFFBD3CBF57
	jne	.LBB1_4
# BB#6:                                 # %first
                                        #   in Loop: Header=BB1_1 Depth=1
	movl	-12(%rbp), %eax
	cmpl	$1543172857, %eax       # imm = 0x5BFAF2F9
	movl	$-1363909701, %eax      # imm = 0xFFFFFFFFAEB463BB
	je	.LBB1_8
# BB#7:                                 # %select.mid
                                        #   in Loop: Header=BB1_1 Depth=1
	movl	$-409212762, %eax       # imm = 0xFFFFFFFFE79BE8A6
.LBB1_8:                                # %select.end
                                        #   in Loop: Header=BB1_1 Depth=1
	movl	%eax, -48(%rbp)
	jmp	.LBB1_1
	.align	16, 0x90
.LBB1_11:                               # %loopEntry
                                        #   in Loop: Header=BB1_1 Depth=1
	cmpl	$1237159872, %eax       # imm = 0x49BD8FC0
	jne	.LBB1_1
	jmp	.LBB1_12
.LBB1_9:                                #   in Loop: Header=BB1_1 Depth=1
	movl	$.L.str, %edi
	jmp	.LBB1_10
.LBB1_4:                                # %loopEntry
                                        #   in Loop: Header=BB1_1 Depth=1
	cmpl	$-409212762, %eax       # imm = 0xFFFFFFFFE79BE8A6
	jne	.LBB1_1
# BB#5:                                 #   in Loop: Header=BB1_1 Depth=1
	movl	$.L.str1, %edi
	jmp	.LBB1_10
.LBB1_12:
	xorl	%eax, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	ret
.Ltmp13:
	.size	main, .Ltmp13-main
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


	.ident	"Obfuscator-clang version 3.4 (tags/RELEASE_34/final) (based on LLVM 3.4svn)"
	.section	".note.GNU-stack","",@progbits
