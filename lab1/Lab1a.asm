.data 	
	str1: .asciiz "0616027 Lab1a, Enter the number n = "
.text 
mm:	
	li  $v0, 4
	la  $a0, str1
	syscall
	
	li  $v0, 5
	syscall
	move $a0, $v0
	#add	$a0, $v0, $zero
	#syscall
	jal	fact
	
	j	exit
fact:
	addi	$sp, $sp, -12
	sw	$ra, 0($sp)
	sw	$a0, 4($sp)
	sw	$s0, 8($sp)
	
	ble	$a0, 2, L0
	jal	L1
	
L0:
	addi	$v1, $zero, 1
	addi	$sp, $sp, 12
	jr	$ra
L1:
	addi	$a0, $a0, -1
	jal	fact
	lw	$a0, 4($sp)
	add	$s0, $v1, $zero
	addi	$a0, $a0, -2
	jal	fact
	add	$v1, $s0, $v1
	lw	$ra, 0($sp)
	lw	$a0, 4($sp)
	lw	$s0, 8($sp)
	addi	$sp, $sp, 12
	jr	$ra
exit:
	move	$a0, $v1
	li	$v0, 1
	#add	$a0, $v1, $zero
	syscall
	li	$v0, 10
	syscall
