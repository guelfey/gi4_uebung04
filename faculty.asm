SECTION .data
	n DD 4
	ergebnis DD 0

SECTION .text
	global main

main:
	mov ecx, [n]
	mov eax, 1
	
schleife:
	imul ecx
	loop schleife

	mov [ergebnis], eax

	mov ebx, 0
	mov eax, 1
	int 0x80	
