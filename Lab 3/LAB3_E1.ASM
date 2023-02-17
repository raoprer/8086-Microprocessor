;to add 2 numbers in data segment and store in data segment
data segment
        num1 dB 0FFH
        num2 dB 0FEH
        sum dB 00H
        carry dB 00H
data ends

code segment
assume cs:code, ds:data
start:
        MOV AX, data
        MOV ds, AX
        MOV AL, num1
        ADD AL, num2
        MOV sum, AL
        ADC carry, 0
        MOV AH, 4CH
        INT 21H
code ends
end start

