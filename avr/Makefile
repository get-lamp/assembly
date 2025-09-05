# Reference: https://makefiletutorial.com/

.SILENT: clean

# Chip model
MCU := attiny13a
# Chip frequency
DF_CPU := 1000000
# Flags for C compiler
CFLAGS := -g -O1 -Wcpp -DF_CPU="$(DF_CPU)" -mmcu=$(MCU)

asm_blink.o:
	avr-gcc -S $(CFLAGS) -c blink.c -o asm_blink.o

c_blink.o:
	avr-gcc $(CFLAGS) -c blink.c -o c_blink.o

c_blink.hex: c_blink.o
	avr-objcopy -O ihex c_blink.o c_blink.hex

.PHONY: clean assembly_listing sim debug

assembly_listing: c_blink.o
	avr-objdump -drwC -Mintel -S c_blink.o

sim: c_blink.o
	simavr -g -m $(MCU) -f $(DF_CPU) c_blink.o

debug: c_blink.o
# run simavr in background \
# store simavr process PID in a temporary file \
# run avr-gdb and connect with simavr, remotely on port 1234 \
# when avr-gdb process ends, store simavr PID back in a variable \
# kill simavr \
# delete the temporary file

	@simavr -g -m $(MCU) -f $(DF_CPU) c_blink.o & \
	echo $$! > .simavr_pid && \
	avr-gdb -ex "target remote :1234" c_blink.o && \
	PID=$$(cat .simavr_pid) && \
	kill $$PID && \
	rm .simavr_pid;

clean:
# -f, --force: ignore nonexistent files and arguments, never prompt
	rm -f *.o *.hex *.pid

