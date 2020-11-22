.MODEL SMALL
.stack 100h

.DATA
        BASE    DB      ?
        POW     DB      ?
        NL1     DB      10, 13, 10, 13, "Enter Base:$"  
        NL2     DB      10, 13, 10, 13, "Enter Power:$"  
.CODE
mov dl, 10  
mov bl, 0         


MAIN    PROC

        MOV AX,@DATA
        MOV DS,AX

ENTER_BASE:
		LEA DX,NL1
		MOV AH,09H
		INT 21H
		
		
		mov dl, 10  
		mov bl, 0         
SCAN_NUM:
		
		mov ah, 01h
		int 21h

		cmp al, 13   ; Check if user pressed ENTER KEY
		je  SCAN_NUM_EXIT 

		mov ah, 0  
		sub al, 30H   ; ASCII to DECIMAL

		mov cl, al
		mov al, bl   ; Store the previous value in AL

		mul dl       ; multiply the previous value with 10

		add al, cl   ; previous value + new value ( after previous value is multiplyed with 10 )
		mov bl, al

		jmp SCAN_NUM    
SCAN_NUM_EXIT:
        
		MOV BASE,BL

ENTER_POWER:

      ;  LEA DX,NL2
       ; MOV AH,09H
        ;INT 21H
		

        ;MOV AH,01H
        ;INT 21H
        ;SUB AL,30H

        ;MOV CL,AL
        ;DEC CL
		MOV CL,02H
		DEC CL
        MOV AX,00
        MOV AL,BASE
LBL1:

        MUL BL
        LOOP LBL1

        MOV CL,100
        DIV CL
		ADD AX,3030H
		
        MOV DX,AX
        MOV AH,02H
        INT 21H
		
        MOV DL,DH
        INT 21H

        MOV AH,4CH
        INT 21H

MAIN    ENDP
        END     MAIN

