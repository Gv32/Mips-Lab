.data
vett1: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
vett2: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10

vett3: .space 400

output: .asciiz "finito"
.text
.globl main
.ent main

main:

    la $t9, vett1
    la $t8, vett2
    la $s3, vett3 #carico indirizzi strutture dati


    li $s0, 0 #i=0
    li $s5, 0 #i=0 pongo indici = 0


    while1:
            beq $s0, 10, done # se il ciclo 1 è stato eseguito 4 volte vado a done
            lw $t4, 0,($t9) #carico elemento vett1

          while2:
                  beq $s5, 10, res # se il ciclo 2 è stato eseguito 4 volte vado a res
                  lw $t5, 0($t8) #carico elemento vett1
                  mul $t0, $t5, $t4
                  sw $t0, 0($s3)
                  addi $s3, $s3,4
                  addi $t8, $t8, 4
                  addi $s5, $s5, 1
                  j while2

        res:

            move   $t0, $0 #pulisco t0

            sub $t8, $t8, 40
            sub $s5, $s5, 10
            addi $t9, $t9, 4
            addi $s0, $s0, 1

            j while1


done:
      la $a0, output
      li $v0, 4
      syscall

      li $v0, 10
      syscall

.end main