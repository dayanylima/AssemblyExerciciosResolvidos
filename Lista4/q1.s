.section .data
a: .long 0
n: .long 0
.section .text 
.global _start 
_start:
    movl $15, a
	movl a, %eax
	movl $2, %ebx
	idivl %ebx, %eax # eax = eax%ebx == 15%2, resto vai para edx
	cmpl $0, %edx
	jne _fimIf
	movl $3, n
_fimIf:		
	movslq n, %rdi	
    movq $60, %rax
    syscall 	
	