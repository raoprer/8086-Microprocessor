print MACRO msg
	LEA DX, msg
	MOV AH, 09
	INT 21H
ENDM

data segment
	msg1 db "Enter n1: $"
	msg2 db "Enter n2: $"
	brk db 10, 13, "$"
	n1 db ?
	n2 db ?
data ends

code segment
assume cs:code
start:
	MOV AX, data
	MOV ds, AX
	print msg1
	CALL read
	MOV n1, AL
	print brk
	print msg2
	CALL read
	MOV n2, AL
	print brk

	MOV BL, n1
	MOV BH, n2
m1:	CALL disp 
	
	CALL delay

	MOV DL, 13
	MOV AH, 02
	INT 21H

	SUB BL, 01

	CMP BL, n2
	JAE nrset; not reset
	MOV BL, n1

nrset:MOV DX, 0FFH
	MOV AH, 06
	INT 21H
	JZ m1
	
exit:	MOV AH, 4CH 
	INT 21H

read PROC
	CALL readdig
	MOV CL, 4
	SHL AL, CL
	MOV CH, AL
	CALL readdig
	AND AL, 0FH
	ADD AL, CH
	RET
read ENDP

readdig PROC
	MOV AH, 01
	INT 21H
	SUB AL, 30H
	CMP AL, 9
	JBE r1
	SUB AL, 7
r1:   RET
readdig ENDP

disp PROC
	MOV AL, BL
	MOV CL, 04
	SHR AL, CL
	CALL dispdig
	MOV AL, BL
	AND AL, 0FH
	CALL dispdig
	RET
disp ENDP

dispdig PROC
	CMP AL, 09
	JBE d1
	ADD AL, 07
d1:	ADD AL, 30H
	MOV DL, AL
	MOV AH, 02
	INT 21H
	RET
dispdig ENDP

delay PROC
	MOV SI, 0765H
up2:	MOV DI, 0123H
up1:	DEC DI
	JNZ up1
	DEC SI
	JNZ up2
	RET
delay ENDP

code ends
end start