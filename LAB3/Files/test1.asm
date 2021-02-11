	.data
	.align	2

	.text
	.align	2
	.globl	__start
__start:
	addi x5, x0, 44
	addi x6, x0, 50
	addi x0, x0, 0
	addi x0, x0, 0
	add  x7, x5, x6
	xor  x8, x5, x6
	andi x9, x5, 44
	andi x10, x5, 19
	addi x0,x0,0
	addi x0,x0,0
	addi x0,x0,0