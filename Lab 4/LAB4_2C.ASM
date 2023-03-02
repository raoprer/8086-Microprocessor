data segment
        num1 dd 12345678H
        num2 dw 9876H
        q dw ?
        r dw ?
data ends
code segment
assume cs:code, ds:data
start:
        MOV AX, data
        MOV ds, AX
        LEA SI, num1
        MOV AX, [SI]
        MOV DX, [SI+02H]
        MOV BX, num2
        DIV BX
        MOV q, AX
        MOV r, DX
        MOV AH, 4CH
        INT 21H
code ends
end start
