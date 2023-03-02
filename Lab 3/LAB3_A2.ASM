data segment
        arr db 01H,02H,03H,04H,05H,06H,07H,08H,09H,10H,11H,12H,13H,14H,15H,16H,17H,18H,19H,20H
        sum dw ?
data ends
code segment
assume cs:code, ds:data
start:
        MOV AX, data
        MOV ds, AX
        LEA SI, arr
        MOV AX, 00H
        MOV CX, 20
        CLC
        back:
                MOV BX, 00H
                MOV BL, [SI]
                ADD AL, BL
                DAA
                XCHG AH, AL
                ADC AL, 0
                DAA
                XCHG AH, AL
                INC SI
        LOOP back
        MOV sum, AX
        MOV AH, 4CH
        INT 21H
code ends
end start


