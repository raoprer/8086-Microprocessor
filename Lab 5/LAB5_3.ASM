;doubt
data segment
	hex dW 0FFFFH
	bcd dB 4 dup(?)
data ends
code segment
assume cs:code, ds:data
start:
	MOV AX, data
	MOV ds, AX
	MOV AX, hex
	MOV BH, 6
	MOV BL, 0AH
	LEA SI, bcd
back:   DIV BL
	MOV CH, 1
	TEST BH, CH ;To check if it is even
        JNZ ifodd
	MOV CH, AL
        JMP ifeven
ifodd:  MOV CL, 4
	SHL AL, CL
	ADD AL, CH
	MOV [SI], AL
	INC SI
ifeven: CMP DL, 0AH
	JB quo
	DEC BH
	JMP back
quo:    MOV [SI], DX
	MOV AH, 4CH
	INT 21H
code ends
end start
        
