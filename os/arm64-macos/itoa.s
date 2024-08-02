.ifndef "macros.inc"
	.include "macros.inc"
.endif


.text

.global itoa, itoa_fast


itoa:                   		; int_to_ascii(X0=int) (X0=stack_offset)                
    
    mov X9, 0xa                 ; store 10 divisor
    mov X10, 0x0                ; initialize iterate_number loop counter 

itoa_loop:                    

    udiv X11, X0, X9            ; divide by 10, equals floor(a/b)
    msub X12, X11, X9, X0       ; a - (floor(b/c) * c) - get the remainder

    cbz X12, itoa_exit

    add X12, X12, 0x30          ; add offset to get it in ASCII range. 0x30 = '0'
    
    push X12                    ; push ASCII caharacter

    add X10, X10, 0x1
    mov X0, X11
    b itoa_loop


itoa_exit:
    mov X0, X10
    ret


itoa_fast:
	mov X9, 0xa                 ; store 10 divisor
    mov X10, 0x0                ; initialize iterate_number loop counter 

itoa_fast_loop: 

	udiv X11, X0, X9            ; divide by 10, equals floor(a/b)
    msub X12, X11, X9, X0       ; a - (floor(b/c) * c) - get the remainder

    cbz X12, itoa_fast_exit

    add X12, X12, 0x30          ; add offset to get it in ASCII range. 0x30 = '0'



itoa_fast_exit:
    mov X0, X10
    ret