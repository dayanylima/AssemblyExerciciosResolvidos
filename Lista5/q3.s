.section .data
.section .text
.globl _start
_media:
   pushq %rbp
   movq %rsp, %rbp
   subq $2, %rsp
   movw 16(%rbp), %ax     #ax = a
   addw 18(%rbp), %ax     #ax = ax +b
   addw 20(%rbp), %ax     #ax = ax +c
   movw $3, %bx 
   idivw %bx, %ax         #ax = ax(a+b+c)/3
   movw  %ax, -2(%rbp)    #m = ax
   addq $2, %rsp          #desaloca m
   popq %rbp
   ret
_start:
    pushq %rbp
	movq %rsp, %rbp
    subq $8, %rsp         #aloca memoria para variaveis locais
	movw $2, -2(%rbp)     #a=2
	movw $4, -4(%rbp)     #b=4
	movw $6, -6(%rbp)     #c=6
	pushw -6(%rbp)        #empilha a
	pushw -4(%rbp)        #empilha b
	pushw -2(%rbp)        #empilha c
	call _media
	addq $6, %rsp         #desempilha os 3 parametros
	movw %ax, -8(%rbp)    #r = ax (resultado de divisao)
    movswq -8(%rbp), %rdi
	addq $8,%rsp          #desaloca variaveis locais
	popq %rbp
    movq $60, %rax
	syscall
	
	
	