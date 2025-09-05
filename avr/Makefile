.SILENT: clean

CFLAGS = -S -O1 -Wcpp -DF_CPU="1000000" -mmcu=attiny13a

asm_blink.s:
	avr-gcc $(CFLAGS) -c blink.c -o asm_blink.s

c_blink.o:
	avr-gcc $(CFLAGS) -c blink.c -o c_blink.o

.PHONY: clean assembly_listing

assembly_listing: c_blink.o
	avr-objdump -drwC -Mintel -S c_blink.o

clean:
	# -f, --force: ignore nonexistent files and arguments, never prompt
	rm -f *.o

