.section .data
.section .text
.globl _start
_media:

   pushq %rbp
   movq %rsp, %rbp
   subq $8, %rsp         #aloca memoria para m    
   movq 16(%rbp), %rax   #rax = a
   addq 24(%rbp), %rax   #rax = rax+b
   addq 32(%rbp), %rax   #rax = rax+c   
   movq $3, %rbx       
   idivq %rbx, %rax      #rax = rax(a+b+c)/3
   movq %rax, -8(%rbp)   #m recebe resultado de divisão
   addq $8, %rsp         #desaloca m
   popq %rbp             #restaura rbp anterior 
   ret
         
_start:
    pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp        #aloca memoria para variaveis locais
	movq $2, -8(%rbp)     #a=2
	movq $4, -16(%rbp)    #b=4
	movq $6, -24(%rbp)    #c=6
	pushq -24(%rbp)       #empilha a  
	pushq -16(%rbp)       #empilha b
	pushq -8(%rbp)        #empilha c
call _media
	addq  $24, %rsp      #desaloca variaveis passadas como parametro
	movq %rax, -32(%rbp) #r recebe resultado de media
	movq -32(%rbp), %rdi
	addq $32, %rsp       #desaloca variaveis locais
	popq %rbp
    movq $60, %rax        
	syscall
	
	