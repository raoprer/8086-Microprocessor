;subtract 2 , 10 byte hexadecimal numberes in data segment
data segment
	num1 dt 1234558894985H
	num2 dt 749878574389H
	res dt ?
	borrow dt ?
data ends
code segment
assume cs:code, ds:data
start:
	MOV AX, data
	MOV DS, AX
	
	LEA SI, num1
	LEA DI, num2
	LEA BX, res
	MOV CX, 05H
BACK:   MOV AX, [SI]
	MOV DX, [DI]
	SBB AL, DL
	DAS
	XCHG AH, AL
	XCHG DH, DL
	SBB AL, DL
	DAS
	XCHG AL, AH
	MOV [BX], AX
	INC SI	INC SI
	INC DI	INC DI
	INC BX	INC BX
	LOOP BACK

	SBB borrow, 0
	MOV AH, 21H
	INT 21H
code ends 
end start
	