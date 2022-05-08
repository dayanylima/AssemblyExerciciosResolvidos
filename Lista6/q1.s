.section .data
.section .text
.global _start
_pares:
	pushq %rbp
	movq %rsp, %rbp
	subq $8, %rsp  #i= -4(%rbp), pares = -8(%rbp)
	pushq %rbx 
	movl $0, -8(%rbp)
	movl $0, -4(%rbp)
_for:
	cmpl %esi, -4(%rbp)
	jge _endfor
	movl -4(%rbp), %eax
	movl $4, %ebx
	imull %ebx  # i*4
	movslq %eax, %rax
	addq %rdi, %rax
	movl $2, %ebx
	movl (%rax), %eax
	idivl %ebx
	cmpl $0, %edx
	jne _endif
	incl -8(%rbp)
_endif:
	incl -4(%rbp)  #i++
	jmp _for
_endfor:
	movl -8(%rbp), %eax	
	
	popq %rbx	
	addq $8, %rsp
	popq %rbp
	ret
	

_start:
	pushq %rbp
	movq %rsp, %rbp
	subq $44, %rsp 
	movq $-8, -44(%rbp)
	movq $1,  -40(%rbp)
	movq $4,  -36(%rbp)
	movq $23, -32(%rbp)
	movq $12, -28(%rbp)
	movq $67, -24(%rbp)
	movq $98, -20(%rbp)
	movq $2,  -16(%rbp)
	movq $5,  -12(%rbp)
	movq $9,  -8(%rbp)

	movq %rbp, %rdi
	subq $44, %rdi
	movl $10, %esi

	pushq %rdi  #&vet[0]
	pushq %rsi  #tam
	
	call _pares

	popq %rsi
	popq %rdi

	movslq %eax, %rdi
		
	addq $44, %rsp
	popq %rbp
	movq $60, %rax
	syscall
	
	