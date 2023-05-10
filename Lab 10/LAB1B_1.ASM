code segment
assume cs:code
start:
	MOV BL, 00H
m1:	CALL disp 
	
	CALL delay

	MOV DL, 13
	MOV AH, 02
	INT 21H

	MOV AL, BL
	SUB AL, 01
	DAS
	MOV BL, AL

	MOV DX, 0FFH
	MOV AH, 06
	INT 21H
	JNZ exit
	JMP m1
	
exit:	MOV AH, 4CH 
	INT 21H

disp PROC
	MOV AL, BL
	MOV CL, 04
	SHR AL, CL
	CMP AL, 09
	JBE d1
	ADD AL, 07
d1:	ADD AL, 30H
	MOV DL, AL
	MOV AH, 02
	INT 21H
	MOV AL, BL
	AND AL, 0FH
	CMP AL, 09
	JBE d2
	ADD AL, 07
d2:   ADD AL, 30H
	MOV DL, AL
	MOV AH, 02
	INT 21H
	RET
disp ENDP

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