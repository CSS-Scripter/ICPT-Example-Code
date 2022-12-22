	.file	"main.c"
	.text

	.globl	getMinutes
	.type	getMinutes, @function
getMinutes:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movabsq	$-8608480567731124087, %rdx
	mulq	%rdx
	movq	%rdx, %rax
	shrq	$5, %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	getMinutes, .-getMinutes
	.globl	getHours
	.type	getHours, @function
getHours:
.LFB1:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	shrq	$4, %rax
	movabsq	$655884233731895169, %rdx
	mulq	%rdx
	movq	%rdx, %rax
	shrq	$3, %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	getHours, .-getHours
	.globl	getDays
	.type	getDays, @function
getDays:
.LFB2:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movabsq	$-4454547087429121353, %rdx
	mulq	%rdx
	movq	%rdx, %rax
	shrq	$16, %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	getDays, .-getDays
	.globl	getMonths
	.type	getMonths, @function
getMonths:
.LFB3:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movabsq	$7462505059349562807, %rdx
	mulq	%rdx
	movq	%rdx, %rax
	shrq	$20, %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	getMonths, .-getMonths
	.globl	getYears
	.type	getYears, @function
getYears:
.LFB4:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	shrq	$7, %rax
	movabsq	$153339145055128003, %rdx
	mulq	%rdx
	movq	%rdx, %rax
	shrq	$11, %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	getYears, .-getYears

	.section	.rodata
.LC0:
	.string	"jaar"
.LC1:
	.string	"jaren"
.LC2:
	.string	"maand"
.LC3:
	.string	"maanden"
.LC4:
	.string	"dag"
.LC5:
	.string	"dagen"
.LC6:
	.string	"uur"
.LC7:
	.string	"uren"
.LC8:
	.string	"minuut"
.LC9:
	.string	"minuten"
.LC10:
	.string	"seconde"
.LC11:
	.string	"seconden"
	.align 8

.LC12:
	.string	"%lu %s, %d %s, %d %s, %d %s, %d %s, %lu %s"
	.text


	.globl	printFormattedSeconds
	.type	printFormattedSeconds, @function
printFormattedSeconds:
.LFB5:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movq	%rdi, -88(%rbp)
	movq	-88(%rbp), %rax
	movq	%rax, %rdi
	call	getYears            
	movq	%rax, -56(%rbp)
	movq	-56(%rbp), %rax
	imulq	$31536000, %rax, %rax
	subq	%rax, -88(%rbp)
	movq	-88(%rbp), %rax
	movq	%rax, %rdi
	call	getMonths           
	movl	%eax, -72(%rbp)
	movl	-72(%rbp), %eax
	imull	$2592000, %eax, %eax
	cltq
	subq	%rax, -88(%rbp)
	movq	-88(%rbp), %rax
	movq	%rax, %rdi
	call	getDays             
	movl	%eax, -68(%rbp)
	movl	-68(%rbp), %eax
	imull	$86400, %eax, %eax
	cltq
	subq	%rax, -88(%rbp)
	movq	-88(%rbp), %rax
	movq	%rax, %rdi
	call	getHours            
	movl	%eax, -64(%rbp)
	movl	-64(%rbp), %eax
	imull	$3600, %eax, %eax
	cltq
	subq	%rax, -88(%rbp)
	movq	-88(%rbp), %rax
	movq	%rax, %rdi
	call	getMinutes          
	movl	%eax, -60(%rbp)
	movl	-60(%rbp), %eax
	imull	$60, %eax, %eax
	cltq
	subq	%rax, -88(%rbp)
	cmpq	$1, -56(%rbp)       
	jne	.L12                  
	leaq	.LC0(%rip), %rax    
	jmp	.L13                  
.L12:
	leaq	.LC1(%rip), %rax    

.L13:
	movq	%rax, -48(%rbp)     
	cmpl	$1, -72(%rbp)    
	jne	.L14                  
	leaq	.LC2(%rip), %rax    
	jmp	.L15                  
.L14:
	leaq	.LC3(%rip), %rax    

.L15:
	movq	%rax, -40(%rbp)
	cmpl	$1, -68(%rbp)       
	jne	.L16                  
	leaq	.LC4(%rip), %rax    
	jmp	.L17                  
.L16:
	leaq	.LC5(%rip), %rax    

.L17:
	movq	%rax, -32(%rbp)
	cmpl	$1, -64(%rbp)       
	jne	.L18                  
	leaq	.LC6(%rip), %rax    
	jmp	.L19                  
.L18:
	leaq	.LC7(%rip), %rax    

.L19:
	movq	%rax, -24(%rbp)
	cmpl	$1, -60(%rbp)    
	jne	.L20               
	leaq	.LC8(%rip), %rax 
	jmp	.L21               
.L20:
	leaq	.LC9(%rip), %rax

.L21:
	movq	%rax, -16(%rbp)
	cmpq	$1, -88(%rbp)    
	jne	.L22               
	leaq	.LC10(%rip), %rax

	jmp	.L23               
.L22:
	leaq	.LC11(%rip), %rax


.L23:
	movq	%rax, -8(%rbp)
	movl	-68(%rbp), %r8d
	movq	-40(%rbp), %rdi
	movl	-72(%rbp), %ecx
	movq	-48(%rbp), %rdx
	movq	-56(%rbp), %rax
	subq	$8, %rsp
	pushq	-8(%rbp)
	pushq	-88(%rbp)
	pushq	-16(%rbp)
	movl	-60(%rbp), %esi
	pushq	%rsi
	pushq	-24(%rbp)
	movl	-64(%rbp), %esi
	pushq	%rsi
	pushq	-32(%rbp)
	movl	%r8d, %r9d
	movq	%rdi, %r8
	movq	%rax, %rsi
	leaq	.LC12(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	addq	$64, %rsp
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	printFormattedSeconds, .-printFormattedSeconds
	.section	.rodata
.LC13:
	.string	"%lu"
	.text

	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC13(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	printFormattedSeconds
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	xorq	%fs:40, %rdx
	je	.L26
	call	__stack_chk_fail@PLT
.L26:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.3.0-10ubuntu2) 9.3.0"
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
