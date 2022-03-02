.section .data
a: .byte 255
b: .word 7
c: .word 10
d: .long 0
r: .quad 0
.section .text
.globl _start
_start:
    movzbl a, %eax   #eax = a
	movl %eax, d     #d =a
	movl $20, %ebx
    idivl %ebx, %eax  # eax = eax%ebx == 255%20, resto vai para edx
	movw b, %ax
	movw c, %bx
	addw %bx, %ax # b+c, ax = ax +bx
	movswl %ax, %ebx 
	subl %edx, %ebx  #ebx = ebx - edx
	movslq %ebx, %rax
	movq %rax, r
	movq r, %rdi
    movq $60, %rax
	syscall
	