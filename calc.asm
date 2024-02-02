;    *********************************************************************************
;    *                                                                               *
;    *                       Calculator with X86 Linux Assembly                      *   
;    *                                                                               *
;    *                              author: x1nerama                                 *
;    *                                                                               *
;    *********************************************************************************


; ===> For integers only 


%include "macros.inc"

section .data
        in1: db "Enter First Number: ", 20

        str1: equ $ - in1

	in2: db "Enter Second Number: ", 20
        str2: equ $ - in2

	op: db "Choose a Operation: ", 20
        str3: equ $ - op

        resultMsg: db "Result: ", 8

	error: db "Sry! Wrong Operator", 25
	errorLen: equ $ - error

	buf: db 10, 0

section .bss
        varOp: resb 6
	nm1: resb 32
	nm2: resb 32
	total: resb 20
section .text
        global _start

_start:
        getInput op, str3, varOp, 6
        getInput in1, str1, nm1, 32
        getInput in2, str2, nm2, 32
	mov eax,[nm1]
	mov ebx,[nm2]
	mov ah,[varOp]
	sub ah,'*'

	cmp ah,0x1
	je _addOP
	cmp ah,0x3
	je _subOP
	cmp ah,0x0
	je _mulOP
	cmp ah,0x5
	je _divOP

	jmp _errorMSG

_printResult:
	mov eax,4
	mov ebx,1
	mov ecx,resultMsg
	mov edx,7
	int 0x80

	mov eax,4
	mov ebx,1
	mov ecx,total
	mov edx,1
	int 0x80


_return_block:
	ret

_addOP:
	sub eax,'0'
	sub eax,'0'
	add eax,ebx
	add eax,'0'
	mov [total],eax
	call _printResult

	jmp _exit

_subOP:
	sub eax,'0'
	sub ebx,'0'
	sub eax,ebx
	add eax,'0'
	mov [total],eax
	call _printResult

	jmp _exit

_mulOP:
	sub eax,'0'
	sub ebx,'0'
	mul ebx
	add eax,'0'
	mov [total],eax
	call _printResult
	jmp _exit

_divOP:
	sub eax,'0'
	sub ebx,'0'
	div ebx
	add eax,'0'
	mov [total],eax
	call _printResult

	jmp _exit

_errorMSG:
	mov eax,4
	mov ebx,1
	mov ecx,error
	mov edx,errorLen
	int 0x80

_exit:
	mov eax,1
	xor ebx,ebx
	int 0x80
