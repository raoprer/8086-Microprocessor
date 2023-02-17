;to add 2 numbers in data segment and store in data segment
data segment
        sum dW 00H
        carry dB 00H
data ends

code segment
assume cs:code, ds:data
start:
        MOV AX, data
        MOV ds, AX
        MOV AX, 1234H
        MOV BX, 4321H
        ADD AX, BX 
        MOV sum, AX
        ADC carry, 0
        MOV AH, 4CH
        INT 21H
code ends
end start

