data segment
	hex dB 0FFH
	bcd dB 2 dup(?)
data ends
code segment
assume cs:code, ds:data
start:
	MOV AX, data
	MOV ds, AX
	MOV AL, hex
	MOV AH, 0
	MOV BL, 0AH
	DIV BL
	MOV BH, AH
	MOV AH, 0
	DIV BL
	MOV bcd+1, AL
	MOV CL, 4
	SHL AH, CL
	ADD AH, BH
	MOV bcd, AH
	MOV AH, 4CH
	INT 21H
code ends
end start
        
