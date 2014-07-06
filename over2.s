;BUILD--------------------------------------------------------------------------
;	nasm -Ox -f elf over2.s -o over2.o
;	ld -lc -dynamic-linker /lib/ld-linux.so.2 over2.o over2
;-------------------------------------------------------------------------------
[bits 32]
extern printf
extern exit
global _start

section .data write
hello: db "Hello /dev/null (%u)",0xA,0

section .text-rwx write exec
print:
  mov ecx,10
printf_call:
  push ecx
  push hello
  call printf
  add esp,4
  pop ecx
  dec ecx
  jnz printf_call
end_print:
  ret

section .text exec
quit:
  xor eax,eax
  push eax
  call exit

_start:
  mov edi,print+1
  mov eax,0x0f
  stosb
  call print
  call quit

