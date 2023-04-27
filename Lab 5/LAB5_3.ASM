data segment
	hex dW 123H
	bcd dB 3 dup(?)
	rem db ?
data ends
code segment
assume cs:code, ds:data
start:
	MOV AX, data
	MOV ds, AX
	MOV AX, hex
	MOV BX, 0AH
	MOV CH, 0
	LEA SI, bcd

back:MOV DX, 0
	INC CH
	DIV BX
	TEST CH, 1
	JNZ isodd
	MOV CL, 4
	SHL DL, CL
	ADD [SI], DL
	INC SI
	JMP iseven

isodd:MOV [SI], DL
	
iseven:CMP AX, 0
	JNZ back

	MOV AH, 4CH
	INT 21H
code ends
end start
