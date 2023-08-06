bits 64
section .data
self: db __FILE__, 0
filename: db "Sully_%d.s", 0
code: db "bits 64%1$csection .data%1$cself: db __FILE__, 0%1$cfilename: db %2$cSully_%%d.s%2$c, 0%1$ccode: db %2$c%3$s%2$c, 0%1$ccommand: db %2$cnasm -f elf64 Sully_%%1$d.s; clang Sully_%%1$d.o -o Sully_%%1$d -no-pie -lc; rm Sully_%%1$d.o; ./Sully_%%1$d%2$c, 0%1$cFD: dq 0%1$cFILE: db 10%1$cCOMMAND_FILL: db 150%1$c%1$csection .text%1$cglobal main%1$cextern sprintf, dprintf, strchr, system%1$c%1$cmain:%1$c	enter 32, 0%1$c	mov r12, %4$d%1$c	cmp r12, 0%1$c	jle exit%1$c%1$ccheck:%1$c	lea rdi, [rel self]%1$c	mov rsi, '_'%1$c	call strchr WRT ..plt%1$c	cmp rax, 0%1$c	je child%1$c%1$c	dec r12%1$c%1$cchild:%1$c	lea rdi, [rel FILE]%1$c	lea rsi, [rel filename]%1$c	mov rdx, r12%1$c	call sprintf WRT ..plt%1$c%1$copen:%1$c	lea rdi, [rel FILE]%1$c	mov rsi, 577%1$c	mov rdx, 644o%1$c	mov rax, 2%1$c	syscall%1$c	mov [FD], rax%1$c%1$cwrite:%1$c	mov rdi, [FD]%1$c	lea rsi, [rel code]%1$c	mov rdx, 10%1$c	mov rcx, 34%1$c	lea r8, [rel code]%1$c	mov r9, r12%1$c	call dprintf WRT ..plt%1$c%1$cexecute:%1$c	lea rdi, [rel COMMAND_FILL]%1$c	lea rsi, [rel command]%1$c	mov rdx, r12%1$c	call sprintf WRT ..plt%1$c%1$c	lea rdi, [rel COMMAND_FILL]%1$c	call system WRT ..plt%1$c%1$cclose:%1$c	mov rdi, [FD]%1$c	mov rax, 3%1$c	syscall%1$c%1$cexit:%1$c	mov rax, 0%1$c	leave%1$c	ret", 0
command: db "nasm -f elf64 Sully_%1$d.s; clang Sully_%1$d.o -o Sully_%1$d -no-pie -lc; rm Sully_%1$d.o; ./Sully_%1$d", 0
FD: dq 0
FILE: db 10
COMMAND_FILL: db 150

section .text
global main
extern sprintf, dprintf, strchr, system

main:
	enter 32, 0
	mov r12, 5
	cmp r12, 0
	jle exit

check:
	lea rdi, [rel self]
	mov rsi, '_'
	call strchr WRT ..plt
	cmp rax, 0
	je child

	dec r12

child:
	lea rdi, [rel FILE]
	lea rsi, [rel filename]
	mov rdx, r12
	call sprintf WRT ..plt

open:
	lea rdi, [rel FILE]
	mov rsi, 577
	mov rdx, 644o
	mov rax, 2
	syscall
	mov [FD], rax

write:
	mov rdi, [FD]
	lea rsi, [rel code]
	mov rdx, 10
	mov rcx, 34
	lea r8, [rel code]
	mov r9, r12
	call dprintf WRT ..plt

execute:
	lea rdi, [rel COMMAND_FILL]
	lea rsi, [rel command]
	mov rdx, r12
	call sprintf WRT ..plt

	lea rdi, [rel COMMAND_FILL]
	call system WRT ..plt

close:
	mov rdi, [FD]
	mov rax, 3
	syscall

exit:
	mov rax, 0
	leave
	ret