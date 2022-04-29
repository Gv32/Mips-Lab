                .data
giorni:         .byte 30
ore:            .byte 7
minuti:         .byte 34
vore:           .byte 60
vgiorni:        .byte 24
msg:            .asciiz "I minuti passati sono: "
risultato:      .word 0
                .text
                .globl main
                .ent main
main:           
                lb $t1, ore
                lb $t2, vore
                mul $t3, $t2, $t1
                lb $t1, minuti
                add $t0, $t3, $t1
                lb $t1, giorni
                lb $t3, vgiorni
                mul $t4, $t1, $t3
                mul $t4, $t4, $t2
                add $t0, $t0, $t4
                la $a0, msg
                li $v0, 4
                syscall
                move $a0, $t0
                li $v0, 1
                syscall
                sw $t0, risultato
                li $v0, 10
                syscall
                
.end main