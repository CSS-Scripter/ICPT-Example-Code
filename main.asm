	.file	"main.c"
	.text

; Define getMinutes function
	.globl	getMinutes
	.type	getMinutes, @function
getMinutes:
.LFB0:
    ; Functie opstarten
	.cfi_startproc
	endbr64

	; Maak een push queue | Register
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16

    ; Verplaats waarde %rsp (current callstack) naar %rbp (register)
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6

    ; Verplaats %rdi (eerste argument; unsigned long seconds) naar -8(%rbp)
	movq	%rdi, -8(%rbp)
    ; Verplaats -8(%rbp) naar %rax (return value)
	movq	-8(%rbp), %rax

	; Iets met #define SECONDS_IN_MINUTE naar %rdx
	movabsq	$-8608480567731124087, %rdx
	; Multiply Q?
	mulq	%rdx

	; Move %rdx naar %rax (return value)
	movq	%rdx, %rax

	; Shift return value 5 naar rechts
	shrq	$5, %rax

	; Remove register
	popq	%rbp
	.cfi_def_cfa 7, 8

	; Functie afsluiten
	ret
	.cfi_endproc
.LFE0:
	.size	getMinutes, .-getMinutes

; Define getHours function
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

; Define getDays function
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

; define getMonths function
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

; Define getYears function
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

; Define string turniary values
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

; Define final print output
.LC12:
	.string	"%lu %s, %d %s, %d %s, %d %s, %d %s, %lu %s"
	.text

; Define printFormattedSeconds
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
	call	getYears            ; Calc years
	movq	%rax, -56(%rbp)
	movq	-56(%rbp), %rax
	imulq	$31536000, %rax, %rax
	subq	%rax, -88(%rbp)
	movq	-88(%rbp), %rax
	movq	%rax, %rdi
	call	getMonths           ; Calc months
	movl	%eax, -72(%rbp)
	movl	-72(%rbp), %eax
	imull	$2592000, %eax, %eax
	cltq
	subq	%rax, -88(%rbp)
	movq	-88(%rbp), %rax
	movq	%rax, %rdi
	call	getDays             ; Calc days
	movl	%eax, -68(%rbp)
	movl	-68(%rbp), %eax
	imull	$86400, %eax, %eax
	cltq
	subq	%rax, -88(%rbp)
	movq	-88(%rbp), %rax
	movq	%rax, %rdi
	call	getHours            ; Calc hours
	movl	%eax, -64(%rbp)
	movl	-64(%rbp), %eax
	imull	$3600, %eax, %eax
	cltq
	subq	%rax, -88(%rbp)
	movq	-88(%rbp), %rax
	movq	%rax, %rdi
	call	getMinutes          ; Calc minutes
	movl	%eax, -60(%rbp)
	movl	-60(%rbp), %eax
	imull	$60, %eax, %eax
	cltq
	subq	%rax, -88(%rbp)

	; Begin met definieren enkelvoud meervoud
	; Beslis gebruik "jaar" of "jaren"
	cmpq	$1, -56(%rbp)       ; Vergelijk 1 en -56(%rbp) (hoeveelheid jaren)
	jne	.L12                    ; NIET GELIJK & NIET NUL: Ga door naar .L12
	leaq	.LC0(%rip), %rax    ; ANDERS:  Gebruik "jaar" (in address %rax)

	jmp	.L13                    ; Ga door naar .L13 (defineer maanden)
.L12:
	leaq	.LC1(%rip), %rax    ; Gebruik "jaren" (in address %rax)

; Schrijf waarde %rax ("jaar" of "jaren") naar -48(%rbp)
; Zet waarde %rax naar "maand" of "maanden"
.L13:
    ; Schrijf waarde %rax weg
	movq	%rax, -48(%rbp)     ; Verplaats waarde van %rax naar -48(%rbp)

	; Beslis gebruik "maanden" of "maand"
	cmpl	$1, -72(%rbp)       ; Vergelijk 1 en -72(%rbp) (hoeveelheid maanden)
	jne	.L14                    ; NIET GELIJK & NIET NUL: Ga door naar .L14
	leaq	.LC2(%rip), %rax    ; ANDERS: Gebruik "maanden" (in address %rax)

	jmp	.L15                    ; Ga door naar .L15
.L14:
	leaq	.LC3(%rip), %rax    ; Gebruik "maanden" (in address %rax)

; Schrijf waarde %rax ("maand" of "maanden") naar -40(%rbp)
; Zet waarde %rax naar "dag" of "dagen"
.L15:
    ; Schrijf waarde %rax weg
	movq	%rax, -40(%rbp)

	; Beslis gebruik "dag" of "dagen"
	cmpl	$1, -68(%rbp)       ; Vergelijk 1 en -68(%rbp) (hoeveelheid dagen)
	jne	.L16                    ; NIET GELIJK & NIET NUL: Ga door naar .L16
	leaq	.LC4(%rip), %rax    ; ANDERS: Gebruik "dag" (in address %rax)

	jmp	.L17                    ; Ga door naar .L17
.L16:
	leaq	.LC5(%rip), %rax    ; Gebruik "dagen" (in address %rax)

; Schrijf waarde %rax ("dag" of "dagen") naar -32(%rbp)
; Zet waarde %rax naar "uur" of "uren"
.L17:
    ; Schrijf waarde %rax weg
	movq	%rax, -32(%rbp)

	; Beslig gebruik "uur" of "uren"
	cmpl	$1, -64(%rbp)       ; Vergelijk 1 en -64(%rbp) (hoeveelheid uren)
	jne	.L18                    ; NIET GELIJK & NIET NUL: Ga door naar .L18
	leaq	.LC6(%rip), %rax    ; ANDERS: Gebruik "uur" (in address %rax)

	jmp	.L19                    ; Ga door naar .L19
.L18:
	leaq	.LC7(%rip), %rax    ; Gebruik "uren" (in address %rax)

; Schrijf waarde %rax ("uur" of "uren") naar -24(%rbp)
; Zet waarde %rax naar "minuut" of "minuten"
.L19:
    ; Schrijf waarde %rax weg
	movq	%rax, -24(%rbp)

	; Beslis gebruik "minuut" of "minuten"
	cmpl	$1, -60(%rbp)       ; Vergelijk 1 en -60(%rbp) (hoeveelheid minuten)
	jne	.L20                    ; NIET GELIJK & NIET NUL: Ga door naar .L20
	leaq	.LC8(%rip), %rax    ; ANDERS: Gebruik "minuut" (in address %rax)

	jmp	.L21                    ; Ga door naar .L21
.L20:
	leaq	.LC9(%rip), %rax

; Schrijf waarde %rax ("minuut" of "minuten") naar -16(%rbp)
; Zet waarde %rax naar "seconde" of "seconden"
.L21:
    ; Schrijf waarde %rax weg
	movq	%rax, -16(%rbp)

    ; Beslis gebruik "seconde" of "seconden"
	cmpq	$1, -88(%rbp)       ; Vergelijk 1 en -88(%rbp) (hoeveelheid seconden)
	jne	.L22                    ; NIET GELIJK & NIET NUL: Ga door naar .L22
	leaq	.LC10(%rip), %rax   ; ANDER: Gebruik "seconde" (in address %rax)

	jmp	.L23                    ; Ga door naar .L23
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
	leaq	.LC12(%rip), %rdi       ; Print formatted string
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

; Define main function
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
