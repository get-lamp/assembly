;	Hello world
;	Linux x86-64
;
;	General Purpose Registers for
;	8 bit:		AL/AH, CL/CH, DL/DH, BL/BH, SPL, BPL, SIL, DIL, R8B-R15B 
;	16 bit:		AX, CX, DX, BX, SP, BP, SI, DI, R8W-R15W 
;	32 bit:		EAX, ECX, EDX, EBX, ESP, EBP, ESI, EDI, R8D-R15D 
;	64 bit:		RAX, RCX, RDX, RBX, RSP, RBP, RSI, RDI, R8-R15

global _start

section	.data

	msg			db		"Hello World!",0xa
	msg_len		equ		$-msg

section	.bsd
section	.text
	
_start:
	mov rax,	1			;sys_write
	mov	rdi,	1			;stdout
	mov	rsi,	msg 		;the message
	mov rdx,	msg_len		;thr message length
	syscall

	mov rax,	60			;sys_exit
	mov rdi,	0			;return success
	syscall