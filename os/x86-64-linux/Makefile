boot_sect.bin: boot_sect.asm
	nasm boot_sect.asm -f bin -o boot_sect.bin

run: boot_sect.bin
	qemu-system-x86_64 -hda boot_sect.bin

clean:
	@rm boot_sect.bin
