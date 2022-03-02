.section .data
a: .long 0
n: .long 0
.section .text 
.global _start 
_start:
    movl $15, a
	movl a, %eax
	movl $2, %ebx
	idivl %ebx, %eax 
	cmpl $0, %edx
	jne _else
	movl $2, n
	jmp _fimIf	
_else:	
	movl $1, n
_fimIf:	
	movslq n, %rdi
    movq $60, %rax
    syscall 	
	