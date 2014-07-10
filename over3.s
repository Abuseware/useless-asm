;BUILD--------------------------------------------------------------------------
;	nasm -Ox -f elf over3.s -o over3.o
;	ld over3.o over3
;-------------------------------------------------------------------------------
[bits 32]
global _start

%define HELLO "Hello /dev/null"
%strlen HELLO_LEN HELLO

section .data write
hello: db HELLO,0xA

section .text-rwx write exec
print:
  mov ecx,10
  .write:
    push eax
    push ebx
    push ecx
    push edx
    mov eax, 0x04
    mov ebx, 1
    mov ecx, hello 
    mov edx, HELLO_LEN+1
    int 0x80
    pop edx
    pop ecx
    pop ebx
    pop eax
    dec ecx
    jnz print.write
  .end:
    ret

section .text exec
quit:
  mov eax,1
  xor ebx,ebx
  int 0x80

_start:
  mov edi,print+1
  mov eax,0x0F
  stosb
  call print
  call quit

