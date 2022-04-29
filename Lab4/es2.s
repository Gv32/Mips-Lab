                .data

opa:            .word 2043
opb:            .word 5
tab:            .word c1, c2, c3, c4
msg:            .asciiz "Inserire:\n0 somma\n1 sottrazione\n2 moltiplicazione\n3 divisione\n"
msgr:           .asciiz "Risultato: "
res:            .word 0
                .text

                .globl main
                .ent main

main:
                lw $t1, opa
                lw $t2, opb
                li $t0, 4
                la $a0, msg
                li $v0, 4
                syscall
                li $v0, 5
                syscall
                mul $t0, $t0, $v0
                lw $t3, tab($t0)
                jr $t3

c1:
                add $t0, $t1, $t2
                j fine

c2:
                sub $t0, $t1, $t2
                j fine

c3:         
                mul $t0, $t1, $t2
                j fine
                
c4:
                div	$t0, $t1, $t2
                j fine
                
fine:           
                lw $t0, res
                la $a0, msgr
                li $v0, 4
                syscall
                move $a0, $t0
                li $v0, 1
                syscall
                li $v0, 10
                syscall

.end main;