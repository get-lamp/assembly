MAGIC_NUMBER equ 0xaa55

; do addition
mov ax, 0x4
mov bx, 0x1
add bx, ax
mov al, bl

; print the number
mov ah, 0x0e		; sets AH to 0xe (BIOS function teletype) 
add al, 48		; add offset converting single digit number into ASCII character
int 0x10			; call the function in ah from interrupt 0x10 
jmp $			; jump to the end


times 510-($-$$) db 0 	; padding 0 so that the total length of the program is 512 bytes
dw MAGIC_NUMBER		; boot sector protocol specify that it has to end with this 2 bytes