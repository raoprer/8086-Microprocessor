code segment
assume cs:code
start:
        MOV AL, 12H
        MOV BL, AL
        MOV AH, 4CH
        INT 21H
code ends
end start
