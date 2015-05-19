SECTION .data
	a DD 0
	b DD 7

SECTION .text
	global main

main:
	cmp DWORD [a], 0
	jne else
	mov DWORD [b], 1
	jmp endif
else:
	mov DWORD [b], 0
endif:
	inc DWORD [a]

	mov ebx, 0
	mov eax, 1
	int 0x80
