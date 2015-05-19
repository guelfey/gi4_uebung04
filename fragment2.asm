SECTION .data
	a TIMES 10 DD 0

SECTION .text
	global main

main:
	mov ecx, 0
	mov edx, a
loop:
	cmp ecx, 10
	jge loopend
	mov [edx+4*ecx], ecx
	inc ecx
	jmp loop

loopend:
	mov ebx, 0
	mov eax, 1
	int 0x80
	
