# Reference: https://makefiletutorial.com/

.SILENT: clean
.PHONY: clean list

# Chip model
MCU := attiny13a
# Chip frequency (Hz)
CPU_FREQ := 1200000UL
# Flags for C compiler
CFLAGS := -g -O1 -Wcpp -DF_CPU="$(CPU_FREQ)" -mmcu=$(MCU)
# Programmer baud rate
BAUD_RATE := 19200
# file name
TARGET := timer_ovf


${TARGET}.o:
	avra -I /usr/share/avra -o ${TARGET}.o ${TARGET}.asm

${TARGET}.hex: ${TARGET}.o
	avr-objcopy -O ihex ${TARGET}.o ${TARGET}.hex

list: ${TARGET}.o
# -d	Disassemble the contents of executable sections (e.g. .text).
# -r 	Display relocation information (i.e., places where the linker needs to fix up addresses/symbols).
# -w 	Wide format output — don’t wrap lines to fit in 80 characters. Useful for seeing full instructions and comments without line breaks.
# -C 	Demangle symbol names (mainly for C++). So instead of _Z6foobarv, you’ll see foobar().
# -S 	Intermix source code with disassembly, if debugging info (-g) was included when compiling.
	avr-objdump -dwC ${TARGET}.o

build: ${TARGET}.hex
# NOP

burn: ${TARGET}.hex
	avrdude -v -c stk500v1 -b $(BAUD_RATE) -p t13a -P /dev/ttyACM0 -U flash:w:${TARGET}.hex:i

clean:
# -f, --force: ignore nonexistent files and arguments, never prompt
	rm -f *.o *.hex *.pid *.obj

