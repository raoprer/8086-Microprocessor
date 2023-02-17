;add 2 8 bit decimal numbers in data segment
data segment
        num1 db 12H
        num2 db 34H
        sum db ?
        carry db ?
data ends

code segment
assume cs:code, ds:data
start:
        MOV AX, data
        MOV ds, AX
        MOV AL, num1
        ADD AL, num2
	DAA
        MOV sum, AL
        ADC carry, 0
        MOV AH, 4CH
        INT 21H
code ends
end start
