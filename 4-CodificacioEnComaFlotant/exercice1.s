slt $t0, $a0, $zero #$t0 = cf < 0
sw $t0,0($a1) #*s = $t0
sll $a0, $a0, 1 #$a0 = cf << 1
if: bne $a0, $zero, else #if cf == 0
addu $t1, $zero, $zero #$t1 = exp = 0
b fi_else
else: addiu $t1, $zero, 18 #$t1 = exp = 18
while: bgt $zero, $a0, fi_while #cf >= 0
sll $a0, $a0, 1 #$a0 = cf << 1
addiu $t1, $t1, -1 #exp—
b while
fi_while: srl $t2, $a0, 8 #$t2 = cf >> 8
li $t3, 0x7FFFFF #$t3 = 0x7FFFFF
and $a0, $t2, $t3 #$a0 = (cf >> 8) & 0x7FFFFF
addiu $t1, $t1, 127 #$t1 = exp + 127
fi_else: sw $t1, 0($a2) #*e = exp = $t1
sw $a0, 0($a3) #*m = cf = $a0
jr $ra
Exercici 4.2: Programa en assemblador la subrutina compon.
compon: sll $a0, $a0, 31 #$a0 = signe << 31
sll $a1, $a1, 23 #$a1 = exponent << 23
or $t0, $a0, $a1 #$t0 = (singe<<31) or (exponent<<23)
or $t0, $t0, $a2 #$t0 = $t0 or mantissa
mtc1 $t0, $f0 #Moure a $f0 (reg. de retorn de paràmetres cf)
jr $ra