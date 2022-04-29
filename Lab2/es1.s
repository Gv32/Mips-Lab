                    .data

msg1:               .asciiz "Inserire il numero "
msg2:               .asciiz "Il numero inserito e' dispari "
msg3:               .asciiz "Il numero inserito e' pari " 
                    .text
                    .globl main
                    .ent main

main:
                    li $v0, 4
                    la $a0, msg1
                    syscall
                    li $v0, 5
                    syscall
                    move $t0, $v0
                    andi	$t1, $t0, 1			#t1 = $01 & 1
                    beq     $0, $t1, pari
                    li $v0, 4
                    la $a0, msg2
                    syscall
                    j fine

pari:  
                    li $v0, 4
                    la $a0, msg3
                    syscall

fine:
                    li $v0, 10
                    syscall
                    
.end main