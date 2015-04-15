global _start

section .data

str_q1			db		"Enter digit",0xa
len_q1			equ		$-str_q1
str_q2			db		"Please, enter a second digit",0xa
len_q2			equ		$-str_q2
str_q3			db		"The answer is: ",0xa
len_q3			equ		$-str_q3

section .bss

int_in1			resb	2	;first operand
int_in2			resb	2	;second operand
int_out			resb	1	;result

section .text
_start:
							;FIRST QUESTION TEXT
	mov rax,	1			;sys_write
	mov rdi,	1			;std_out
	mov rsi,	str_q1 		;buffer
	mov rdx,	len_q1		;len
	syscall

							;READ USER INPUT
	mov	rax,	0			;sys_read
	mov rdi,	0,			;std_in
	mov rsi,	int_in1		;buffer
	mov rdx,	2			;len
	syscall

							;SECOND QUESTION TEXT
	mov rax,	1			;sys_write
	mov rdi,	1			;std_out
	mov rsi,	str_q2 		;buffer
	mov rdx,	len_q2		;len
	syscall

							;READ USER INPUT
	mov	rax,	0			;sys_read
	mov rdi,	0,			;std_in
	mov rsi,	int_in2		;buffer
	mov rdx,	2			;len
	syscall

	mov rax,	[int_in1]	;subtract ASCII '0' from rax
	sub	rax,	'0'			;converts it to decimal

	mov rdi,	[int_in2]
	sub rdi,	'0'

	add rax,	rdi			;rax = rax + rdi
	add rax,	'0'			;converts it back to ASCII

	mov [int_out],	rax		;store result in int_out

							;SHOW RESULT
	mov rax,	1			;sys_write
	mov rdi,	1			;std_out
	mov rsi,	int_out 	;buffer
	mov rdx,	1			;len
	syscall

	mov rax,	60			;sys exit
	syscall
