                .data
cognome:        .asciiz "ROSSI"
nome:           .asciiz "GENNARO"
data:           .asciiz "120892"
CF:             .space 12
                .text
                .globl main
                .ent main

main: 
    subu $sp, $sp, 4
    sw $ra, ($sp)

    la $a0, cognome
    la $a1, nome
    la $a2, data
    la $a3, CF
    jal CalcoloCF

    lw $ra, ($sp)
    addiu $sp, $sp, 4
    jr $ra
.end main



CalcoloCF:
    move $t0,$a0 #indirizzo cognome
    move $t1,$a1 #indirizzo nome
    move $t2,$a2 #indirizzo data
    move $t3,$a3 #indirizzo finale

    li $t5,0 #contatore cognome

cicloCognome:
    lb $t4,($t0)
    beq $t4,'A',salta
    beq $t4,'E',salta
    beq $t4,'I',salta
    beq $t4,'O',salta
    beq $t4,'U',salta
    sb $t4,($t3)
    addi $t3,$t3,1
    addi $t5,$t5,1

salta:
    addi $t0,$t0,1
    
    bne $t5,3,cicloCognome

 li $t5,0 #contatore nome
cicloNome:
    lb $t4,($t1)
    beq $t4,'A',salta2
    beq $t4,'E',salta2
    beq $t4,'I',salta2
    beq $t4,'O',salta2
    beq $t4,'U',salta2
    sb $t4,($t3)
    addi $t3,$t3,1
    addi $t5,$t5,1

salta2:
    addi $t0,$t0,1
    
    bne $t5,3,cicloNome

lb $t5,($t2)
sb $t5,($t3)
addi $t3,$t3,1
addi $t2,$t2,1
lb $t5,($t2)
sb $t5,($t3)
addi $t3,$t3,1
addi $t2,$t2,1

subu $sp,$sp,36
sw $ra,32($sp)
sw $a3,28($sp)
sw $a2,24($sp)
sw $a1,20($sp)
sw $a0,16($sp)

lb $a0,($t2)
addi $t2,$t2,1
sll $a0, $a0, 8 
lb $a1,($t2)
addi $t2,$t2,1
or $a0, $a0, $a1

sw $t0,12($sp)
sw $t1,8($sp)
sw $t2,4($sp)
sw $t3,0($sp)


jal MonthToChar

lw $t3,0($sp)
lw $t2,4($sp)
lw $t1,8($sp)
lw $t0,12($sp)
lw $a0,16($sp)
lw $a1,20($sp)
lw $a2,24($sp)
lw $a3,28($sp)
lw $ra,32($sp)
addiu $sp,$sp,36

sb $v0,($t3)
addi $t3,$t3,1

lb $t5,($t2)
sb $t5,($t3)
addi $t3,$t3,1
addi $t2,$t2,1
lb $t5,($t2)
sb $t5,($t3)
addi $t3,$t3,1
addi $t2,$t2,1

move $t3,$a3
lb $t8,($t3)
addi $t3,$t3,1
li $t7,1  #contatore
cicloEXOR:
    lb $t9,($t3)
    xor $t8,$t8,$t9
    addi $t7,$t7,1
    addi $t3,$t3,1

    bne $t7,11,cicloEXOR

sb $t8,($t3)

jal $ra

.end CalcoloCF



MonthToChar:                #Già forinta da consegna
    subu $sp, $sp, 4
    sw $ra, ($sp)
    subu $sp, $sp, 12
    sw $t0, ($sp)
    sw $t1, 4($sp)
    sw $t2, 8($sp)
    move $t0, $a0
    srl $t0, $t0, 8
    subu $t0, $t0, '0'
    mul $t0, $t0, 10
    move $t1, $a0
    li $t2, 0xFF
    and $t1, $t1, $t2
    subu $t1, $t1, '0'
    addu $t1, $t1, $t0          
    subu $t1, $t1, 1            
    addu $v0, $t1, 'A'
    lw $t2, 8($sp)
    lw $t1, 4($sp)
    lw $t0, ($sp)
    addiu $sp, $sp, 12
    lw $ra, ($sp)
    addiu $sp, $sp, 4
    jr $ra
.end MonthToChar