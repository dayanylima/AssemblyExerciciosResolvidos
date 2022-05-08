.section .data
.section .text
.global _start
_maior: 
    pushq %rbp 
	movq %rsp, %rbp
    subq $16, %rsp   #i = -8(%rbp), maior =  -16(%rbp)
    pushq %rbx	
	
	movq (%rdi), %rax 
	movq %rax, -16(%rbp)
	movq $1, -8(%rbp)
_for:
    cmp %rsi, -8(%rbp)
	jge _endfor
	
    movq -8(%rbp), %rax 
    movq $8, %rbx
	imulq %rbx, %rax # i*8
	addq %rdi, %rax
    movq (%rax), %rcx
	cmp %rcx, -16(%rbp)
	jge _endif
	movq %rcx, -16(%rbp)	
_endif:
   incq -8(%rbp)
   jmp _for
	
_endfor:
    movq -16(%rbp), %rax
	popq %rbx
	addq $16, %rsp
	popq %rbp
	ret

_start:
    pushq %rbp
	movq %rsp, %rbp
    subq $88, %rsp
    movq $9 , -88(%rbp)
	movq $5,  -80(%rbp)
	movq $2,  -72(%rbp)
	movq $98, -64(%rbp)
	movq $67, -56(%rbp)
	movq $12, -48(%rbp)
	movq $23, -40(%rbp)
	movq $4,  -32(%rbp)
	movq $1,  -24(%rbp)
	movq $-8,  -16(%rbp) 
	
	
	movq %rbp, %rdi
	subq $88, %rdi
    movq $10, %rsi 
    
	pushq %rdi  #&vet[0]
	pushq %rsi
	
	call _maior
    
	popq %rsi
	popq %rdi
	
	movq %rax, -8(%rbp)
	movq -8(%rbp), %rdi
    addq $88, %rsp
    popq %rbp
    movq $60, %rax
	syscall
	
	
	