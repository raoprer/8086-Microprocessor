data segment
	num dw 1212, 1212
	count db ?
data ends
code segment
assume cs:code, ds:data
start:
	MOV AX, data
	MOV ds, AX
	LEA SI, num
	MOV AX, [SI]

	MOV BL, 0
	MOV CX, 02
m1:	PUSH CX
	MOV CX, 16
m2:	RCL AX, 1
	ADC BL, 0
	LOOP m2
	POP CX
	INC SI
	MOV AX, [SI]
	LOOP m1
	MOV count, BL

	MOV AH, 4CH
	INT 21H
code ends
end start