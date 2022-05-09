.data
DIM = 5
matrix: .word 1, 4, 5, 6, 7
        .word 4, 2, 8, 6, 4
        .word 5, 8, 3, 2, 9
        .word 6, 6, 2, 4, 4
        .word 7, 4, 9, 4, 5



simno: .asciiz "0" #non simmetrica
simsi: .asciiz "1" #simmetrica
diag: .asciiz "2" #diagonale

.text
.globl main
.ent main

main:

    la $t0, matrix #carico indirizzo matrice
    la $t1, matrix #salvo per dopo
    li $s0, 0 #i=0
    add $s2, DIM, -1
    li $t9, 20
    li $s4, 0
    li $t7, 0

    addi $t0, $t0, 4
    add $t1, $t1, $t9   #posiziono i puntatori correttamente



          while1:
                  beq $s1,$s2, reset # se il ciclo  è stato eseguito 5 volte vado a res
                  lw $t5, 0($t0) #carico elemento riga matrix
                  lw $t6, 0($t1) #carico elemento colonna matrix

                  addi $t0, $t0, 4
                  add $t1, $t9, $t1

                  addi $s1, $s1, 1
                  bne $t5, $t6, nosim
                  beq $s4, 3, sim
                  add $t7, $t5, $t7
                  add $t7, $t7, $t6

                  j while1


          reset:  addi $s0, $s0, 6
                  la $t0, matrix #carico indirizzo matrice
                  la $t1, matrix #salvo per dopo

                  move $s1, $0
                  addi $s2, $s2, -1
                  mul $s5, $s0, 4
                  add $t0, $t0, $s5
                  add $t1, $t1, $s5
                  addi $s4, $s4, 1


                  addi $t0, $t0, 4
                  add $t1, $t1, $t9   #posiziono i puntatori correttamente
                  j    while1        # jump to while 1

nosim:
            la $a0, simno
            li $v0, 4
            syscall

            li $v0, 10
            syscall

sim:        beq    $t7, 0, diagonale  # if $t7 == 0 then diagonale


            la $a0, simsi
            li $v0, 4
            syscall

            li $v0, 10
            syscall

diagonale:

            la $a0, diag
            li $v0, 4
            syscall

            li $v0, 10
            syscall

.end main