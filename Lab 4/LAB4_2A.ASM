data segment
        num1 dw 1000H
        num2 db 12H
        quo db ?
        rem db ?
data ends
code segment
assume cs:code, ds:data
start:
        MOV AX, data
        MOV ds, AX
        MOV AX, num1
	  MOV CL, num2
        DIV CL
        MOV quo, AL
        MOV rem, AH
        MOV AH, 4CH
        INT 21H
code ends
end start
