#################
# Basic VERSION	
# This program takes an array v and computes
# min{|v[i]|}, the minimum of the absolute value,
# where v[i] is the i-th element in the array
	.data
	.align	2
v:
	.word	10
	.word	-47
	.word	22
	.word	-3
	.word	15
	.word	27
	.word	-4
m:
	.word	0

	.text
	.align	2
	.globl	__start
__start:

	li x5,0x10010000 
	li x16,7          # put 7 in x16
	sw x16,0(x5)      # store the result
	sw x16,4(x5)      # store the result
	add x1, x16, x5
	sw x1,8(x5)      # store the result
	sw x16,12(x5)      # store the result
		
endc:	
	jal endc  	  # infinite loop
	addi x0,x0,0
	
