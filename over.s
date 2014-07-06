;BUILD--------------------------------------------------------------------------
;	yasm -f elf over.s -o over.o
;	ld -lc -dynamic-linker /lib/ld-linux.so.2 over.o over
;-------------------------------------------------------------------------------

[bits 32]

section .data
a: dq 0x8B968B989D
b: db "Witam w prostym programie do rozkminki",0xA,0

section .text
extern printf
extern _exit
global _start

_start:
	cld
	mov esi,a
	mov edi,a
	mov ecx,0xE
	inc ecx
	xor ecx,0xA
	y:lodsb
	xor al,0xFF
	inc al
	stosb
	dec ecx
	jnz y
	mov esi,a
	mov edi,b+3*2
	mov ecx,100-5*5*2-5*3*2-9*2
	rep movsd
	mov edi,b+3*3+1*2
	mov eax,0xA
	stosd
	push b
	call printf
	add esp,2*2
	xor eax,eax
	push eax
	call _exit

