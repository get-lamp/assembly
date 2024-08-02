.include "itoa.s"

.ifdef "macros.inc"
    .include "macros.inc"
.endif


.global _main
.align 2

.data

helloworld: .ascii "Hello World!\n"
helloworld_len = . -helloworld

buffer: .ascii "abcdefghijklmnoprstuvwxyz\n"
buffer_len = . -buffer

empty: .zero 64

.text

print_stack:
    mov X9, X0                     ; length
    mov X10, #0                    ; counter
    
loop_print_stack:
    
    pop W12
    strb W12, [X1, X10]

    add X10, X10, 0x1                 ; decrement X9-1
    cmp X9, X10                      ; counter has reached length?
    
    bne loop_print_stack       ; continue loop if not

    mov X0, #1
    mov X2, X9
    mov X16, #4
    svc 0x80

    ret

_main:
    
    mov X9, 0x28                    ; a = 40
    mov X10, 0x2                    ; b = 2
    add X0, X9, X10                 ; set X0 to (a + b) = 42
    
    bl itoa                        ; returns number length on X0

    adrp X1, empty@PAGE            ; buffer page address
    add X1, X1, empty@PAGEOFF     ; add buffer offset

    bl print_stack                  ; reads number length from X0

    #print buffer, buffer_len
    #print helloworld, helloworld_len

    mov X0, #0
    mov X16, #1
    svc 0x80


