;Add two 32 - bit decimal numbers in data segment and store the result in data segment

data segment
	num1 dd 1234H
	num2 dd 5678H
	res dd ?
data ends
code segment
assume cs:code, ds:data
start:
	MOV AX, data
	MOV DS, AX
	
	LEA SI, num1
	LEA DI, num2
	LEA BX, res

	MOV CX, 02H
BACK:   MOV AX, [SI]
	MOV DX, [DI]
	ADC AL, DL
	DAA
	XCHG AH, AL
	XCHG DH, DL
	ADC AL, DL
	DAA
	XCHG AH, AL
	MOV [BX], AX
	INC SI   
	INC SI
	INC DI   
	INC DI
	INC BX   
	INC BX
	LOOP BACK
	
	MOV AH, 4CH
	INT 21H
code ends
end start
