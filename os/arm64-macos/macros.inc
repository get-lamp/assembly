.macro push Rn:req
	str \Rn, [sp, -16]!
.endm

.macro pop Rn:req
	ldr \Rn, [sp], 16
.endm

.macro load_ptr Label:req
	adrp X0, \Label@PAGE
	add X0, X0, \Label@PAGEOFF
.endm

.macro print Rn:req Length:req
	load_ptr \Rn
	mov X1, X0
	mov X0, #1
	mov X2, \Length
	mov X16, #4
	svc 0x80
.endm
