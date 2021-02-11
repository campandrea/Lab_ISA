	.data
	.align	2

	.text
	.align	2
	.globl	__start
__start:
	addi x5, x0, 1
	sw  x5, 0(x0)
	addi x0,x0,0
	addi x0,x0,0
	addi x0,x0,0
	