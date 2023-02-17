;code to swap the contents of 2 arrays
data segment
        arr1 dB 12H, 23H, 34H
        arr2 dB 0ABH, 0BCH, 0CDH
data ends

code segment
assume cs:code, ds:data
start:
        MOV AX, data
        MOV ds, AX
        LEA SI, arr1
        LEA DI, arr2
        MOV CX, 03
        back:
                MOV AL, [SI]
                MOV AH, [DI]
                MOV [SI], AH
                MOV [DI], AL
                INC SI
                INC DI
        LOOP back
        MOV AH, 4CH
        INT 21H
code ends
end start
