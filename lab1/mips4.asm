
mm:	
	

	add	$a0, $zero,30
	jal	fact
	j	exit
fact:
	addi	$sp, $sp, -12
	sw	$ra, 0($sp)
	sw	$a0, 4($sp)
	sw	$s0, 8($sp)
	slti	$t0, $a0, 2
	bne	$t0, $zero, L0
	#ble	$a0, 2, L0
	j	L1
L0:
	add	$v1, $zero, $a0
	addi	$sp, $sp, 12
	jr	$ra
L1:
	addi	$a0, $a0, -1
	jal	fact
	lw	$a0, 4($sp)
	addi	$s0, $v1, 0
	addi	$a0, $a0, -2
	jal	fact
	add	$v1, $s0, $v1
	lw	$ra, 0($sp)
	lw	$a0, 4($sp)
	lw	$s0, 8($sp)
	addi	$sp, $sp, 12
	jr	$ra
exit:
	li	$v0, 10
	syscall
