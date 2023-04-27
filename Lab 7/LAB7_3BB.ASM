;bubble sort for unsigned words
data segment
        arr dw 0190H, 0219H, 0123H
data ends
code segment
assume cs:code, ds:data
start:
        MOV AX, data
        MOV ds, AX
        MOV CX, 02
        back1:
                PUSH CX
                LEA SI, arr
                back2:
                        MOV AX, [SI]
                        CMP AX, [SI+2]
                        JBE down
                        XCHG AX, [SI+2]
                        MOV [SI], AX
                        down: INC SI
				INC SI
                LOOP back2
                POP CX
        LOOP back1
        MOV AH, 4CH
        INT 21H
code ends
end start
                        

