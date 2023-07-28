bits 64
section .data
code :
	.string db "bits 64%1$csection .data%1$ccode :%1$c	.string db %2$c%3$s%2$c%1$c%1$csection .text%1$cextern printf%1$cglobal main%1$c%1$c_print:%1$c	lea rdi, [rel code.string]%1$c	mov rsi, 10%1$c	mov rdx, 34%1$c;	This comment is inside%1$c	lea rcx, [rel code.string]%1$c	call printf WRT ..plt%1$c	mov rax, 0%1$c	ret%1$c%1$c; This comment is outside%1$c%1$cmain:%1$c	call _print%1$c	ret%1$c"

section .text
extern printf
global main

_print:
	lea rdi, [rel code.string]
	mov rsi, 10
	mov rdx, 34
;	This comment is inside
	lea rcx, [rel code.string]
	call printf WRT ..plt
	mov rax, 0
	ret

; This comment is outside

main:
	call _print
	ret
