
; hello.asm
; Turns on an LED connected to PB0 of ATtiny13A

#include <avr/io.h>

.org 0x0000        ; Program starts at address 0x0000 (Reset Vector)

ldi     r16, (1 << PORTB0)  ; Load immediate value into r16: set bit 0 (PINB0) to 1
out     DDRB, r16           ; Set PB0 as output (Data Direction Register B)
out     PORTB, r16          ; Set PB0 high, turning the LED on (Port B Data Register)

Start:
    rjmp Start              ; Infinite loop to keep the LED on

End:
    ldi     r16, (1 >> PORTB0)
    out     PORTB, r16      ; Set PB0 low, turning the LED off (Port B Data Register)

