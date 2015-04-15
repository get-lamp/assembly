;	Hello world
;	Linux x64
;
;	Empty elf

global _start

section .data
pad		db		"somestring",0xa

section	.text
	
_start:
	mov rax,	60			;sys_exit
	mov rdi,	0			;return success
	syscall