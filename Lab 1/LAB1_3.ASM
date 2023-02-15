data segment
        num1 dw 1234H
        num2 dw 5678H
data ends
code segment
assume cs:code, ds:data
start:
        MOV AX, data
        MOV ds, AX
        MOV AX, num1
        MOV BX, num2
        MOV num1, BX
        MOV num2, AX
        MOV AH, 4CH
        INT 21H
code ends
end start
