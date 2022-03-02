.section .data
a: .long 7
b: .long 10
r: .long 0
.section .text
.globl _start
_start:
    movl b, %eax
	movl $2,%ebx
	imull %ebx, %eax  #eax= eax *ebx
	addl a, %eax  #eax = eax + a
    movl %eax, r
	movslq %eax, %rdi
	movq $60, %rax
	syscall
	