; rm -f list.lst obj.o source.o exec; nasm -f elf64 -g -l list.lst -o obj.o source.asm; ld -g -o exec obj.o; ./exec
; yasm -f elf64 -g dwarf2 source.asm -l list.lst -o obj.o; ld -g -o exec obj.o; ./exec
; rm -f obj.o source.o exec; nasm -f elf64 -o obj.o source.asm; ld -o exec obj.o; ./exec
section .data
	SYS_EXIT equ 60
	DONE_EXIT equ 0

	pesan db 'Adakah bosku', 0xa
	len_pesan equ $ - pesan

	namafile db 'mantap.txt', 0
	len_namafile equ $ - namafile

	filedesc db 0

section .text
	global _start

_start:
    mov rax, 2 ; kode sys_open
	mov rdi, namafile ; file nya
    mov rsi, 0101o ; flags O_CREAT+O_WRONLY
    mov rdx, 0755o ; chmod 755 file.txt
    syscall

    mov [filedesc], rax

	mov rax, 1 ; kode sys_write
	mov rdi, [filedesc] ; pointer ke file
	mov rsi, pesan ; variable pesan yang mau ditulis
	mov rdx, len_pesan ; panjang pesannya
	syscall

	mov rax, 3 ; kode sys_close
	mov rdi, filedesc ; pointer ke file
	syscall

last:
	mov rax, SYS_EXIT
	mov rdi, DONE_EXIT
	syscall