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
	.file	"player.c"
	.text
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"colorat: %d\000"
	.text
	.align	2
	.global	initPlayer
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r3, #117
	mov	r4, r0
	mov	r7, #120
	mov	r5, #110
	mov	r0, #3
	mov	r8, #2
	mov	r1, #1
	mov	r2, #16
	mov	lr, #0
	mov	ip, #10
	ldr	r6, [r4]
	strb	r3, [r4, #45]
	str	r7, [r4]
	ldr	r3, [r4, #16]
	ldr	r7, [r4, #4]
	add	r3, r3, r7
	ldr	r7, .L15
	str	r5, [r4, #4]
	ldr	r5, [r4, #20]
	str	r0, [r4, #40]
	ldr	r0, [r7]
	sub	r3, r3, #1
	add	r5, r6, r5
	rsb	r3, r3, r3, lsl #4
	sub	r5, r5, #1
	cmp	r0, #5
	str	r8, [r4, #12]
	str	lr, [r4, #28]
	str	ip, [r4, #32]
	str	r1, [r4, #8]
	str	r1, [r4, #36]
	str	r2, [r4, #16]
	str	r2, [r4, #20]
	lsl	r8, r3, #4
	add	r5, r5, r3, lsl #4
	bgt	.L2
	ldr	r3, .L15+4
	ldrb	r2, [r3, r5]	@ zero_extendqisi2
	cmp	r2, lr
	addne	r6, r6, r8
	bne	.L3
.L6:
	mov	r3, #0
.L4:
	mov	r1, #1
	ldr	r2, .L15+8
	strb	r3, [r4, #44]
	str	r1, [r2]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L3:
	ldrb	r3, [r3, r6]	@ zero_extendqisi2
.L5:
	subs	r3, r3, #0
	movne	r3, #1
	b	.L4
.L2:
	ldr	r9, .L15+12
	ldr	r0, .L15+16
	ldrb	r1, [r9, r5]	@ zero_extendqisi2
	ldr	r10, .L15+20
	mov	lr, pc
	bx	r10
	ldrb	r3, [r5, r9]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L6
	ldr	r3, [r7]
	cmp	r3, #5
	ldrle	r3, .L15+4
	add	r6, r6, r8
	ble	.L3
	ldrb	r1, [r9, r6]	@ zero_extendqisi2
	ldr	r0, .L15+16
	mov	lr, pc
	bx	r10
	ldrb	r3, [r9, r6]	@ zero_extendqisi2
	b	.L5
.L16:
	.align	2
.L15:
	.word	score
	.word	col1Bitmap
	.word	playerState
	.word	col2Bitmap
	.word	.LC0
	.word	mgba_printf
	.size	initPlayer, .-initPlayer
	.align	2
	.global	initBubbles
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBubbles, %function
initBubbles:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r3, #9
	mov	lr, #21
	mov	ip, #23
	mov	r1, #1
	mov	r2, #0
.L18:
	str	r3, [r0, #24]
	add	r3, r3, #1
	cmp	r3, #29
	str	lr, [r0, #12]
	str	ip, [r0, #16]
	str	r1, [r0, #8]
	str	r2, [r0, #20]
	add	r0, r0, #28
	bne	.L18
	ldr	lr, [sp], #4
	bx	lr
	.size	initBubbles, .-initBubbles
	.section	.rodata.str1.4
	.align	2
.LC1:
	.ascii	"bubble created\000"
	.text
	.align	2
	.global	createBubble
	.syntax unified
	.arm
	.fpu softvfp
	.type	createBubble, %function
createBubble:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r2, #0
	mov	r4, r1
	mov	r9, r0
	mov	r7, #1
	ldr	r8, .L27
	ldr	r6, .L27+4
	add	r5, r1, #560
	b	.L23
.L22:
	add	r4, r4, #28
	cmp	r4, r5
	beq	.L26
.L23:
	ldr	r3, [r4, #20]
	orrs	r3, r2, r3
	bne	.L22
	mov	r0, r8
	mov	lr, pc
	bx	r6
	str	r7, [r4, #20]
	ldr	r3, [r9]
	sub	r3, r3, #5
	str	r3, [r4]
	ldr	r3, [r9, #4]
	add	r4, r4, #28
	str	r3, [r4, #-24]
	cmp	r4, r5
	mov	r2, #1
	bne	.L23
.L26:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L28:
	.align	2
.L27:
	.word	.LC1
	.word	mgba_printf
	.size	createBubble, .-createBubble
	.section	.rodata.str1.4
	.align	2
.LC2:
	.ascii	"bubble updated\000"
	.align	2
.LC3:
	.ascii	"Bubble off screen\000"
	.text
	.align	2
	.global	updateBubbles
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBubbles, %function
updateBubbles:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r4, r0
	ldr	r7, .L37
	ldr	r6, .L37+4
	ldr	r8, .L37+8
	add	r5, r0, #560
	b	.L33
.L31:
	add	r4, r4, #28
	cmp	r4, r5
	beq	.L36
.L33:
	ldr	r3, [r4, #20]
	cmp	r3, #0
	beq	.L31
	mov	r0, r7
	mov	lr, pc
	bx	r6
	ldmib	r4, {r2, r3}
	sub	r3, r2, r3
	cmp	r3, #30
	str	r3, [r4, #4]
	bgt	.L31
	mov	r0, r8
	mov	lr, pc
	bx	r6
	mov	r3, #0
	add	r4, r4, #28
	str	r3, [r4, #-8]
	cmp	r4, r5
	bne	.L33
.L36:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L38:
	.align	2
.L37:
	.word	.LC2
	.word	mgba_printf
	.word	.LC3
	.size	updateBubbles, .-updateBubbles
	.section	.rodata.str1.4
	.align	2
.LC4:
	.ascii	"drawing bubbles\000"
	.text
	.align	2
	.global	drawBubbles
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBubbles, %function
drawBubbles:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r4, r0
	ldr	r8, .L46
	ldr	r7, .L46+4
	ldr	r6, .L46+8
	ldr	r5, .L46+12
	add	r9, r0, #560
	b	.L42
.L40:
	mov	r2, #512
	ldr	r3, [r4, #24]
	add	r4, r4, #28
	lsl	r3, r3, #3
	cmp	r4, r9
	strh	r2, [r8, r3]	@ movhi
	beq	.L45
.L42:
	ldr	r3, [r4, #20]
	cmp	r3, #0
	beq	.L40
	mov	r0, r7
	mov	lr, pc
	bx	r6
	ldr	r3, [r4]
	and	r3, r3, r5
	mvn	r3, r3, lsl #17
	mov	r0, #352
	mvn	r3, r3, lsr #17
	ldr	r2, [r4, #24]
	ldrb	ip, [r4, #4]	@ zero_extendqisi2
	add	r4, r4, #28
	add	r1, r8, r2, lsl #3
	cmp	r4, r9
	lsl	r2, r2, #3
	strh	r3, [r1, #2]	@ movhi
	strh	ip, [r8, r2]	@ movhi
	strh	r0, [r1, #4]	@ movhi
	bne	.L42
.L45:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L47:
	.align	2
.L46:
	.word	shadowOAM
	.word	.LC4
	.word	mgba_printf
	.word	511
	.size	drawBubbles, .-drawBubbles
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r8, .L110
	ldr	r5, [r0, #4]
	ldr	r7, [r0]
	ldr	r2, [r0, #20]
	ldr	r1, [r8]
	add	r3, r5, #1
	mov	r4, r0
	add	r2, r7, r2
	ldr	r0, [r0, #16]
	rsb	r3, r3, r3, lsl #4
	sub	r6, r2, #1
	cmp	r1, #5
	add	r10, r6, r3, lsl #4
	lsl	r9, r3, #4
	add	r5, r5, r0
	bgt	.L49
	ldr	r2, .L110+4
	ldrb	r3, [r2, r10]	@ zero_extendqisi2
	cmp	r3, #0
	addne	r9, r7, r9
	beq	.L103
.L50:
	ldrb	r9, [r2, r9]	@ zero_extendqisi2
.L55:
	subs	r9, r9, #0
	movne	r9, #1
.L53:
	rsb	r5, r5, r5, lsl #4
	cmp	r1, #5
	add	r6, r6, r5, lsl #4
	lsl	r5, r5, #4
	bgt	.L56
	ldr	r2, .L110+4
.L86:
	ldrb	r3, [r2, r6]	@ zero_extendqisi2
	ldr	r6, .L110+8
	cmp	r3, #0
	ldr	r3, [r6]
	bne	.L57
.L58:
	add	r5, r5, r7
	ldrb	r2, [r2, r5]	@ zero_extendqisi2
.L61:
	cmp	r2, #0
	bne	.L57
	cmp	r3, #2
	movne	r3, #1
	strb	r2, [r4, #44]
	strne	r3, [r6]
.L64:
	mov	r3, #0
	ldr	r2, .L110+12
	ldrh	r2, [r2, #48]
	tst	r2, #32
	str	r3, [r4, #28]
	bne	.L67
	mov	r2, #1
	ldr	r3, [r4]
	ldr	r1, [r4, #8]
	sub	r3, r3, r1
	cmp	r3, #39
	str	r2, [r4, #28]
	movgt	r2, #108
	strgt	r3, [r4]
	strbgt	r2, [r4, #45]
.L67:
	ldr	r3, .L110+12
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L70
	mov	r2, #1
	ldr	r3, [r4]
	ldr	r1, [r4, #8]
	add	r3, r3, r1
	cmp	r3, #199
	str	r2, [r4, #28]
	movle	r2, #114
	strle	r3, [r4]
	strble	r2, [r4, #45]
.L70:
	ldr	r3, .L110+16
	ldrh	r3, [r3]
	tst	r3, #64
	and	r3, r3, #1
	beq	.L72
	ldr	r2, .L110+12
	ldrh	r2, [r2, #48]
	tst	r2, #64
	bne	.L72
	ldrb	r2, [r4, #44]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L104
.L72:
	cmp	r3, #0
	beq	.L77
.L76:
	ldr	r3, .L110+12
	ldrh	r3, [r3, #48]
	tst	r3, #1
	beq	.L105
.L77:
	ldr	r3, [r6]
	cmp	r3, #2
	beq	.L106
	cmp	r3, #1
	bne	.L80
	ldr	r3, [r4, #4]
	ldrb	r2, [r4, #44]	@ zero_extendqisi2
	add	r3, r3, #1
	cmp	r2, #0
	str	r3, [r4, #4]
	movne	r3, #0
	strne	r3, [r6]
.L80:
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L83
	ldr	r3, [r4, #32]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r4, #32]
	bne	.L48
	ldr	r3, [r4, #36]
	ldr	r2, [r4, #40]
	add	r3, r3, #1
	cmp	r3, r2
	str	r3, [r4, #36]
	movgt	r3, #1
	strgt	r3, [r4, #36]
	mov	r3, #10
	str	r3, [r4, #32]
.L48:
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L103:
	rsb	r5, r5, r5, lsl #4
	add	r6, r6, r5, lsl #4
	mov	r9, r3
	lsl	r5, r5, #4
	b	.L86
.L56:
	ldr	r10, .L110+20
	ldr	r0, .L110+24
	ldrb	r1, [r10, r6]	@ zero_extendqisi2
	ldr	fp, .L110+28
	mov	lr, pc
	bx	fp
	ldrb	r3, [r6, r10]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L59
	ldr	r6, .L110+8
	ldr	r3, [r6]
.L57:
	mov	r2, #1
	cmp	r3, r2
	moveq	r3, #0
	strb	r2, [r4, #44]
	streq	r3, [r6]
	b	.L64
.L83:
	mov	r3, #10
	mov	r2, #1
	str	r3, [r4, #32]
	str	r2, [r4, #36]
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L49:
	ldr	fp, .L110+20
	ldr	r2, .L110+28
	ldr	r0, .L110+24
	ldrb	r1, [fp, r10]	@ zero_extendqisi2
	mov	lr, pc
	bx	r2
	ldrb	r3, [r10, fp]	@ zero_extendqisi2
	cmp	r3, #0
	ldr	r2, .L110+28
	beq	.L107
	ldr	r1, [r8]
	cmp	r1, #5
	add	r9, r7, r9
	ble	.L108
	ldrb	r1, [fp, r9]	@ zero_extendqisi2
	ldr	r0, .L110+24
	mov	lr, pc
	bx	r2
	ldrb	r9, [fp, r9]	@ zero_extendqisi2
	ldr	r1, [r8]
	b	.L55
.L106:
	ldr	r1, .L110+32
	ldr	r2, [r1]
	cmp	r2, #0
	movgt	r3, #0
	movle	r3, #1
.L73:
	orrs	r3, r3, r9
	movne	r3, #1
	ldreq	r3, [r4, #4]
	ldreq	r0, [r4, #12]
	subeq	r2, r2, #1
	subeq	r3, r3, r0
	strne	r3, [r6]
	streq	r2, [r1]
	streq	r3, [r4, #4]
	b	.L80
.L107:
	mov	r9, r3
	ldr	r1, [r8]
	b	.L53
.L59:
	ldr	r3, [r8]
	cmp	r3, #5
	ldr	r6, .L110+8
	add	r8, r7, r5
	ble	.L109
	ldrb	r1, [r10, r8]	@ zero_extendqisi2
	ldr	r0, .L110+24
	mov	lr, pc
	bx	fp
	ldrb	r2, [r8, r10]	@ zero_extendqisi2
	ldr	r3, [r6]
	b	.L61
.L104:
	mov	r1, #1
	mov	r0, #2
	mov	r2, #20
	str	r1, [r4, #28]
	ldr	r1, .L110+32
	cmp	r3, #0
	str	r0, [r6]
	str	r2, [r1]
	beq	.L73
	b	.L76
.L105:
	mov	r0, r4
	ldr	r1, .L110+36
	bl	createBubble
	b	.L77
.L108:
	ldr	r2, .L110+4
	b	.L50
.L109:
	ldr	r2, .L110+4
	ldr	r3, [r6]
	b	.L58
.L111:
	.align	2
.L110:
	.word	score
	.word	col1Bitmap
	.word	playerState
	.word	67109120
	.word	oldButtons
	.word	col2Bitmap
	.word	.LC0
	.word	mgba_printf
	.word	jumpFrames
	.word	bubbleArray
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0]
	ldr	ip, [r0, #28]
	lsl	r3, r3, #23
	ldr	r2, .L127
	ldrb	r1, [r0, #4]	@ zero_extendqisi2
	lsr	r3, r3, #23
	orr	r3, r3, #16384
	cmp	ip, #0
	strh	r3, [r2, #2]	@ movhi
	strh	r1, [r2]	@ movhi
	bne	.L113
	mov	r3, #32
	strh	r3, [r2, #4]	@ movhi
	bx	lr
.L113:
	ldrb	r3, [r0, #45]	@ zero_extendqisi2
	cmp	r3, #108
	beq	.L121
	cmp	r3, #114
	beq	.L122
	ldrh	r3, [r0, #44]
	cmp	r3, #29952
	moveq	r3, #35
	strheq	r3, [r2, #4]	@ movhi
	bx	lr
.L121:
	ldr	r3, [r0, #36]
	cmp	r3, #1
	beq	.L123
	cmp	r3, #2
	beq	.L124
	cmp	r3, #3
	moveq	r3, #42
	strheq	r3, [r2, #4]	@ movhi
	bx	lr
.L122:
	ldr	r3, [r0, #36]
	cmp	r3, #1
	beq	.L125
	cmp	r3, #2
	beq	.L126
	cmp	r3, #3
	moveq	r3, #50
	strheq	r3, [r2, #4]	@ movhi
	bx	lr
.L123:
	mov	r3, #38
	strh	r3, [r2, #4]	@ movhi
	bx	lr
.L126:
	mov	r3, #48
	strh	r3, [r2, #4]	@ movhi
	bx	lr
.L125:
	mov	r3, #46
	strh	r3, [r2, #4]	@ movhi
	bx	lr
.L124:
	mov	r3, #40
	strh	r3, [r2, #4]	@ movhi
	bx	lr
.L128:
	.align	2
.L127:
	.word	shadowOAM
	.size	drawPlayer, .-drawPlayer
	.comm	jumpFrames,4,4
	.comm	playerState,4,4
	.comm	bubbleArray,560,4
	.comm	shadowOAM,1024,4
	.comm	player,48,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
