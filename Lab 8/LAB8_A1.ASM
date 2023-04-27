print MACRO msg
        LEA DX, msg
        MOV AH, 09
        INT 21H
ENDM

data segment
        msg1 db "Enter 5 elements: $"
        brk db 10,13,"$"
        msg2 db "Sorted array: $"
        arr db 5 dup(?), "$"
data ends

code segment
assume cs:code, ds:data
start:
        MOV AX, data
        MOV ds, AX
        LEA SI, arr

        print msg1
        MOV CX, 05
m1:     PUSH CX
	  print brk
	  CALL read
        MOV [SI], AL
        INC SI
	  POP CX
        LOOP m1

        CALL bubblesort

        print brk
        print msg2

        LEA SI, arr
        MOV CX, 05
m2:     PUSH CX
	  print brk
	  CALL disp
        INC SI
	  POP CX
        LOOP m2

        MOV AH, 4CH
        INT 21H

read PROC
        CALL readdig
        MOV CL, 4
        SHL AL, CL
        MOV BL, AL
        CALL readdig
        ADD AL, BL
        RET
read ENDP

readdig PROC
        MOV AH, 01
        INT 21H
        SUB AL, 30H
        CMP AL, 9
        JBE r1
        SUB AL, 7
r1:     RET
readdig ENDP

bubblesort PROC
        MOV CX, 04
b2:     PUSH CX
        LEA SI, arr
b3:     MOV AL, [SI]
        CMP AL, [SI+1]
        JBE b1
        XCHG [SI+1], AL
        MOV [SI], AL
b1:     INC SI
        LOOP b3
        POP CX
        LOOP b2
        RET
bubblesort ENDP

disp PROC
        MOV AL, [SI]
        MOV CL, 04
        SHR AL, CL
        CALL dispdig
        MOV AL, [SI]
        AND AL, 0FH
        CALL dispdig
        RET
disp ENDP

dispdig PROC
        CMP AL, 9
        JBE d1
        ADD AL, 7
d1:     ADD AL, 30H
        MOV DL, AL
        MOV AH, 02
        INT 21H
        RET
dispdig ENDP

code ends
end start

