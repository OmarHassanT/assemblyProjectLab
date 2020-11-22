.model small
.stack 100h

.data
msg1    db      10, 13, 10, 13, "Please select an item:",0Dh,0Ah,0Dh,0Ah,09h
        db      "1- Matrix Multiplication",0Dh,0Ah,09h
        db      "2- Text Statistics",0Dh,0Ah,09h 
		db      "3- Power2",0Dh,0Ah,09h 			
        db      "4- Exit",0Dh,0Ah,09h
        db      "Enter your choice: " 
        db      '$'   

Power   db      10, 13, 10, 13, "Enter a number between (0-255):$"        
Statistics   db      10, 13, 10, 13, "hello from Statistics$"
Matrix   db      10, 13, 10, 13, "hello from matrix$"


.code
main proc 
    mov   ax,@data
    mov   ds,ax

ShowMenu:       
    lea     dx, msg1  
    mov     ah, 09h 
    int     21h     
        
getnum:        
    mov     ah, 1 ;Read character from keyboard
    int     21h        
    
    cmp     al, '1' 
    jl      ShowMenu   
    cmp     al, '4'
    jg      ShowMenu 
    cmp     al, "1"
    je      FunMultiMatrix   
    cmp     al, "2"
    je      FunStatistics
    cmp     al, "3"
    je      FunPower
    cmp      al, "4"
    jmp      Quit
;    etc...
FunMultiMatrix:
		lea dx,Matrix
		mov ah,09h
		int 21h
		jmp ShowMenu
Quit:              
   mov   ah,4ch ;exit from the program
   int   21h   

FunPower:       
    lea     dx, Power  
    mov     ah, 09h 
    int     21h    
    jmp     ShowMenu
FunStatistics:       
    lea     dx, Statistics  
    mov     ah, 09h 
    int     21h    
    jmp     ShowMenu
        
               
main endp
end main
