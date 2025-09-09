.nolist
.include "tn13def.inc"
.list

; define constnt
.equ LED_PIN = PB4			    ; use PB0 as LED pin

; define register
.def tmp = r16				    ; define r16 as temporary register
.def ovf_count = r17

; start vector
.org	0x0000
	rjmp main

; interrupt vectors
.org    OVF0addr			    ; Timer/Counter Overflow
	rjmp OVF0_isr			    ; jump to label OC0A_isr

; main program
main:
    clr ovf_count
	sbi	DDRB, LED_PIN		    ; set LED pin as output

	ldi	tmp, (1<<CS02)|(1<<CS00); set configuration bits to temprary register
	out	TCCR0B, tmp		        ; set prescaler (F=1200000Hz/1024/256=4Hz, 0.25s)

	ldi	tmp, (1<<TOIE0)	        ; set configuration bits to temprary register
	out	TIMSK0, tmp		        ; enable Timer Compare Match A Interrupt

	sei				            ; enable global interrupts
loop:
	rjmp loop			    ; infinity loop

; timer compare match interrupt service routine
OVF0_isr:
    inc ovf_count           ; count overflows
    cpi ovf_count, 24        ; reached 3 overflows?
    brne T0_exit

    sbi PINB, LED_PIN       ; toggle PB4
    clr ovf_count           ; reset counter

    T0_exit:
	    reti