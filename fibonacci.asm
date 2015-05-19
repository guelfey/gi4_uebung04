SECTION .data
	n DD 100
	ergebnis DQ 0
	current_high DD 0
	current_low DD 1
	last_high DD 0
	last_low DD 0

SECTION .text
	global main

main:
	; for n = 0, return 0
	mov ecx, [n]
	test ecx, ecx
	jz end

	; for n = 1, return 1
	cmp ecx, 1
	jne loop
	mov DWORD [ergebnis], 1
	jmp end

loop:
	dec ecx
	jz loopend

	; write next number in ebx:eax
	mov eax, [last_low]
	mov ebx, [last_high]
	add eax, [current_low]
	adc ebx, [current_high]
	jc overflow ; carry on high addition -> overflow

	; set last to current
	mov edx, [current_low]
	mov [last_low], edx
	mov edx, [current_high]
	mov [last_high], edx

	; set current to computed number
	mov [current_high], ebx
	mov [current_low], eax
	jmp loop

loopend:
	; copy current to ergebnis
	mov eax, [current_low]
	mov DWORD [ergebnis], eax

	mov eax, [current_high]
	mov DWORD [ergebnis+4], eax

end:
	; exit
	mov ebx, 0
	mov eax, 1
	int 0x80

overflow:
	mov DWORD [ergebnis], 0
	mov DWORD [ergebnis+4], 0
	jmp end
