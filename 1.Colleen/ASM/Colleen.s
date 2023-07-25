section .data
code :
	.string db "section .data%1$ccode :%1$c	.string db %2$c%3$s%2$c%1$c%1$csection .text%1$c	extern _printf%1$c	global _main%1$c%1$c_print:%1$c	lea rdi, [rel code.string]%1$c	mov rsi, 10%1$c	mov rdx, 34%1$c;	This comment is inside%1$c	lea rcx, [rel code.string]%1$c	call _printf%1$c	mov rax, 0%1$c	ret%1$c%1$c; This comment is outside%1$c%1$c_main:%1$c	call _print%1$c	ret%1$c"

section .text
	extern _printf
	global _main

_print:
	lea rdi, [rel code.string]
	mov rsi, 10
	mov rdx, 34
;	This comment is inside
	lea rcx, [rel code.string]
	call _printf
	mov rax, 0
	ret

; This comment is outside

_main:
	call _print
	ret
