global _start

section .data
	str_q1			db		"Converting from ASCII to DEC",0xa
	len_q1			equ		$-str_q1

	str_q2			db		"Converting from DEC to ASCII",0xa
	len_q2			equ		$-str_q1

section .bss
	int_in1			resb	2	;first operand

section .text
_start:

	mov rax,	1			;sys_write
	mov rdi,	1			;std_out
	mov rsi,	str_q1 		;buffer
	mov rdx,	len_q1		;len
	syscall

	mov rax,	len_q1
	add	rax,	'0'
	mov [int_in1],	rax

	mov rax,	1			;sys_write
	mov rdi,	1			;std_out
	mov rsi,	int_in1 	;buffer
	mov rdx,	2			;len
	syscall

	mov rax,		60			;sys exit
	syscall