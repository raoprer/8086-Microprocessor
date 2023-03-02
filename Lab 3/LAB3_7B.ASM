; Subtract two 16 - bit decimal numbers

data segment
	num1 dw 1234H
	num2 dw 5678H
	res dw ?
	borrow dw ?
data ends
code segment
assume cs:code, ds:data
start:
	MOV AX, Data
	MOV DS, AX
	
	MOV AX, num1
	MOV BX, num2
	SBB AL, BL
	DAS
	XCHG AL, AH
	XCHG BH, BL
	SBB AH, AL
	DAS
	XCHG AH, AL
	
	
	MOV res, AX
	SBB borrow,0

	MOV AH, 4CH
	INT 21H
code ends
end start 