;code to reverse an array
data segment
        arr dB 12H, 23H, 34H, 45H, 56H, 67H
data ends

code segment
assume cs:code, ds:data
start:
        MOV AX, data
        MOV ds, AX
        LEA SI, arr
        MOV DI, SI
        ADD DI, 04
        MOV CX, 03
        back:
                MOV AL, [SI]
                MOV AH, [DI]
                MOV [SI], AH
                MOV [DI], AL
                INC SI
                DEC DI
        LOOP back
        MOV AH, 4CH
        INT 21H
code ends
end start

