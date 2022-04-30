.data
matrix: .word 154, 123, 109, 86, 4
      .space 4
     .word 421, -23, -231, 9, 50
     .space 4
     .word 123, -24, 12, 55, -45
     .space 4
     .space 24


vett3: .space 400

output: .asciiz "finito"
.text
.globl main
.ent main

main:

    la $t0, matrix #carico indirizzo matrice
    li $s0, 0 #i=0
    li $s2, 0



          while1:
                  beq $s5, 5, res # se il ciclo  è stato eseguito 5 volte vado a res
                  lw $t5, 0($t0) #carico elemento vett1
                  add $s1, $s1, $t5 # sommo elementi riga
                  addi $t0, $t0, 4
                  addi $s5, $s5, 1
                  j while1

        res:
            sub $s5, $s5, 5

            sw $s1, 0($t0)
            addi $t0, $t0, 4
            move $s1, $0
            addi $s0,$s0, 1
            beq $s0, 3, continuo2

            j while1

            continuo2:
            move $s5, $0
            move $s1, $0
            la $t3, matrix #carico indirizzo matrice
            move $s0, $0
            while2:



                    beq $s5, 3, res2 # se il ciclo  è stato eseguito 5 volte vado a res
                    lw $t5, 0($t3) #carico elemento vett1
                    add $s1, $s1, $t5 # sommo elementi riga
                    addi $t3, $t3, 24
                    addi $s5, $s5, 1
                    j while2

          res2:
              move $s5, $0

              sw $s1, 0($t0)
              addi $t0, $t0, 4
              move $s1, $0
              addi $s0,$s0, 1
              beq $s0, 6, done
              sub $t3, 68

              j while2




done:
      la $a0, output
      li $v0, 4
      syscall

      li $v0, 10
      syscall

.end main