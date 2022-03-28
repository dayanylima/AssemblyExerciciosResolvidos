.section .data
.section .text
.globl _start
_soma_intervalo:
    push %rbp
	movq %rsp, %rbp
	subq $8, %rsp        #aloca memoria para i e s (i: -4(%rbp))(s: -8(%rbp))
    movl $0, -8(%rbp)    #s=0     
    movl 16(%rbp), %eax  #%eax = -5
    movl %eax, -4(%rbp)  #i = -5   
_for: 
	movl -4(%rbp), %eax  #%eax =i
	cmpl 20(%rbp), %eax  # compara i(%eax) com 10( 20(%rbp))
	jg _endfor
	addl %eax, -8(%rbp)  #s = s + i(%eax)
	incl -4(%rbp)        #inclementa i
	jmp _for
_endfor:
    movl -8(%rbp) , %eax  #%eax rebece s (soma) 
	addq $8, %rsp         #desaloca i e s
	popq %rbp
	ret
	
_start:
    push %rbp
	movq %rsp, %rbp
	subq $4, %rsp        #aloca memoria para r
    
	subq $4, %rsp        #espaço para o parametro 10
	movl $10, (%rsp)     # empilha o parametro 10
    
	subq $4, %rsp        #espaço para o parametro -5
	movl $-5, (%rsp)     # empilha o parametro -5
 
    call _soma_intervalo
	
	addq $8, %rsp        #desaloca parametros 
	movl %eax, -4(%rbp)  # r recebe soma
	
    movslq -4(%rbp), %rdi
	addq $4, %rsp        #desaloca r 
	popq %rbp
	  
	movq $60, %rax
	syscall
	
	  