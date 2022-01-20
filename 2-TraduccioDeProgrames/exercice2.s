moda: #$a0: @vec, $a1: num
addi $sp, $sp, -60 #reservar espai pila
sw $ra, 56($sp) #desar $ra a pila
sw $s0, 52($sp) #desar $s0 a pila
sw $s1, 48($sp) #desar $s1 a pila
sw $s2, 44($sp) #desar $s2 a pila
sw $s3, 40($sp) #desar $s3 a pila
addu $t0, $zero, $zero #int k = 0
addiu $t1, $zero, 10 #$t1 = iteracions for1
for1: bge $t0, $t1, fifor1 #k < 10
sll $t2, $t0, 2 #k = 4*k
addiu $t2, $t2, $sp #k = k + $sp
sw $zero, 0($t2) #histo[k] = 0
addiu $t0, $t0, 1 #k++
b for1
fifor1: addiu $s0, $zero, 0x30 #max = ‘0’
move $s1, $a1 #s1 = num
addu $s2, $zero, $zero #k = 0
move $s3, $a0 #$s3 = @vec
for2: bge $s2, $s1, fifor2 #k<num
addiu $a0, $sp, -40 #$a0 = @histo
addu $t0, $s3, $s2 #@vec[k]
lb $a1, 0($t0) #$a1 = vec[k]
addiu $a1, $a1, -0x30 #vec[k] – ‘0’
addiu $a2, $s0, -0x30 #max – ‘0’
jal update #cridar update
addiu $s0, $v0, 0x30 #max = $v0 + ‘0’
addiu $s2, $s2, 1 #k++
b for2
fifor2: addu $v0, $s0, $zero #$v0 = max
lw $ra, 56($sp) #restaurar $ra
lw $s0, 52($sp) #restaurar $s0
lw $s1, 48($sp) #restaurar $s0
lw $s2, 44($sp) #restaurar $s0
lw $s3, 40($sp) #restaurar $s0
addi $sp, $sp, 60 #esborrar pila
jr $ra #retornar al main
update: #$a0: @histo, $a1: char i, $a2: char imax
addi $sp, $sp, -16 #reservar espai pila
sw $ra, 12($sp) #desar $ra a pila
sw $s0, 8($sp) #desar $s0 a pila
sw $s1, 4($sp) #desar $s1 a pila
sw $s2, 0($sp) #desar $s2 a pila
addu $s0, $a0, $zero #$s0 = $a0
addu $s1, $a1, $zero #$s1 = $a1
addu $s2, $a2, $zero #$s2 = $a2
jal nofares #cridar nofares
sll $t0, $s1, 2 #i = 4*i
addu $t0, $t0, $s0 #@h[i] = @h + i
lw $t1, 0($t0) #$t1 = h[i]
addiu $t1, $t1, 1 #++h[i]
sw $t1, 0($t0) #desar $t1 a memòria
if: sll $t2, $s2, 2 #imax = 4*imax
addu $t2, $t2, $s0 #@h[imax] = @h + imax
lw $t3, 0($t2) #$t1 = h[i]
bge $t3, $t1, else #h[i] > h[imax]
addu $v0, $s1, $zero #$v0 = i
b fi
else: addu $v0, $s2, $zero #$v0 = imax
fi: lw $ra, 12($sp) #restaurar $ra
lw $s0, 8($sp) #restaurar $s0
lw $s1, 4($sp) #restaurar $s1
lw $s2, 0($sp) #restaurar $s2
addi $sp, $sp, 16 #esborrar pila
jr $ra #retornar a moda