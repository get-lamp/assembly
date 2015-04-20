global _start

section .data
	NEW_LINE		db		0xa
	intro			db		'Learning is a slow process...',0xa
	intro_len		equ		$-intro
	hilo			db		'H','L'
	hilo_len		equ		$-hilo 

section .bss
	_out 			resb	2

section .text
_start:

	mov eax,		4			;sys_write
	mov ebx,		1			;std_out
	mov ecx,		intro 		;buffer
	mov edx,		intro_len	;length
	int 			0x80

	;push			hilo_len	;2nd arg
	;push	dword	hilo		;1st arg
	;call			prnt		;call

	push			message
	call			prnt

	mov eax,		4			;sys_write
	mov ebx,		1			;std_out
	mov ecx,		NEW_LINE 	;buffer
	mov edx,		1			;length
	int 			0x80

	mov eax,		1			;sys exit
	int 			0x80

prnt:
	push ebp					; save base pointer on top of the stack
	mov ebp, esp				; moves base pointer to top of the stack 
	
	;mov eax,		4			;sys_write
	;mov ebx,		1			;std_out
	;mov ecx,		[ebp+8]		;buffer
	;mov edx,		[ebp+12]	;length
	;int 			0x80

	mov eax,		4			;sys_write
	mov ebx,		1			;std_out
	mov ecx,		[ebp+8]		;buffer
	mov edx,		16			;length
	int 			0x80


	mov esp, ebp				; restore stack pointer
	pop ebp						; restore base pointer
	ret

message:
	db	"...A message to you Rudy...",0xa
