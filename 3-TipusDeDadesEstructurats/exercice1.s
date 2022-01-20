.data
mat1: .space 120
mat4: .word 2, 3, 1, 2, 4, 3
col: .word 2
.text
main:
addiu $sp, $sp, -16 #Reservar espai a pila
sw $ra, 12($sp) #Desar $ra a pila
sw $s0, 8($sp) #Desar $s0 a pila
sw $s1, 4($sp) #Desar $s1 a pila
sw $s2, 0($sp) #Desar $s2 a pila
la $s0, mat1 #$s0 = @mat1
la $s1, mat4 #$s1 = @mat4
la $s2, col #$s2 = @col
addu $a0, $s1, $zero #$a0 = @mat4
lw $a1, 8($s1) #$a1 = mat4 [0] [2]
lw $a2, 0($s2) #$a2 = col
jal subr #Crida a funció subr
sw $v0, 108($s0) #mat1 [4] [3] = $v0
addu $a0, $s1, $zero #$a0 = @mat4
addiu $a1, $zero, 1 #$a1 = 1
addiu $a2, $zero, 1 #$a2 = 1
jal subr #Crida a funció subr
sw $v0, 0($s0) #mat1 [0] [0] = $v0
lw $ra, 12($sp) #Restaurar $ra
lw $s0, 8($sp) #Restaurar $s0
lw $s1, 4($sp) #Restaurar $s1
lw $s2, 0($sp) #Restaurar $s2
addiu $sp, $sp, 16 #Recuperar espai a pila
jr $ra #Retorn a programa principal