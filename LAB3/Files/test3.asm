	.data
	.align	2

	.text
	.align	2
	.globl	__start
__start:
	addi x5, x0, 0
	addi x6, x0, 0
	addi x0, x0, 0
	addi x0, x0, 0
	beq  x5, x6, taken
	addi x7, x0, 10
	addi x8, x0, 10
	addi x0, x0, 0
	addi x0, x0, 0
	
	
taken: 
	addi x9, x0, 1
	addi x0,x0,0
	addi x0,x0,0
	addi x0,x0,0