.section .data
str: .asciz "String"
.section .text
.globl _start
_tamanho_string:
    pushq %rbp
	movq %rsp, %rbp
	subq $8, %rsp   #tam =  -16(%rbp)
    pushq %rbx
	movq $0, -8(%rbp)
	
_while:
    movq -8(%rbp), %rax
	movq $1, %rbx
	imulq %rbx, %rax
   	addq %rdi, %rax
	#movq (%rax), %rcx
	cmp $0, (%rax)
	je _endwhile
	incq -8(%rbp)
	jmp _while
_endwhile:	
    movq -8(%rbp), %rax
    
	popq %rbx
	addq $8, %rsp
	popq %rbp
	ret

_start:
    push %rbp
	movq %rsp, %rbp
	subq $8, %rsp    #tam = -8(%rbp)
	movq $str, %rdi
	
	pushq %rdi
	
	call _tamanho_string
	
    popq %rdi 
    movq %rax, -8(%rbp)
	movq -8(%rbp), %rdi
	
	addq $8, %rsp
	popq %rbp

    movq $60, %rax
	syscall
	