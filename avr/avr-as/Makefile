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
	avr-gcc $(CFLAGS) -c blink.S -o blink.o

blink.hex: blink.o
	avr-objcopy -O ihex blink.o blink.hex

build: blink.hex
# NOP

burn: blink.hex
	avrdude -v -c stk500v1 -b $(BAUD_RATE) -p t13a -P /dev/ttyACM0 -U flash:w:blink.hex:i

.PHONY: clean assembly_listing sim debug

list: blink.o
# -d	Disassemble the contents of executable sections (e.g. .text).
# -r 	Display relocation information (i.e., places where the linker needs to fix up addresses/symbols).
# -w 	Wide format output — don’t wrap lines to fit in 80 characters. Useful for seeing full instructions and comments without line breaks.
# -C 	Demangle symbol names (mainly for C++). So instead of _Z6foobarv, you’ll see foobar().
# -S 	Intermix source code with disassembly, if debugging info (-g) was included when compiling.
	avr-objdump -dwC blink.o

sim: blink.o
	simavr -g -m $(MCU) -f $(CPU_FREQ) blink.o

debug: blink.o
# run simavr in background \
# store simavr process PID in a temporary file \
# run avr-gdb and connect with simavr, remotely on port 1234 \
# when avr-gdb process ends, store simavr PID back in a variable \
# kill simavr \
# delete the temporary file

	@simavr -g -m $(MCU) -f $(CPU_FREQ) blink.o & \
	echo $$! > .simavr_pid && \
	avr-gdb -ex "target remote :1234" blink.o && \
	PID=$$(cat .simavr_pid) && \
	kill $$PID && \
	rm .simavr_pid;

ping:
	# /etc/avrdude.conf
	avrdude -c stk500v1 -b $(BAUD_RATE) -p t13a -P /dev/ttyACM0

fuse_read:
	avrdude -v -c stk500v1 -b $(BAUD_RATE) -p t13a -P /dev/ttyACM0 -U hfuse:r:-:i -U lfuse:r:-:i

clean:
# -f, --force: ignore nonexistent files and arguments, never prompt
	rm -f *.o *.hex *.pid

