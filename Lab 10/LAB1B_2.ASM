;working
code segment
assume cs:code
start:
	MOV BL, 00
	MOV AL, 'u'
m1:	PUSH AX; imp
	CALL disp

	CALL delay
	
	MOV DL, 13
	MOV AH, 02
	INT 21H
	
 	MOV DX, 0FFH
	MOV AH, 06
	INT 21H
	JNZ comp; keypress occurred - use updated AX
	POP AX; imp - if keypress has not occurred, use previous value

comp:	CMP AL, 't'
	JZ ter

	CMP AL, 'u'
	JNZ dc 
	CALL upcount
	JMP uc

dc:   CMP AL, 'd'
	JNZ uc
	CALL downcount

uc:	JMP m1
	
ter:  MOV AH, 4CH 
	INT 21H

disp PROC
	PUSH AX
	MOV AL, BL
	MOV CL, 04
	SHR AL, CL
	CALL dispdig
	MOV AL, BL
	AND AL, 0FH
	CALL dispdig
	POP AX
	RET
disp ENDP

dispdig PROC
	PUSH AX
	ADD AL, 30H
	MOV DL, AL
	MOV AH, 02
	INT 21H
	POP AX
	RET
dispdig ENDP

delay PROC
	MOV SI, 0765H
u2:	MOV DI, 0123H
u1:	DEC DI
	JNZ u1
	DEC SI
	JNZ u2
	RET
delay ENDP

upcount PROC
	PUSH AX
	MOV AL, BL
	ADD AL, 1
	DAA
	MOV BL, AL
	POP AX
	RET
upcount ENDP

downcount PROC
	PUSH AX
	MOV AL, BL
	SUB AL, 1
	DAS
	MOV BL, AL
	POP AX
	RET
downcount ENDP	

code ends
end start
	
