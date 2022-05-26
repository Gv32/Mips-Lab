                .data
anni:           .word 1945, 2008, 1800, 2006, 1748, 1600
ris:            .space LUNG
                .text
                .globl main
                .ent main
main:
    la $a0, anni
    la $a1, ris
    li $a2, LUNG
    jal bisestile



    li $v0, 10
    syscall

.end main


bisestile:
    

.end bisestile