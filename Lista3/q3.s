.section .data
a: .word 7
b: .word 10
c: .word 15
r: .long 0
.section .text
.globl _start
_start:
    movw c, %ax
	movw b, %bx
	idivw %bx, %ax # ax = ax%bx, resto vai para dx
	movw a, %bx 
	imulw %bx, %dx #dx = dx*bx == 5*7
	movswl %dx, %eax
	movl %eax, r
	movslq r, %rdi
    movq $60, %rax
	syscall
