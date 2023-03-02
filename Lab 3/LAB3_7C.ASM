;Subtract two 32 - bit hexadecimal numbers
data segement
	num1 dd 12345678H
	num2 dd 98765432H
	res dd ?
	borrow dd ?
data ends
code segment
assume cs:code, ds:data
start:
	MOV AX, data
	MOV DS, AX

	LEA SI, num1
	LEA DI, num2
	LEA DX, res
	
	MOV CX, 02H
BACK:   MOV AX, [SI]
	MOV BX, [DI]
	SBB AL, BL
	DAS
	XCHG AH, AL
	XCHG BH, BL
	SBB AL, BL
	DAS
	XCHG AH, AL
	MOV DX, AX
	
	INC SI
	INC SI
	INC DI
	INC DI
	INC DX
	INC DX

	LOOP BACK
	MOVE AH, 21H
	INT 21H
code ends
end start
	