		.data
	
val:	.word 3141592653

		.text
		.globl main
		.ent main
main:

		
		li $t0, 10
		add $t3, $t3, $0
		lw $t1, val
	
		
for1:
		
		beq $t1, 0, for2
		divu $t1,$t0	
		mfhi $a1  
		mflo $t1 
		addi $sp, $sp, -4 
		sw $a1, ($sp)
		addi $t3, $t3, 1
		j for1

		
for2: 
		beq $t3, 0, fine
		lw $t0, ($sp)
		addi $sp, $sp, 4
		addi $a0, $t0, '0'
		li $v0, 11
		syscall
		addi $t3, $t3, -1
		j for2


fine:
		li $v0, 10
		syscall
		.end main
		