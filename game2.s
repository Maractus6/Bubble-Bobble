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
	.file	"game2.c"
	.text
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"enemy has become food\000"
	.text
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	playerCollisionSayori.part.0, %function
playerCollisionSayori.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r4, .L20
	mov	r9, #120
	mov	r5, r0
	ldr	r7, .L20+4
	ldr	r8, .L20+8
	ldr	r10, .L20+12
	ldr	fp, .L20+16
	sub	sp, sp, #28
	add	r6, r4, #384
	b	.L7
.L3:
	add	r4, r4, #64
	cmp	r4, r6
	beq	.L17
.L7:
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L3
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
	beq	.L3
	ldr	r3, [r4, #36]
	cmp	r3, #0
	bne	.L18
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L6
	ldr	r3, [r10]
	cmp	r3, #0
	beq	.L19
.L6:
	mov	r2, #110
	ldr	r3, [r8]
	add	r4, r4, #64
	sub	r3, r3, #1
	cmp	r4, r6
	str	r3, [r8]
	str	r2, [r5, #4]
	str	r9, [r5]
	bne	.L7
.L17:
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L18:
	mov	r2, #0
	ldr	r3, [r5, #24]
	add	r3, r3, #1
	str	r3, [r5, #24]
	str	r2, [r4, #28]
	b	.L3
.L19:
	str	r3, [sp, #20]
	mov	r0, fp
	ldr	r3, .L20+20
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, [sp, #20]
	str	r2, [r4, #36]
	str	r3, [r4, #32]
	b	.L3
.L21:
	.align	2
.L20:
	.word	enemySayori
	.word	collision
	.word	lives
	.word	.LANCHOR0
	.word	.LC0
	.word	mgba_printf
	.size	playerCollisionSayori.part.0, .-playerCollisionSayori.part.0
	.align	2
	.global	initGame2
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame2, %function
initGame2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #1
	push	{r4, r5, r6, r7, r8, lr}
	mov	r8, #3
	mov	r7, r2
	mov	r0, #40
	mov	r6, #20
	mov	r1, #0
	mov	ip, #16
	mov	r5, #10
	mov	r4, #2
	mov	lr, #108
	ldr	r3, .L28
	str	r8, [r3]
	ldr	r3, .L28+4
.L23:
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
	bne	.L23
	mov	r0, #20
	mov	r7, #1
	mov	r6, #140
	mov	r1, #0
	mov	ip, #16
	mov	r5, #10
	mov	r4, #2
	mov	lr, #108
	ldr	r3, .L28+8
.L24:
	str	r2, [r3, #16]
	add	r2, r2, #1
	cmp	r2, #10
	str	r0, [r3, #4]
	str	r7, [r3, #28]
	str	r6, [r3]
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
	bne	.L24
	ldr	r0, .L28+12
	ldr	r3, .L28+16
	mov	lr, pc
	bx	r3
	ldr	r0, .L28+20
	ldr	r3, .L28+24
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L29:
	.align	2
.L28:
	.word	lives
	.word	enemyRin
	.word	enemySayori
	.word	player
	.word	initPlayer
	.word	bubbleArray
	.word	initBubbles
	.size	initGame2, .-initGame2
	.align	2
	.global	BubbleCollisionWithSayori
	.syntax unified
	.arm
	.fpu softvfp
	.type	BubbleCollisionWithSayori, %function
BubbleCollisionWithSayori:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r4, .L49
	mov	r9, #1
	ldr	r8, .L49+4
	sub	sp, sp, #16
	add	r7, r4, #560
	b	.L36
.L31:
	add	r4, r4, #28
	cmp	r4, r7
	beq	.L47
.L36:
	ldr	r3, [r4, #20]
	cmp	r3, #0
	beq	.L31
	ldr	r5, .L49+8
	ldr	r3, [r5, #28]
	cmp	r3, #0
	mov	r10, #0
	add	r6, r5, #192
	bne	.L48
.L33:
	add	r5, r5, #64
	cmp	r5, r6
	beq	.L31
	ldr	r3, [r5, #28]
	cmp	r3, #0
	beq	.L33
.L48:
	add	r0, r4, #12
	ldm	r0, {r0, r1}
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	r2, [r5, #24]
	ldr	r3, [r5, #20]
	ldm	r5, {r0, r1}
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	strne	r9, [r5, #32]
	strne	r10, [r4, #20]
	b	.L33
.L47:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L50:
	.align	2
.L49:
	.word	bubbleArray
	.word	collision
	.word	enemySayori
	.size	BubbleCollisionWithSayori, .-BubbleCollisionWithSayori
	.align	2
	.global	updateEnemySayori
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemySayori, %function
updateEnemySayori:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r4, .L72
	ldr	r3, [r4]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r4]
	bne	.L51
	mov	r7, #108
	mov	r6, #114
	mov	ip, r3
	ldr	r3, .L72+4
	ldr	lr, .L72+8
	add	r5, r3, #192
.L60:
	ldr	r2, [r3, #52]
	ldr	r1, [r3, #36]
	add	r2, r2, #1
	cmp	r1, #0
	str	r2, [r3, #52]
	beq	.L53
	ldr	r1, [r3, #32]
	cmp	r1, #0
	bne	.L54
.L53:
	ldr	r1, [r3, #28]
	cmp	r1, #0
	beq	.L54
	ldr	r8, [r0, #4]
	ldr	r1, [lr, #4]
	cmp	r8, r1
	ldr	r1, [r3, #4]
	addgt	r1, r1, #1
	suble	r1, r1, #1
	str	r1, [r3, #4]
	ldr	r1, [lr]
	ldr	r8, [r0]
	cmp	r8, r1
	ldr	r1, [r3]
	strbgt	r6, [r3, #60]
	addgt	r1, r1, #1
	suble	r1, r1, #1
	strble	r7, [r3, #60]
	cmp	r2, #2
	str	r1, [r3]
	streq	ip, [r3, #52]
.L54:
	add	r3, r3, #64
	cmp	r3, r5
	add	lr, lr, #64
	bne	.L60
	mov	r3, #10
	str	r3, [r4]
.L51:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L73:
	.align	2
.L72:
	.word	enemyFrames
	.word	enemySayori
	.word	enemyRin
	.size	updateEnemySayori, .-updateEnemySayori
	.align	2
	.global	playerCollisionSayori
	.syntax unified
	.arm
	.fpu softvfp
	.type	playerCollisionSayori, %function
playerCollisionSayori:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L76
	ldr	r3, [r2]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r2]
	bxne	lr
	b	playerCollisionSayori.part.0
.L77:
	.align	2
.L76:
	.word	.LANCHOR0
	.size	playerCollisionSayori, .-playerCollisionSayori
	.align	2
	.global	drawEnemySayori
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawEnemySayori, %function
drawEnemySayori:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r8, #512
	mov	fp, #1
	ldr	r3, .L92
	ldr	r1, .L92+4
	ldr	r7, .L92+8
	ldr	r10, .L92+12
	ldr	r9, .L92+16
	add	r4, r3, #192
.L86:
	ldr	r2, [r3, #28]
	cmp	r2, #0
	beq	.L79
	ldr	ip, [r3]
	ldr	r2, [r3, #16]
	and	r0, ip, r7
	orr	r6, r0, #16384
	add	r5, r1, r2, lsl #3
	ldr	lr, [r3, #52]
	strh	r6, [r5, #2]	@ movhi
	ldrb	r6, [r3, #4]	@ zero_extendqisi2
	lsl	r2, r2, #3
	cmp	lr, #0
	strh	r6, [r1, r2]	@ movhi
	bne	.L80
	ldrb	lr, [r3, #60]	@ zero_extendqisi2
	cmp	lr, #108
	addeq	lr, lr, #186
	strheq	lr, [r5, #4]	@ movhi
	beq	.L82
	cmp	lr, #114
	addeq	lr, lr, #185
	strheq	lr, [r5, #4]	@ movhi
.L82:
	ldr	lr, [r3, #32]
	cmp	lr, #0
	beq	.L84
	add	r2, r1, r2
	orr	r0, r0, r10
	strh	r9, [r2, #4]	@ movhi
	strh	r0, [r2, #2]	@ movhi
.L85:
	add	r3, r3, #64
	cmp	r3, r4
	bne	.L86
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L79:
	ldr	r2, [r3, #16]
	lsl	r2, r2, #3
	strh	r8, [r1, r2]	@ movhi
	b	.L85
.L84:
	ldr	r0, [r3, #36]
	cmp	r0, #0
	beq	.L85
	ldr	r0, .L92+20
	add	ip, ip, #10
	add	r2, r1, r2
	and	ip, ip, r7
	strh	ip, [r2, #2]	@ movhi
	strh	r0, [r2, #4]	@ movhi
	str	fp, [r3, #52]
	b	.L85
.L80:
	cmp	lr, #1
	bne	.L83
	ldrb	lr, [r3, #60]	@ zero_extendqisi2
	cmp	lr, #108
	moveq	lr, #296
	strheq	lr, [r5, #4]	@ movhi
	b	.L82
.L83:
	cmp	lr, #2
	bne	.L82
	ldrb	lr, [r3, #60]	@ zero_extendqisi2
	cmp	lr, #114
	addeq	lr, lr, #187
	strheq	lr, [r5, #4]	@ movhi
	b	.L82
.L93:
	.align	2
.L92:
	.word	enemySayori
	.word	shadowOAM
	.word	511
	.word	-32768
	.word	278
	.word	483
	.size	drawEnemySayori, .-drawEnemySayori
	.align	2
	.global	updateGame2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame2, %function
updateGame2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r0, .L97
	ldr	r3, .L97+4
	mov	lr, pc
	bx	r3
	ldr	r0, .L97+8
	ldr	r3, .L97+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L97+16
	ldr	r0, .L97
	mov	lr, pc
	bx	r3
	ldr	r3, .L97+20
	ldr	r0, .L97
	mov	lr, pc
	bx	r3
	ldr	r2, .L97+24
	ldr	r3, [r2]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r2]
	ldreq	r0, .L97
	bleq	playerCollisionSayori.part.0
.L95:
	ldr	r0, .L97+8
	ldr	r3, .L97+28
	mov	lr, pc
	bx	r3
	ldr	r0, .L97+8
	pop	{r4, lr}
	b	BubbleCollisionWithSayori
.L98:
	.align	2
.L97:
	.word	player
	.word	updatePlayer
	.word	bubbleArray
	.word	updateBubbles
	.word	updateEnemyRin
	.word	playerCollisionRin
	.word	.LANCHOR0
	.word	BubbleCollisionWithRin
	.size	updateGame2, .-updateGame2
	.align	2
	.global	drawGame2
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame2, %function
drawGame2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L101
	ldr	r3, .L101+4
	mov	lr, pc
	bx	r3
	bl	drawEnemySayori
	mov	r0, r4
	ldr	r3, .L101+8
	mov	lr, pc
	bx	r3
	ldr	r0, .L101+12
	ldr	r3, .L101+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L101+20
	mov	lr, pc
	bx	r3
	mov	r0, r4
	ldr	r3, .L101+24
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L102:
	.align	2
.L101:
	.word	player
	.word	drawEnemyRin
	.word	drawPlayer
	.word	bubbleArray
	.word	drawBubbles
	.word	drawLives
	.word	drawScore
	.size	drawGame2, .-drawGame2
	.global	timeUntilMovement
	.comm	enemySayori,192,4
	.comm	enemyRin,384,4
	.comm	jumpFrames,4,4
	.comm	playerState,4,4
	.comm	bubbleArray,560,4
	.comm	shadowOAM,1024,4
	.comm	player,48,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	timeUntilMovement, %object
	.size	timeUntilMovement, 4
timeUntilMovement:
	.word	600
	.ident	"GCC: (devkitARM release 53) 9.1.0"
