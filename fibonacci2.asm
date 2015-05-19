SECTION .data
	testvalue DD 14
	ergebnis DD 0

SECTION .text
	global main

main:
	mov ecx, 1
	mov ebx, 1
	mov edx, 0
	mov eax, [testvalue]
	test eax, eax
	jz end

loop:
	cmp ebx, eax
	jge testfib
	mov edi, ebx
	add ebx, edx
	mov edx, edi
	inc ecx

	jmp loop

testfib:
	cmp ebx, eax
	jne end
	mov [ergebnis], ecx

end:
	mov ebx, 0
	mov eax, 1
	int 0x80
