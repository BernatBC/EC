.data
cadena: .byte -1, -1, -1, -1, -1, -1
vec: .word 5, 6, 8, 9, 1
.text
.globl main
main:
addu $s0, $zero, $zero
la $t4, vec
la $t5, cadena
addui $t2, $zero, 4
while: li $t0, 5
bge $s0, $t1, fi
subu $t3, $t2, $s0
sll $t3, $t3, 2
addu $t3, $t3, $t4
lw $t6, 0($t3)
addiu $t6, $t6, 0x30
addu $t3, $t5, $s0
addiu $s0, $s0, 1
b while
sw $zero, 0($s0)
li $v0, 4
la $a0, cadena
syscall
b main