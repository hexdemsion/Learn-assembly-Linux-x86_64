; rm -f list.lst obj.o source.o exec; nasm -f elf64 -g -l list.lst -o obj.o source.asm; ld -g -o exec obj.o; ./exec
; yasm -f elf64 -g dwarf2 source.asm -l list.lst -o obj.o; ld -g -o exec obj.o; ./exec
; rm -f obj.o source.o exec; nasm -f elf64 -o obj.o source.asm; ld -o exec obj.o; ./exec
section .data
	SYS_EXIT equ 60
	DONE_EXIT equ 0

	std_lulus dq 85
	nilai_kamu dq 60

	lulus_str dq 'Selamat kamu lulus', 0
	len_lulus_str equ $ - lulus_str

	gaklulus_str dq 'Ulang tahun depan', 0
	len_gaklulus_str equ $ - gaklulus_str

section .text
	global _start

_start:
	mov rax, [nilai_kamu]
	mov rbx, nilai_kamu
	; cmp rax, std_lulus
	; jge notifLulus
	jmp last

notifLulus:
	mov rax, 1
	mov rdi, 1
	mov rsi, lulus_str
	mov rdx, len_lulus_str
	syscall

notifGagal:
	mov rax, 1
	mov rdi, 1
	mov rsi, gaklulus_str
	mov rdx, len_gaklulus_str
	syscall

last:
	mov rax, SYS_EXIT
	mov rdi, DONE_EXIT
	syscall