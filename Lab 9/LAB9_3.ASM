print MACRO msg
	LEA DX, msg
	MOV AH, 09
	INT 21H
ENDM

data segment
	msg1 db "Enter the main string: $"
	msg2 db "Enter the sub string: $"
	brk db 10, 13, "$"
	buffer1 db 20
	len1 db ?
	main db 20 dup(?)
	buffer2 db 20
	len2 db ?
	subs db 20 dup(?)
	p db "Present$"
	np db "Not present$"
data ends

code segment
assume cs:code, ds:data
start: 
	MOV AX, data
	MOV ds, AX
	MOV es, AX
	
	print msg1
	LEA DX, buffer1
	MOV AH, 0AH
	INT 21H

	print brk
	print msg2
	LEA DX, buffer2
	MOV AH, 0AH
	INT 21H

	print brk
	MOV CH, 0
	MOV CL, len1
	CLD
	LEA SI, main
m1:	MOV AX, SI 
	LEA DI, subs
	PUSH CX
	MOV CL, len2
	REPZ CMPSB
	JZ outf
	MOV SI, AX ; to go back to start loc
	INC SI
	POP CX
	LOOP m1
	print np
	JMP notp
outf: print p
notp: MOV AH, 4CH 
	INT 21H
code ends
end start