SECTION .data
	i DD 10
	ergebnis DD 1

SECTION .text
	global main

main:
	mov ecx, [i]
	mov eax, [ergebnis]
	
schleife:
	imul ecx
	loop schleife

	mov [ergebnis], eax

	mov ebx, 0
	mov eax, 1
	int 0x80	
