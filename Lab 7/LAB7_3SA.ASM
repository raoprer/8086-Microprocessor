data segment
	arr db 12H, 01H, 09H
data ends
code segment
assume cs:code, ds:data
start:
	MOV AX, data
	MOV ds, AX
	
	LEA SI, arr
	MOV CX, 02
	
m2:	MOV BL, [SI]
	PUSH CX
	DEC CX
m1:	MOV DI, SI
	INC DI
	CMP BL, [DI]
	JBE ctd
	MOV BL, [DI]
	MOV BX, DI
ctd:INC DI
	LOOP m1
	MOV BH, [SI]
	MOV [BX], BH
	MOV [SI], BL
	POP CX
	INC SI
	LOOP m2

	MOV AH, 4CH
	INT 21H
	
code ends
end start