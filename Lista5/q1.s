.section .data
.section .text
.globl _start
_start:
    pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp        #aloca memoria para as variveis locais
	movq $2, -8(%rbp)     #a=2
	movq $4, -16(%rbp)    #b=4
	movq $6, -24(%rbp)    #c=6
	movq -8(%rbp), %rax   #rax=a
    addq -16(%rbp), %rax  #rax = rax+b
    addq -24(%rbp), %rax  #rax = rax+c
	movq $3, %rbx         
	idivq %rbx, %rax      #rax = rax/rbx 
	movq %rax, -32(%rbp)  # r = rax(resultado da divisão)
	movq -32(%rbp), %rdi   
	addq $32, %rsp        #desaloca memoria
    popq %rbp             #restaura o rbp anterior 
    movq $60, %rax        
	syscall
	
	