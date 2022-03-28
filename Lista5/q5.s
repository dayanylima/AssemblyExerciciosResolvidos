.section .data
.section .text
.globl _start

_soma_vetor:
	pushq 	%rbp				
	movq 	%rsp, %rbp			
	subq 	$8,%rsp				
	movl 	$0, -8(%rbp)		# s = 0
	movl 	$0, -4(%rbp)		# i = 0
							
								
_for:
	movl 	-4(%rbp), %eax		
	cmpl 	24(%rbp), %eax 		# cmp tam, i
	jge		_endfor				# jg i > tam
	movq 	$4, %rcx			
	movslq	%eax, %rax			
	mulq	%rcx				
	movq 	16(%rbp), %rbx		
	addq	%rbx, %rax			
	movl	(%rax), %eax		
	addl	%eax, -8(%rbp)		
	incl 	-4(%rbp)			# i++
	jmp 	_for
_endfor:
	movl	-8(%rbp),%eax
	addq 	$8,%rsp		
	popq %rbp
	ret

_start:
	pushq 	%rbp			
	movq 	%rsp, %rbp		
	subq 	$40, %rsp		
	movl 	$1, -40(%rbp)	
	movl 	$2, -36(%rbp)	
	movl 	$3, -32(%rbp)
	movl 	$4, -28(%rbp)
	movl 	$5, -24(%rbp)
	movl 	$6, -20(%rbp)	
	movl 	$7, -16(%rbp)
	movl 	$8, -12(%rbp)
	movl 	$9,  -8(%rbp)
	movl 	$10, -4(%rbp)	
	subq 	$4, %rsp		
	movq 	%rbp, %rax		
	subq 	$40, %rax		
	
	subq	$4, %rsp		
	movl	$10,(%rsp)		
	pushq 	%rax			
	call 	_soma_vetor
	addq 	$16, %rsp		
	movl 	%eax,-44(%rbp)
	
	movslq 	-44(%rbp), %rdi
	addq $44, %rsp
	popq 	%rbp	
	movq 	$60, %rax
	syscall
	   