.section .data
a: .long 0
i: .long 0
s: .long 0
.section .text 
.global _start 
_start:
    movl $0, s
	movl $1, a
	movl $1, i
_while:	
	cmpl $10, i
	jg _fimwhile
	movl a, %eax
	movl $2, %ebx
	movl $0, %edx
	idivl %ebx, %eax
	cmpl $0, %edx
	jne _fimIf
	movl a, %ebx
	addl %ebx, s
_fimIf:	
    incl a
	incl i
    jmp _while
_fimwhile:	
	movslq s, %rdi
    movq $60, %rax
    syscall
	
	
	