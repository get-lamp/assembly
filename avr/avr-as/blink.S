; hello.asm
; Turns on an LED connected to PB0 of ATtiny13A

#define __SFR_OFFSET 0x0

#include <avr/io.h>
#include <avr/interrupt.h>

#define __vector_6 0x6

; define register
#define tmp r16				    ; define r16 as temporary register

.org 0x0000         ; Program starts at address 0x0000 (Reset Vector)
    rjmp init

.org TIM0_COMPA_vect
    rjmp TIMER_ISR


init:
    sbi	DDRB, DDB4	; Set bit 4 in DDRB (0x17) - This sets the pin as output
    cbi	PORTB, PB4	; Clear bit 4 in PORTB (0x18) - This set the pin PB4 to LOW

    ldi	tmp, (1<<WGM01)		    ; set configuration bits to temprary register
    out	TCCR0A, tmp		        ; set timer counter mode to CTC
    ldi	tmp, (1<<CS02)|(1<<CS00); set configuration bits to temprary register
    out	TCCR0B, tmp		        ; set prescaler (F=1200000Hz/1024/256=4Hz, 0.25s)
    ldi	tmp, 255		        ; set value to temporary register
    out	OCR0A, tmp		        ; set OCR0A value (256 - 1)
    ldi	tmp, (1<<OCIE0A)	    ; set configuration bits to temprary register
    out	TIMSK0, tmp		        ; enable Timer Compare Match A Interrupt
    sei				            ; enable global interrupts

main:
    rjmp main

TIMER_ISR:
    sbi     PINB, PB4       ; toggle PB4
    reti
