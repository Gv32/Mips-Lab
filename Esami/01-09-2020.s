DIM = 64
                .data
vetRX:          .byte 0x84, 0xFA, 0x09, 0x54, 0x20, 0x42, 0x19, 0x20, 0x41, 0xB1, 0x03
vetTX:          .space DIM
                .text
                .globl main
                .ent main
main:
    la $a0, vetRX
    la $a1, vetTX
    jal SpaceRemove
    li $v0, 10
    syscall
.end main


SpaceRemove:
    move $t0, $a0
    move $t1, $a1

    lb $t2, ($t0)
    addi $t0, $t0, 1
    lb $t3, ($t0)
    sb $t3, ($t1)
    addi $t1, $t1, 1
    sb $t2, ($t1)

    ciclocopia:
        addi $t0, $t0, 1
        addi $t1, $t1, 1
        lb $t2, ($t0)
        controllo:
            beq $t2, 0x20, spazio
            j copia
            spazio:
                addi $t0, $t0, 1
                lb $t2, ($t0)
                j controllo
        copia:
            sb $t2, ($t1)

    bne $t2 0x03, ciclocopia
    
    jr $ra

.end SpaceRemove