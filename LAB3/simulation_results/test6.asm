	.data
	.align	2
m:
	.word  0
	.text
	.align	2
	.globl	__start
__start:
	la   x4, m
	addi x5, x0, 1
	sw  x5, 0(x4)
	addi x0,x0,0
	addi x0,x0,0
	addi x0,x0,0
	
