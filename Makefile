%: %.o
	gcc -m32 $< -o $@

%.o: %.asm
	nasm -f elf32 -g -F dwarf $<
