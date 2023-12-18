	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"game1.c"
	.text
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemyRin.part.0, %function
updateEnemyRin.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r5, #0
	mov	r4, #108
	mov	lr, #114
	ldr	r3, .L22
	add	ip, r3, #384
.L9:
	ldr	r2, [r3, #52]
	ldr	r1, [r3, #36]
	add	r2, r2, #1
	cmp	r1, #0
	str	r2, [r3, #52]
	beq	.L2
	ldr	r1, [r3, #32]
	cmp	r1, #0
	bne	.L3
.L2:
	ldr	r1, [r3, #28]
	cmp	r1, #0
	beq	.L3
	ldr	r6, [r0, #4]
	ldr	r1, [r3, #4]
	cmp	r6, r1
	addgt	r1, r1, #1
	suble	r1, r1, #1
	str	r1, [r3, #4]
	ldr	r1, [r3]
	ldr	r6, [r0]
	cmp	r6, r1
	addgt	r1, r1, #1
	suble	r1, r1, #1
	strgt	r1, [r3]
	strbgt	lr, [r3, #60]
	strle	r1, [r3]
	strble	r4, [r3, #60]
	cmp	r2, #2
	streq	r5, [r3, #52]
.L3:
	add	r3, r3, #64
	cmp	r3, ip
	bne	.L9
	mov	r2, #10
	ldr	r3, .L22+4
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L23:
	.align	2
.L22:
	.word	enemyRin
	.word	.LANCHOR0
	.size	updateEnemyRin.part.0, .-updateEnemyRin.part.0
	.align	2
	.global	initGame1
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame1, %function
initGame1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #1
	push	{r4, r5, r6, r7, r8, lr}
	mov	r0, #40
	mov	r7, r2
	mov	r6, #20
	mov	r1, #0
	mov	ip, #16
	mov	r5, #10
	mov	r4, #2
	mov	lr, #108
	ldr	r3, .L28
.L25:
	str	r2, [r3, #16]
	add	r2, r2, #1
	cmp	r2, #7
	stm	r3, {r0, r6}
	str	r7, [r3, #28]
	str	r1, [r3, #32]
	str	r1, [r3, #36]
	str	ip, [r3, #24]
	str	ip, [r3, #20]
	str	r1, [r3, #52]
	str	r5, [r3, #48]
	str	r4, [r3, #56]
	str	r1, [r3, #44]
	strb	lr, [r3, #60]
	add	r0, r0, #30
	add	r3, r3, #64
	bne	.L25
	ldr	r0, .L28+4
	ldr	r3, .L28+8
	mov	lr, pc
	bx	r3
	ldr	r0, .L28+12
	ldr	r3, .L28+16
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L29:
	.align	2
.L28:
	.word	enemyRin
	.word	player
	.word	initPlayer
	.word	bubbleArray
	.word	initBubbles
	.size	initGame1, .-initGame1
	.align	2
	.global	BubbleCollisionWithRin
	.syntax unified
	.arm
	.fpu softvfp
	.type	BubbleCollisionWithRin, %function
BubbleCollisionWithRin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r5, .L47
	mov	r9, #1
	ldr	r8, .L47+4
	sub	sp, sp, #16
	add	r7, r5, #560
	b	.L36
.L31:
	add	r5, r5, #28
	cmp	r5, r7
	beq	.L46
.L36:
	ldr	r3, [r5, #20]
	cmp	r3, #0
	beq	.L31
	ldr	r4, .L47+8
	mov	r10, #0
	add	r6, r4, #384
	b	.L35
.L33:
	add	r4, r4, #64
	cmp	r4, r6
	beq	.L31
.L35:
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L33
	add	r0, r5, #12
	ldm	r0, {r0, r1}
	ldr	r2, [r5, #4]
	ldr	r3, [r5]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	r2, [r4, #24]
	ldr	r3, [r4, #20]
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	strne	r9, [r4, #32]
	strne	r10, [r5, #20]
	b	.L33
.L46:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L48:
	.align	2
.L47:
	.word	bubbleArray
	.word	collision
	.word	enemyRin
	.size	BubbleCollisionWithRin, .-BubbleCollisionWithRin
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"collided\000"
	.align	2
.LC1:
	.ascii	"enemy has become food\000"
	.text
	.align	2
	.global	playerCollisionRin
	.syntax unified
	.arm
	.fpu softvfp
	.type	playerCollisionRin, %function
playerCollisionRin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r4, .L63
	mov	r5, r0
	ldr	r7, .L63+4
	ldr	r9, .L63+8
	ldr	r8, .L63+12
	ldr	fp, .L63+16
	ldr	r10, .L63+20
	sub	sp, sp, #20
	add	r6, r4, #384
	b	.L55
.L51:
	add	r4, r4, #64
	cmp	r4, r6
	beq	.L61
.L55:
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L51
	add	r0, r4, #20
	ldm	r0, {r0, r1}
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	r3, [r5, #16]
	ldr	r2, [r5, #20]
	ldm	r5, {r0, r1}
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L51
	mov	r0, r9
	mov	lr, pc
	bx	r8
	ldr	r3, [r4, #32]
	cmp	r3, #0
	bne	.L62
	ldr	r2, [r4, #36]
	cmp	r2, #0
	beq	.L54
	ldr	r2, [r10]
	str	r3, [r4, #28]
	add	r4, r4, #64
	add	r2, r2, #1
	cmp	r4, r6
	str	r2, [r10]
	bne	.L55
.L61:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L62:
	ldr	r0, .L63+24
	mov	lr, pc
	bx	r8
	mov	r2, #1
	mov	r3, #0
	str	r2, [r4, #36]
	str	r3, [r4, #32]
	b	.L51
.L54:
	mov	r2, #120
	mov	r1, #110
	ldr	r3, [fp, #4]
	sub	r3, r3, #1
	str	r3, [fp, #4]
	str	r1, [r5, #4]
	str	r2, [r5]
	b	.L51
.L64:
	.align	2
.L63:
	.word	enemyRin
	.word	collision
	.word	.LC0
	.word	mgba_printf
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	.LC1
	.size	playerCollisionRin, .-playerCollisionRin
	.align	2
	.global	updateEnemyRin
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemyRin, %function
updateEnemyRin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L67
	ldr	r3, [r2]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r2]
	bxne	lr
	b	updateEnemyRin.part.0
.L68:
	.align	2
.L67:
	.word	.LANCHOR0
	.size	updateEnemyRin, .-updateEnemyRin
	.align	2
	.global	drawLives
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawLives, %function
drawLives:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L77
	push	{r4, r5, lr}
	ldr	r5, [r3, #4]
	cmp	r5, #0
	ble	.L70
	mov	r2, #20
	mov	r4, #5
	add	r0, r5, r5, lsl #2
	lsl	r0, r0, #1
	ldr	r3, .L77+4
	ldr	lr, .L77+8
	ldr	ip, .L77+12
	add	r0, r0, r2
.L71:
	and	r1, r2, lr
	add	r2, r2, #10
	orr	r1, r1, #16384
	cmp	r2, r0
	strh	r4, [r3, #240]	@ movhi
	strh	ip, [r3, #244]	@ movhi
	strh	r1, [r3, #242]	@ movhi
	add	r3, r3, #8
	bne	.L71
.L70:
	cmp	r5, #2
	beq	.L76
	cmp	r5, #1
	moveq	r2, #512
	ldreq	r3, .L77+4
	pop	{r4, r5, lr}
	strheq	r2, [r3, #248]	@ movhi
	bx	lr
.L76:
	mov	r2, #512
	ldr	r3, .L77+16
	pop	{r4, r5, lr}
	strh	r2, [r3]	@ movhi
	bx	lr
.L78:
	.align	2
.L77:
	.word	.LANCHOR0
	.word	shadowOAM
	.word	511
	.word	421
	.word	shadowOAM+256
	.size	drawLives, .-drawLives
	.align	2
	.global	drawEnemyRin
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawEnemyRin, %function
drawEnemyRin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L100
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r1, .L100+4
	mov	r9, #512
	mov	fp, #118
	ldr	r8, .L100+8
	ldr	r10, .L100+12
	add	r6, r3, #384
	b	.L89
.L98:
	ldr	r0, [r3]
	ldr	r2, [r3, #16]
	and	r0, r0, r8
	ldrh	lr, [r3, #4]
	ldr	r4, [r3, #52]
	orr	r7, r0, #16384
	add	r5, r1, r2, lsl #3
	strh	r7, [r5, #2]	@ movhi
	lsl	r2, r2, #3
	and	r7, lr, #255
	cmp	r4, #0
	mov	ip, r0
	strh	r7, [r1, r2]	@ movhi
	bne	.L81
	ldrb	r4, [r3, #60]	@ zero_extendqisi2
	cmp	r4, #108
	moveq	r4, #166
	strheq	r4, [r5, #4]	@ movhi
	beq	.L83
	cmp	r4, #114
	moveq	r4, #174
	strheq	r4, [r5, #4]	@ movhi
.L83:
	ldr	r4, [r3, #32]
	cmp	r4, #0
	beq	.L87
.L99:
	add	r2, r1, r2
	orr	ip, ip, r10
	strh	fp, [r2, #4]	@ movhi
	strh	ip, [r2, #2]	@ movhi
.L88:
	add	r3, r3, #64
	cmp	r3, r6
	beq	.L97
.L89:
	ldr	r2, [r3, #28]
	cmp	r2, #0
	bne	.L98
	ldr	r2, [r3, #16]
	add	r3, r3, #64
	lsl	r2, r2, #3
	cmp	r3, r6
	strh	r9, [r1, r2]	@ movhi
	bne	.L89
.L97:
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L81:
	cmp	r4, #1
	bne	.L84
	ldrb	r4, [r3, #60]	@ zero_extendqisi2
	cmp	r4, #108
	moveq	r4, #168
	strheq	r4, [r5, #4]	@ movhi
	beq	.L83
	cmp	r4, #114
	moveq	r4, #176	@ movhi
	strheq	r4, [r5, #4]	@ movhi
	ldr	r4, [r3, #32]
	cmp	r4, #0
	bne	.L99
.L87:
	ldr	ip, [r3, #36]
	cmp	ip, #0
	beq	.L88
	add	lr, lr, #50
	and	lr, lr, #255
	add	ip, r1, r2
	strh	lr, [r1, r2]	@ movhi
	ldr	r2, .L100+16
	strh	r2, [ip, #4]	@ movhi
	mov	r2, #1
	strh	r0, [ip, #2]	@ movhi
	str	r2, [r3, #52]
	b	.L88
.L84:
	cmp	r4, #2
	bne	.L83
	ldrb	r4, [r3, #60]	@ zero_extendqisi2
	cmp	r4, #108
	ldreq	r4, .L100+20
	strheq	r4, [r5, #4]	@ movhi
	beq	.L83
	cmp	r4, #114
	addeq	r4, r4, #384
	strheq	r4, [r5, #4]	@ movhi
	b	.L83
.L101:
	.align	2
.L100:
	.word	enemyRin
	.word	shadowOAM
	.word	511
	.word	-32768
	.word	483
	.word	490
	.size	drawEnemyRin, .-drawEnemyRin
	.align	2
	.global	drawScore
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawScore, %function
drawScore:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #180
	ldr	r3, .L104
	ldr	r3, [r3]
	add	r3, r3, #392
	ldr	r2, .L104+4
	add	r3, r3, #3
	lsl	r3, r3, #22
	str	lr, [sp, #-4]!
	add	ip, r2, #292
	ldr	r0, .L104+8
	ldr	lr, .L104+12
	lsr	r3, r3, #22
	strh	r3, [ip]	@ movhi
	add	r3, r2, #280
	ldr	ip, .L104+16
	strh	r0, [r3]	@ movhi
	strh	lr, [r3, #2]	@ movhi
	sub	r0, r0, #49152
	add	r3, r2, #284
	add	r2, r2, #288
	strh	ip, [r3]	@ movhi
	strh	r0, [r2]	@ movhi
	strh	r1, [r2, #2]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L105:
	.align	2
.L104:
	.word	.LANCHOR1
	.word	shadowOAM
	.word	16386
	.word	-32618
	.word	391
	.size	drawScore, .-drawScore
	.align	2
	.global	updateGame1
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame1, %function
updateGame1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r0, .L109
	ldr	r3, .L109+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L109+8
	ldr	r0, .L109+12
	mov	lr, pc
	bx	r3
	ldr	r2, .L109+16
	ldr	r3, [r2]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r2]
	ldreq	r0, .L109
	bleq	updateEnemyRin.part.0
.L107:
	ldr	r0, .L109
	bl	playerCollisionRin
	pop	{r4, lr}
	b	BubbleCollisionWithRin
.L110:
	.align	2
.L109:
	.word	player
	.word	updatePlayer
	.word	updateBubbles
	.word	bubbleArray
	.word	.LANCHOR0
	.size	updateGame1, .-updateGame1
	.align	2
	.global	drawGame1
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame1, %function
drawGame1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	drawEnemyRin
	ldr	r0, .L113
	ldr	r3, .L113+4
	mov	lr, pc
	bx	r3
	ldr	r0, .L113+8
	ldr	r3, .L113+12
	mov	lr, pc
	bx	r3
	bl	drawLives
	mov	r1, #180
	ldr	r3, .L113+16
	ldr	r3, [r3]
	add	r3, r3, #392
	ldr	r2, .L113+20
	add	r3, r3, #3
	lsl	r3, r3, #22
	add	ip, r2, #292
	ldr	r0, .L113+24
	ldr	lr, .L113+28
	lsr	r3, r3, #22
	strh	r3, [ip]	@ movhi
	add	r3, r2, #280
	ldr	ip, .L113+32
	strh	r0, [r3]	@ movhi
	strh	lr, [r3, #2]	@ movhi
	sub	r0, r0, #49152
	add	r3, r2, #284
	add	r2, r2, #288
	strh	ip, [r3]	@ movhi
	strh	r0, [r2]	@ movhi
	strh	r1, [r2, #2]	@ movhi
	pop	{r4, lr}
	bx	lr
.L114:
	.align	2
.L113:
	.word	player
	.word	drawPlayer
	.word	bubbleArray
	.word	drawBubbles
	.word	.LANCHOR1
	.word	shadowOAM
	.word	16386
	.word	-32618
	.word	391
	.size	drawGame1, .-drawGame1
	.global	lives
	.global	score
	.global	enemyFrames
	.comm	enemyRin,384,4
	.comm	jumpFrames,4,4
	.comm	playerState,4,4
	.comm	bubbleArray,560,4
	.comm	shadowOAM,1024,4
	.comm	player,48,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	enemyFrames, %object
	.size	enemyFrames, 4
enemyFrames:
	.word	10
	.type	lives, %object
	.size	lives, 4
lives:
	.word	3
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	score, %object
	.size	score, 4
score:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
