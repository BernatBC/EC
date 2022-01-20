.data
mat: .word 0, 0, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 8, 0, 0, 0
resultat: .space 4
.text
main:
addiu $sp, $sp, -4 #Reservar espai en pila
sw $ra, 0($sp) #Desar $ra a pila
la $a0, mat #$a0 = @mat [0] [0]
jal suma_col #Cridar funció suma_col
la $t0, resultat #$t0 = @resultat
lw $v0, 0($t0) #Desar $v0 a resultat
lw $ra, 0($sp) #Restaurar $ra
addiu $sp, $sp, 4 #Esborrar espai en pila
jr $ra #Retornar al programa principal
suma_col:
addu $t0, $zero, $zero #$t0 = suma = 0
addiu $t1, $zero, 8 #$t1 = p = @mat [0] [2] = 8
addu $t2, $zero, $zero #$t2 = i = 0
addiu $t3, $zero, 4 #$t3 = 4
for: bge $t2, $t3, fi_for #i < 4
lw $t4, 0($t1) #$t4 = *p
addu $t0, $t0, $t4 #suma += $t4
addiu $t1, $t1, 24 #p = p + 6*4
addiu $t2, $t2, 1 #i++
b for
fi_for: addu $v0, $t0, $zero #return suma
jr $ra #Retornar al main