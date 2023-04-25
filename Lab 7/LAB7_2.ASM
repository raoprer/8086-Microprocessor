data segment
        arr db 10H,12h,19h,01h,05h
        small db ?
data ends
code segment
assume cs:code, ds:data
start:
        MOV AX, data
        MOV ds, AX
        LEA SI, arr
        MOV AL, [SI]
        MOV CX, 05
        back:
                CMP AL, [SI]
                JBE down
                MOV AL, [SI]
                down: INC SI
        LOOP back
        MOV small, AL
        MOV AH, 4CH
        INT 21H
code ends
end start
