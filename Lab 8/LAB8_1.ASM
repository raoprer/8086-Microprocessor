print MACRO msg
	LEA DX, msg
	MOV AH, 09
	INT 21H
ENDM

data segment
	msg1 db "Enter char with echo: $"
	msg2 db "Enter char without echo: $"
	c1 db ?
	c2 db ?
	brk db 10, 13, "$"
data ends

code segment
assume cs:code, ds:data
start:
	MOV AX, data
	MOV ds, AX
	print msg1
	MOV AH, 01
	INT 21H
	print brk
	MOV c1, AL
	MOV DL, AL
	MOV AH, 02
	INT 21H
	print brk
	print msg2
	MOV AH, 08
	INT 21H
	print brk
	MOV c2, AL
	MOV DL, AL
	MOV AH, 02
	INT 21H
	MOV AH, 4CH
	INT 21H
code ends
end start
