.section .data
a: .byte -7
b: .byte 10
r: .long 0
.section .text
.globl _start
_start:
    movb b, %al
	movb $2, %bl
	imulb %bl   #al = al*bl == -20
	movb a, %bl
	subb %al, %bl  # bl = bl -al
	movsbl %bl, %eax
	movl %eax, r
    movslq %eax, %rdi
    movq $60, %rax
	syscall
