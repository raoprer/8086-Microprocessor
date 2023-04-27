DATA SEGMENT
        NUM DB  48H, 36H, 24H, 12H
        LCM DW  ?
DATA ENDS
CODE SEGMENT
ASSUME CS:CODE, DS:DATA
START:
        MOV AX, DATA
        MOV DS, AX

        MOV AL, NUM
        MOV BL, NUM+1
        CALL LCMP

        MOV DL, AL

        MOV AL, NUM+2
        MOV BL,NUM+3
        CALL LCMP
        MOV CL, AL

        MOV AL, DL
        MOV BL, CL
        CALL LCMP
        MOV LCM, AX

        MOV AH, 4CH
        INT 21H

LCMP PROC
BACK:   MOV AH, 0
        PUSH AX
        DIV BL
        CMP AH, 0
        JE EXIT
        POP AX
        ADD AL, NUM
        ADC AH, 0
        JMP BACK
EXIT:   POP AX
        RET
LCMP ENDP

CODE ENDS
END START
