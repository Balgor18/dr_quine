section .data
code: db "section .data%2$ccode: db %1$c%3$s%1$c, 0%2$cname: db %1$cGrace_kid.s%1$c, 0%2$c%2$c%4$cmacro RUN 0%2$c%2$csection .text%2$cglobal _main%2$cextern _dprintf%2$c%2$c_main:%2$c    push rbp%2$c    mov rbp, rsp%2$c%2$copen:%2$c    lea rdi, [rel name]%2$c    mov rsi, 03001o%2$c	mov rdx, 644o%2$c    mov rax, 0x2000005 ; Mettre 2 pour linux%2$c    syscall%2$c%2$c; duplicate boi%2$cwrite:%2$c    mov rdi, rax%2$c	lea rsi, [rel code]%2$c	mov rdx, 34%2$c	mov rcx, 10%2$c	lea r8, [rel code]%2$c    mov r9, 37%2$c	call _dprintf%2$c%2$cexit:%2$c    mov rax, 0%2$c	leave%2$c	ret%2$c%2$c%4$cendmacro%2$c%2$cRUN", 0
name: db "Grace_kid.s", 0

%macro RUN 0

section .text
global _main
extern _dprintf

_main:
    push rbp
    mov rbp, rsp

open:
    lea rdi, [rel name]
    mov rsi, 03001o
	mov rdx, 644o
    mov rax, 0x2000005 ; Mettre 2 pour linux
    syscall

; duplicate boi
write:
    mov rdi, rax
	lea rsi, [rel code]
	mov rdx, 34
	mov rcx, 10
	lea r8, [rel code]
    mov r9, 37
	call _dprintf

exit:
    mov rax, 0
	leave
	ret

%endmacro

RUN