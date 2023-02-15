code segment
assume cs:code
start:
        MOV AX, 1234H
        MOV BX, AX
        MOV AH, 4CH
        INT 21H
code ends
end start
