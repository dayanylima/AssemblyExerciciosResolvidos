.section .data
a: .byte 0
b: .byte 0
.section .text 
.global _start 
_start:
    movb $3, a
	cmpb $1, a
	 jne _case2
	   movb $10, b
	jmp _switchfim
_case2:
    cmpb $2, a
	 jne _case3	
	   movb $20, b
	jmp _switchfim
_case3:	
    cmpb $3, a
	 jne _switchfim
	   movb $30, b
_switchfim:    	
	movsbq b, %rdi
    movq $60, %rax
    syscall 
	
	
	