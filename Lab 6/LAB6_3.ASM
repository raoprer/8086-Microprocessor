data segment 
	num dB 24H, 12H
	lcm dW ?
data ends
code segment
assume cs:code, ds:data
start:
	MOV AX, data
	MOV ds, AX
	MOV AL, num
	MOV BL, num+1
	CALL lcmp
	MOV lcm, AX
	MOV AH, 4CH
	INT 21H
lcmp PROC
	MOV AH, 0
back:	PUSH AX
	DIV BL
	CMP AH, 0
	JZ remz
	POP AX
	ADD AL, num
	ADC AH, 0
	JMP back 
remz: POP AX
	RET
lcmp ENDP
code ends
end start
