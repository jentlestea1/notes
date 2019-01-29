	.arch armv8-a
	.file	"abi.c"
	.text
	.align	2
	.global	callee
	.type	callee, %function
callee:
	sub	sp, sp, #32
	str	w0, [sp, 12]
	str	w1, [sp, 8]
	str	x2, [sp]
	ldr	w1, [sp, 12]
	ldr	w0, [sp, 8]
	add	w0, w1, w0
	str	w0, [sp, 28]
	ldr	x0, [sp]
	ldr	w1, [sp, 28]
	str	w1, [x0]
	ldr	w0, [sp, 28]
	add	sp, sp, 32
	ret
	.size	callee, .-callee
	.align	2
	.global	caller
	.type	caller, %function
caller:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	mov	w0, 1
	str	w0, [x29, 28]
	mov	w0, 2
	str	w0, [x29, 24]
	str	wzr, [x29, 16]
	str	wzr, [x29, 20]
	add	x0, x29, 16
	mov	x2, x0
	ldr	w1, [x29, 24]
	ldr	w0, [x29, 28]
	bl	callee
	str	w0, [x29, 20]
	nop
	ldp	x29, x30, [sp], 32
	ret
	.size	caller, .-caller
	.align	2
	.global	call_0
	.type	call_0, %function
call_0:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	bl	caller
	nop
	ldp	x29, x30, [sp], 16
	ret
	.size	call_0, .-call_0
	.ident	"GCC: (Linaro GCC 6.3-2017.05) 6.3.1 20170404"
	.section	.note.GNU-stack,"",@progbits
