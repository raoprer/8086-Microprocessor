print MACRO msg
	LEA DX, msg
	MOV AH, 09
	INT 21H
ENDM

data segment
	msg1 db "Enter 1st number: $"
	msg2 db "Enter 2nd number: $"
	msg3 db "The sum is: $"
	n1 db ?
	n2 db ?
	sum db 2 dup(?)
	brk db 10, 13, "$"
data ends

code segment
assume cs:code, ds:data
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

	CLC
	MOV AL, n2
	ADD AL, n1
	MOV sum, AL
	MOV AL, 0
	ADC AL, 0
	MOV sum+1, AL

	print msg3
	MOV AL, sum+1
	CALL disp
	MOV AL, sum
	CALL disp

	MOV AH, 4CH
	INT 21H

read PROC
	CALL readdig
	MOV CL, 04
	SHL AL, CL
	MOV BL, AL
	CALL readdig
	ADD AL, BL
	RET
read ENDP

readdig PROC
	MOV AH, 01
	INT 21H
	SUB AL, 30H
	CMP AL, 09
	JBE down2
	SUB AL, 07
down2:RET
readdig ENDP

disp PROC
	MOV BL, AL
	MOV CL, 04
	SHR AL, CL
	CMP AL, 9
	JBE down3
	ADD AL, 07
down3:ADD AL, 30H
	MOV DL, AL
	MOV AH, 02 
	INT 21H
	MOV AL, BL
	AND AL, 0FH
	CMP AL, 9
	JBE down4
	ADD AL, 07
down4:ADD AL, 30H
	MOV DL, AL
	MOV AH, 02 
	INT 21H
	RET
disp ENDP
code ends
end start
