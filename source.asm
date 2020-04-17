; rm -f list.lst obj.o source.o exec; nasm -f elf64 -g -l list.lst -o obj.o source.asm; ld -g -o exec obj.o; ./exec
; yasm -f elf64 -g dwarf2 source.asm -l list.lst -o obj.o; ld -g -o exec obj.o; ./exec
; rm -f obj.o source.o exec; nasm -f elf64 -o obj.o source.asm; ld -o exec obj.o; ./exec
section .data
	SYS_EXIT equ 60
	DONE_EXIT equ 0

section .text
	global _start

_start:
	mov rax, 150
	push rax
	mov rax, 22
	push rax

last:
	mov rax, SYS_EXIT
	mov rdi, DONE_EXIT
	syscall