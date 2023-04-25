;bubble sort for unsigned bytes
data segment
        arr db 01H, 0FFH, 10H, 02H, 20H
data ends
code segment
assume cs:code, ds:data
start:
        MOV AX, data
        MOV ds, AX
        MOV CX, 04
        back1:
                PUSH CX
                LEA SI, arr
                back2:
                        MOV AL, [SI]
                        CMP AL, [SI+1]
                        JLE down
                        XCHG AL, [SI+1]
                        MOV [SI], AL
                        down: INC SI
                LOOP back2
                POP CX
        LOOP back1
        MOV AH, 4CH
        INT 21H
code ends
end start
                        
