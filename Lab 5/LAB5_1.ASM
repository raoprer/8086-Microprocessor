data segment
        bcd dw 1234h
        hex dw ?
data ends
code segment
assume cs:code, ds:data
start:
        MOV AX, data
        MOV ds, AX
        MOV AX, bcd
        MOV AH, 0
        AND AL, 0FH
        MOV DL, AL
        MOV AX, bcd
        MOV AH, 0
        MOV CL, 4
        SHR AL, CL
        MOV BL, 0AH
        MUL BL
        ADD DL, AL
        MOV AX, bcd
        MOV AL, 0
        XCHG AL, AH
        AND AL, 0FH
        MOV BL, AL
        MOV AX, bcd
        MOV AL, 0
        XCHG AL, AH
        MOV CL, 4
        SHR AL, CL
        MOV CL, 0AH
        MUL CL
        ADD AL, BL
        MOV BL, 0AH
        MUL BL
        MUL BL
        CLC
        ADD AL, DL
        ADC AH, 0
        MOV hex, AX
        MOV AH, 4CH
        INT 21H
code ends
end start
