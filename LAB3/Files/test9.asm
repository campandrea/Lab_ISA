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
	li x4,0x10010000  #first mem address V
	li x5, 10
	sw x5, 0(x4)
	li x5, -47
	sw x5, 4(x4)
	li x5, 22
	sw x5, 8(x4)
	li x5, -3
	sw x5, 12(x4)
	li x5, 15
	sw x5, 16(x4)
	li x5, 27
	sw x5, 20(x4)
	li x5, -4
	sw x5, 24(x4)
	li x16,7      # put 3 in x16 
	li x6,0x10010100 # put in x5 the address of m
	li x13,0x3fffffff # init x13 with max pos
loop:	
	beq x16,x0,done   # check all elements have been tested
	lw x8,0(x4)       # load new element in x8
	addi x0,x0,0
	addi x4,x4,0x4	  # point to next element
	addi x16,x16,-1   # decrease x16 by 1
	slt x11,x10,x13   # x11 = (x10 < x13) ? 1 : 0
	beq x11,x0,loop   # next element
	add x13,x10,x0    # update min
	jal loop          # next element
done:	
	sw x13,0(x6)      # store the result	
endc:	
	jal endc  	  # infinite loop
	addi x0,x0,0