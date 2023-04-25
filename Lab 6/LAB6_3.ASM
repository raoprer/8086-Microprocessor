;doubt
data segment 
	num dB 12H, 24H
	lcm dW ?
data ends
code segment
assume cs:code, ds:data
start:
	MOV AX, data
	MOV ds, AX
	MOV AL, num+2
	MOV BL, num
	CALL lcmp
	MOV lcm, AX
	MOV AH, 4CH
	INT 21H
lcmp PROC
back:   MOV AH, 0
	PUSH AX
	DIV BL
	CMP AH, 0
	JE remz
	POP AX
	ADD AL, num+2
	JMP back 
remz:   POP AX
	RET
lcmp ENDP
code ends
end start
