# Reference: https://makefiletutorial.com/

.SILENT: clean

# Chip model
MCU := attiny13a
# Chip frequency (Hz)
CPU_FREQ := 1200000UL
# Flags for C compiler
CFLAGS := -g -O1 -Wcpp -DF_CPU="$(CPU_FREQ)" -mmcu=$(MCU)
# Programmer baud rate
BAUD_RATE := 19200


blink.o:
	avra -I /usr/share/avra -o blink.o blink.asm

blink.hex: blink.o
	avr-objcopy -O ihex blink.o blink.hex

build: blink.hex
# NOP

burn: blink.hex
	avrdude -v -c stk500v1 -b $(BAUD_RATE) -p t13a -P /dev/ttyACM0 -U flash:w:blink.hex:i

.PHONY: clean assembly_listing sim debug


clean:
# -f, --force: ignore nonexistent files and arguments, never prompt
	rm -f *.o *.hex *.pid *.obj

