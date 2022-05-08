##include<stdio.h>
#void swap(long int *x, long int *y){ 
#    int aux = *x; 
#    *x = *y; 
#    *y = aux; 
#} 
#void bubbleSort(long int *v, int n){ 
#    long int i, j;
#    for (i=0; i< n-1; i++) {
#          for(j=0; j<= n-i-1; j++)
#            if(v[j]>v[j+1])
#             swap(&v[j], &v[j + 1]); 
#        
#          
#      }
#} 
#
#int main(){
#  
#  long int v[] = {111, 10, 9, 8, 7, 61, 5, 4, 3, 2, 1};
#  bubbleSort(v, 11);
#  return 0;
#}

.section .data 
.section .text 
.globl _start 
_xxx:                            #swap
   pushq %rbp
   movq %rsp, %rbp
   subq $8, %rsp                 #aux = -8(%rbp)
   
   movq 16(%rbp), %rax           #%rax = &vet[j]
   movq (%rax), %rbx             #%rbx = vet[j]
   movq %rbx, -8(%rbp)           #aux = vet[j]
   movq 24(%rbp), %rbx           #%rbx = &vet[j+1]
   movq (%rbx), %rcx             #%rcx = vet[j+1]
   movq %rcx, (%rax)             #vet[j] = %rcx
   movq -8(%rbp), %rcx           #%rcx = aux
   movq %rcx, (%rbx)             #vet[j+1] = %rcx
   
   addq $8, %rsp
   popq %rbp
   ret 
   
   
_kkk:                             #bubbleSort
   pushq %rbp
   movq %rsp, %rbp
   subq $16, %rsp                 #i= -8(%rbp)  e j= -16(%rbp)
   
   movq $0, -8(%rbp)              # i =0
 _xx1:                            #for1
   movq -8(%rbp), %rax            #rax = i
   movq 24(%rbp), %rbx            #tam = 11 = 24(%rbp) = rbx
   decq %rbx                      #tam = 10
   cmp %rbx, %rax                 #cmp tam, i
   jge _exx1                      #jge _endfor1, desvio i>= tam for(i=0; i <tam;)
       movq $0, -16(%rbp)         # j=0
       _yy2:                      #for2
       movq -16(%rbp), %rax	      #rax = j
	   movq 24(%rbp), %rbx        #tam = 11 = 24(%rbp) = %rbx
	   subq $2, %rbx              #tam = 9
	   cmp %rbx, %rax             #cmp tam, i
	   
	   jg _eyy2                   #jg _endfor2, desvio j > tam for(j=0;j<=tam;)
	      
		  movq -16(%rbp), %rax    #%rax = j
		  movq $8, %rbx           # %rbx = 8 (long int)
		  imul %rbx               #j*8 = %rax
		  addq 16(%rbp), %rax     #&vetor[j] 
		  movq %rax, %rbx         #rbx = &vetor[j+1]
		  addq $8, %rbx           #rcx = vetor[j+1]
		  movq (%rbx), %rcx       #cmp vetor[j+1], vetor[j]
		  cmp %rcx, (%rax)
		  jl _eww                 #jl _endif ,desvio vetor[j+1]> vetor[j]
		     pushq %rbx           #empilha &vetor[j+1]
			 pushq %rax           #empilha &vetor[j]
			 call _xxx            #swap
			 addq $16, %rsp
		_eww:                     #_endif

        incq -16(%rbp)            #j++
        jmp _yy2                  #jmp _for2		
		 _eyy2:
		 
		incq -8 (%rbp)            #i++
		jmp _xx1                  #jmp _for1
		
		_exx1:
		
		addq $16, %rsp
		popq %rbp
		ret
   
_start:
    pushq %rbp 
	movq %rsp, %rbp 
	subq $88, %rsp               #long int v[11]
	
	movq $111, -88(%rbp)
	movq $10, -80(%rbp)
	movq $9, -72(%rbp)
	movq $8, -64(%rbp)
	movq $7, -56(%rbp)
	movq $61, -48(%rbp)
	movq $5, -40(%rbp)
	movq $4, -32(%rbp)
	movq $3, -24(%rbp)
	movq $2, -16(%rbp)
	movq $1, -8(%rbp)
	
	pushq $11                   #empilha tam vetor
	movq %rbp, %rax
	subq $88, %rax
	pushq %rax                  #empilha &v[0] 
	call _kkk                   #call _bubbleSort
	
	addq $16, %rsp
	movq -8(%rbp), %rdi
	addq $88, %rsp
	popq %rbp
   
    movq $60, %rax 
    syscall  
	
	
	
	