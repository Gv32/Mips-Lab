		.data
msg: 	.asciiz "Inserisci la stringa\n"
npa: 	.asciiz "La stringa non e' palindroma"
pa: 	.asciiz "La stringa e' palindroma!"

		.text
		.globl main
		.ent main
main:
	
	la $a0, msg
	li $v0, 4
	syscall
	
	add $t0, $t0, $0                #contatore


	addi $sp, $sp, -4               #Spazio primo carattere

	add $s0, $s0, $sp               #Salvol il valore dello stack-point
	
	

for:

	li $v0, 12
	syscall
	
	beq $v0, '\n', controllo        #Controllo invio	
	
	sw $v0, ($sp)                   #Carico valore nello stack
	addi $sp, $sp, -4               
	
    addi $t0, $t0, 1
	
	j for
				  


controllo:

	beq $t0, $0, pal
	
	lw $t1, ($s0)                   #Carico il valore dal basso
	
	addi $sp, $sp, 4                #Pop
	lw $t2, ($sp)

	bne $t1, $t2, nopa
	
	addi $s0, $s0, -4
	
	addi $t0, $t0, -1 #i--

	j controllo

nopa:

	la $a0, npa
	li $v0, 4
	syscall
	
	j end

pal:
	la $a0, pa
	li $v0, 4
	syscall
	
end:

	li $v0, 10
	syscall
	
.end main