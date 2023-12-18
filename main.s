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
	.file	"main.c"
	.text
	.align	2
	.global	goToStart
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L4
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L4+4
	mov	lr, pc
	bx	r4
	mov	r3, #3600
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L4+8
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L4+12
	ldr	r1, .L4+16
	mov	lr, pc
	bx	r4
	ldr	r1, .L4+20
	ldr	r0, .L4+24
	add	r3, r1, #320
	ldr	r2, .L4+28
	ldr	ip, .L4+32
	strh	r0, [r3]	@ movhi
	add	r0, r1, #324
	strh	r2, [r3, #2]	@ movhi
	strh	ip, [r0]	@ movhi
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #0
	ldr	r3, .L4+36
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L5:
	.align	2
.L4:
	.word	DMANow
	.word	backgroundPal
	.word	backgroundTiles
	.word	100679680
	.word	backgroundMap
	.word	shadowOAM
	.word	16484
	.word	16534
	.word	487
	.word	state
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L8
	mov	lr, pc
	bx	r3
	mov	r2, #67108864
	mov	r3, #4352
	mov	r1, #2048
	strh	r3, [r2]	@ movhi
	ldr	r4, .L8+4
	strh	r1, [r2, #8]	@ movhi
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L8+8
	ldr	r1, .L8+12
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L8+16
	ldr	r1, .L8+20
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L8+24
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	b	goToStart
.L9:
	.align	2
.L8:
	.word	mgba_open
	.word	DMANow
	.word	100728832
	.word	spritesheetTiles
	.word	83886592
	.word	spritesheetPal
	.word	backgroundPal
	.size	initialize, .-initialize
	.align	2
	.global	goToGame1
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame1, %function
goToGame1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #1024
	ldr	r4, .L12
	mov	r0, #3
	ldr	r2, .L12+4
	ldr	r1, .L12+8
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L12+12
	mov	r3, #3600
	mov	lr, pc
	bx	r4
	ldr	r3, .L12+16
	mov	lr, pc
	bx	r3
	mov	r2, #117440512
	mov	r3, #512
	mov	r0, #3
	ldr	r1, .L12+20
	mov	lr, pc
	bx	r4
	ldr	r3, .L12+24
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L12+28
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L13:
	.align	2
.L12:
	.word	DMANow
	.word	100679680
	.word	tmap1Map
	.word	tmap1Tiles
	.word	hideSprites
	.word	shadowOAM
	.word	initGame1
	.word	state
	.size	goToGame1, .-goToGame1
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L21
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L21+4
	mov	lr, pc
	bx	r4
	mov	r3, #3600
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L21+8
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L21+12
	ldr	r1, .L21+16
	mov	lr, pc
	bx	r4
	ldr	r3, .L21+20
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L14
	ldr	r3, .L21+24
	ldrh	r3, [r3, #48]
	tst	r3, #8
	beq	.L20
.L14:
	pop	{r4, lr}
	bx	lr
.L20:
	pop	{r4, lr}
	b	goToGame1
.L22:
	.align	2
.L21:
	.word	DMANow
	.word	backgroundPal
	.word	backgroundTiles
	.word	100679680
	.word	backgroundMap
	.word	oldButtons
	.word	67109120
	.size	start, .-start
	.align	2
	.global	goToGame2
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame2, %function
goToGame2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #1024
	ldr	r4, .L25
	mov	r0, #3
	ldr	r2, .L25+4
	ldr	r1, .L25+8
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	ldr	r1, .L25+12
	mov	r3, #96
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L25+16
	mov	lr, pc
	bx	r3
	mov	r3, #2
	ldr	r1, .L25+20
	ldr	r2, .L25+24
	str	r3, [r1]
	str	r3, [r2]
	pop	{r4, lr}
	bx	lr
.L26:
	.align	2
.L25:
	.word	DMANow
	.word	100679680
	.word	tilemap2Map
	.word	tilemap2Tiles
	.word	initGame2
	.word	state
	.word	.LANCHOR0
	.size	goToGame2, .-goToGame2
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L29
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L29+4
	mov	lr, pc
	bx	r4
	mov	r3, #3600
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L29+8
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L29+12
	ldr	r1, .L29+16
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L29+20
	mov	lr, pc
	bx	r3
	ldr	r1, .L29+24
	ldr	r0, .L29+28
	add	r3, r1, #328
	ldr	r2, .L29+32
	ldr	ip, .L29+36
	strh	r0, [r3]	@ movhi
	add	r0, r1, #332
	strh	r2, [r3, #2]	@ movhi
	strh	ip, [r0]	@ movhi
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #3
	ldr	r3, .L29+40
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L30:
	.align	2
.L29:
	.word	DMANow
	.word	backgroundPal
	.word	backgroundTiles
	.word	100679680
	.word	backgroundMap
	.word	hideSprites
	.word	shadowOAM
	.word	16484
	.word	-32618
	.word	498
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L38
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L38+4
	ldrh	r3, [r3, #48]
	tst	r3, #8
	bxne	lr
	ldr	r3, .L38+8
	ldr	r3, [r3]
	cmp	r3, #2
	bne	goToGame1
.L37:
	b	goToGame2
.L39:
	.align	2
.L38:
	.word	oldButtons
	.word	67109120
	.word	.LANCHOR0
	.size	pause, .-pause
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L42
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L42+4
	mov	lr, pc
	bx	r4
	mov	r3, #3600
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L42+8
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L42+12
	ldr	r1, .L42+16
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L42+20
	mov	lr, pc
	bx	r3
	mov	r0, #100
	ldr	r1, .L42+24
	ldr	r2, .L42+28
	add	r3, r1, #336
	ldr	ip, .L42+32
	strh	r0, [r3]	@ movhi
	add	r0, r1, #340
	strh	r2, [r3, #2]	@ movhi
	strh	ip, [r0]	@ movhi
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #4
	ldr	r3, .L42+36
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L43:
	.align	2
.L42:
	.word	DMANow
	.word	backgroundPal
	.word	backgroundTiles
	.word	100679680
	.word	backgroundMap
	.word	hideSprites
	.word	shadowOAM
	.word	16534
	.word	491
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L49
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L49+4
	ldrh	r3, [r3, #48]
	tst	r3, #8
	bxne	lr
	b	goToStart
.L50:
	.align	2
.L49:
	.word	oldButtons
	.word	67109120
	.size	win, .-win
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r3, #256
	ldr	r4, .L53
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L53+4
	mov	lr, pc
	bx	r4
	mov	r3, #3600
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L53+8
	mov	lr, pc
	bx	r4
	ldr	r5, .L53+12
	mov	r0, #3
	ldr	r2, .L53+16
	ldr	r1, .L53+20
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L53+24
	mov	lr, pc
	bx	r3
	mov	r1, r5
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	lr, .L53+28
	ldr	r3, .L53+32
	ldr	r0, .L53+36
	add	r2, r5, #344
	add	ip, r5, #348
	strh	r3, [r2]	@ movhi
	strh	r0, [r2, #2]	@ movhi
	mov	r1, r5
	mov	r3, #512
	mov	r2, #117440512
	strh	lr, [ip]	@ movhi
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #5
	ldr	r3, .L53+40
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L54:
	.align	2
.L53:
	.word	DMANow
	.word	backgroundPal
	.word	backgroundTiles
	.word	shadowOAM
	.word	100679680
	.word	backgroundMap
	.word	hideSprites
	.word	494
	.word	16484
	.word	16534
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	game1
	.syntax unified
	.arm
	.fpu softvfp
	.type	game1, %function
game1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L66
	mov	lr, pc
	bx	r3
	ldr	r3, .L66+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L66+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L66+12
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L66+16
	mov	lr, pc
	bx	r4
	ldr	r3, .L66+20
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L56
	ldr	r3, .L66+24
	ldrh	r3, [r3, #48]
	tst	r3, #4
	beq	.L63
.L56:
	ldr	r3, .L66+28
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L64
	ldr	r3, .L66+32
	ldr	r3, [r3]
	cmp	r3, #6
	beq	.L65
.L55:
	pop	{r4, lr}
	bx	lr
.L64:
	bl	goToLose
	ldr	r3, .L66+32
	ldr	r3, [r3]
	cmp	r3, #6
	bne	.L55
.L65:
	pop	{r4, lr}
	b	goToGame2
.L63:
	bl	goToPause
	b	.L56
.L67:
	.align	2
.L66:
	.word	updateGame1
	.word	drawGame1
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.word	oldButtons
	.word	67109120
	.word	lives
	.word	score
	.size	game1, .-game1
	.align	2
	.global	game2
	.syntax unified
	.arm
	.fpu softvfp
	.type	game2, %function
game2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L79
	mov	lr, pc
	bx	r3
	ldr	r3, .L79+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L79+8
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L79+12
	mov	lr, pc
	bx	r4
	ldr	r3, .L79+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L79+20
	ldr	r3, [r3]
	cmp	r3, #15
	beq	.L76
.L69:
	ldr	r3, .L79+24
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L77
.L70:
	ldr	r3, .L79+28
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L68
	ldr	r3, .L79+32
	ldrh	r3, [r3, #48]
	tst	r3, #4
	beq	.L78
.L68:
	pop	{r4, lr}
	bx	lr
.L77:
	bl	goToLose
	b	.L70
.L76:
	bl	goToWin
	b	.L69
.L78:
	pop	{r4, lr}
	b	goToPause
.L80:
	.align	2
.L79:
	.word	updateGame2
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.word	drawGame2
	.word	score
	.word	lives
	.word	oldButtons
	.word	67109120
	.size	game2, .-game2
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r7, fp, lr}
	ldr	r6, .L96
	ldr	fp, .L96+4
	ldr	r3, .L96+8
	mov	lr, pc
	bx	r3
	ldr	r5, .L96+12
	ldr	r2, [r6]
	ldrh	r0, [fp]
	ldr	r10, .L96+16
	ldr	r9, .L96+20
	ldr	r8, .L96+24
	ldr	r7, .L96+28
	ldr	r4, .L96+32
.L83:
	strh	r0, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [fp]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L91
.L85:
	.word	.L89
	.word	.L88
	.word	.L87
	.word	.L86
	.word	.L84
.L84:
	tst	r0, #8
	beq	.L91
	ldrh	r0, [r4, #48]
	tst	r0, #8
	beq	.L95
.L91:
	mov	r0, r3
	b	.L83
.L86:
	mov	lr, pc
	bx	r7
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L83
.L87:
	mov	lr, pc
	bx	r8
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L83
.L89:
	mov	lr, pc
	bx	r10
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L83
.L88:
	mov	lr, pc
	bx	r9
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L83
.L95:
	ldr	r3, .L96+36
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L83
.L97:
	.align	2
.L96:
	.word	state
	.word	buttons
	.word	initialize
	.word	oldButtons
	.word	start
	.word	game1
	.word	game2
	.word	pause
	.word	67109120
	.word	goToStart
	.size	main, .-main
	.text
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L103
	ldrh	r3, [r3]
	tst	r3, #4
	bxeq	lr
	ldr	r3, .L103+4
	ldrh	r3, [r3, #48]
	tst	r3, #4
	bxne	lr
	b	goToStart
.L104:
	.align	2
.L103:
	.word	oldButtons
	.word	67109120
	.size	lose, .-lose
	.comm	lives,4,4
	.global	currentRound
	.global	clearRound2
	.global	clearRound1
	.comm	state,4,4
	.comm	buttons,2,2
	.comm	oldButtons,2,2
	.comm	jumpFrames,4,4
	.comm	playerState,4,4
	.comm	bubbleArray,560,4
	.comm	shadowOAM,1024,4
	.comm	player,48,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	currentRound, %object
	.size	currentRound, 4
currentRound:
	.word	1
	.bss
	.align	2
	.type	clearRound2, %object
	.size	clearRound2, 4
clearRound2:
	.space	4
	.type	clearRound1, %object
	.size	clearRound1, 4
clearRound1:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
