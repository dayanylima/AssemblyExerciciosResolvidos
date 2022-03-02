

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
_for:	
	cmpl $10, i
	jg _fimfor
	movl a, %eax
	addl %eax, s    #s = s+a
	incl a
	incl i	
	jmp _for	
_fimfor:    	
	movslq s, %rdi
    movq $60, %rax
    syscall 
	