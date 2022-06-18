                .data
vettoreEntrate: .byte 12, 47   
vettoreUscite:  .byte 18, 14
X:              .byte 1
Y:              .byte 40
                .text
                .globl main
                .ent main

main:
    sub $sp, $sp, 4
    sw $ra, ($sp)
    la $a0, vettoreEntrate      # indirizzo di vettoreEntrate
    la $a1, vettoreUscite       # indirizzo di vettoreUscite
    lbu $a2, X
    lbu $a3, Y
    jal costoParcheggio
    lw $ra, ($sp)
    addiu $sp, $sp, 4
    jr $ra
    li $v0, 10
    syscall
.end main

costoParcheggio:
    lbu $t0, ($a1)      # carico il primo elemento di vettoreUscite
    lbu $t1, ($a0)      # carico il primo elemento di vettoreEntrate
    subu $t0, $t0, $t1  # calcolo la differenza
    li $t1, 60          # 60 minuti
    multu $t0, $t1      # t0 * t1
    mflo $t3            # converto le ore in minuti
    lbu $t0, 1($a1)     # carico il secondo elemento di vettoreUscite
    lbu $t1, 1($a0)     # carico il secondo elemento di vettoreEntrate
    subu $t4, $t0, $t1  # calcolo la differenza
    divu $t0, $a3

.end costoParcheggio