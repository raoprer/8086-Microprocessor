print MACRO msg
	LEA DX, msg
	MOV AH, 09 
	INT 21H
ENDM

data segment
	hrs db 2 dup(30H), " : "
	minu db 2 dup(30H), " : "
	sec db 2 dup(30H), "$"
data ends

code segment
assume cs:code, ds:data
start:
	MOV AX, data
	MOV ds, AX

m1:	print hrs
	
	CALL delay

	MOV DL, 13
	MOV AH, 02
	INT 21H

	LEA SI, sec+1
	CALL nexttime
	LEA SI, sec
	CALL inranges
	
	MOV DX, 0FFH
	MOV AH, 06 
	INT 21H
	JNZ exit 
	JMP m1

exit: MOV AH, 4CH 
	INT 21H


nexttime PROC
      CMP byte ptr [SI], 39H
	JB m2
      MOV byte ptr [SI], 30H
	DEC SI 
      ADD byte ptr [SI], 1
	JMP m3
m2:   ADD byte ptr [SI], 1
m3:   RET
nexttime ENDP

inrangeh PROC
      CMP byte ptr [SI],32H
	JNZ e1
      CMP byte ptr [SI+1],34H
	JNZ e1
      MOV byte ptr [SI], 30H
      MOV byte ptr [SI+1], 30H
e1:   RET
inrangeh ENDP

inranges PROC
      CMP byte ptr [SI],36H
	JNZ e2
      CMP byte ptr [SI+1],30H
	JNZ e2
      MOV byte ptr [SI], 30H
	LEA SI, minu+1
	CALL nexttime
	LEA SI, minu
	CALL inrangem
e2:   RET
inranges ENDP

inrangem PROC
      CMP byte ptr [SI],36H
	JNZ e3
      CMP byte ptr [SI+1],30H
	JNZ e3
      MOV byte ptr [SI], 30H
	LEA SI, hrs+1
	CALL nexttime
	LEA SI, hrs
	CALL inrangeh
e3:   RET
inrangem ENDP

delay PROC
	MOV SI, 012H
u1:   MOV DI, 012H
u2:   DEC DI
	JNZ u2
	DEC SI
	JNZ u1
	RET
delay ENDP

code ends 
end start


	
