.model small
.stack 200h

.data
 dArray1 DB 30H, 30H, 30H, 30H

.code
main proc 
    mov   ax,@data
    mov   ds,ax


;	 MOV CL,0
;	 MOV SI,0
;LOOP2:mov ah, 01h
;	 int 21h
;	 MOV dArray1[SI],AL
;	 INC SI
;	 INC CL
;	CMP CL,4
;	JNE LOOP2
	
	
	MOV SI,0
LOOP1:MOV DL,dArray1[SI]

		INC SI
		MOV AH,02h
		INT 21h
		CMP SI,4
		JNE LOOP1

     MOV AH,4CH
     INT 21H             
main endp
end main
