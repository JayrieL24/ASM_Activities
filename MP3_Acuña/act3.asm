section .data
    newline db 10  ; ASCII code for newline character

section .text
    global _start

    ; Function to print a character
    print_char:
        mov eax, 4       ; System call number for write
        mov ebx, 1       ; File descriptor (stdout)
        mov ecx, esp     ; Pointer to the character on the stack
        mov edx, 1       ; Number of bytes to write
        int 0x80         ; Software interrupt to invoke system call
        ret

    _start:

        ; Read character from memory (replace with your character input method)
        ; Assuming the character is in AL register after the input

        ; Check if character is uppercase (between 'A' and 'Z')
        cmp al, 'A'
        jl not_uppercase  ; Jump if less than 'A' (not uppercase)
        cmp al, 'Z'
        jg not_uppercase  ; Jump if greater than 'Z' (not uppercase)

        ; Convert to lowercase (add 32 to ASCII code)
        add al, 32

    not_uppercase:

        ; Print the character
        push eax          
        call print_char  

        ; Print line feed (optional)
        mov eax, 4        
        mov ebx, 1        
        mov ecx, newline  
        mov edx, 1        
        int 0x80         

    ; Original printing functionality (unmodified)

        mov eax, 4       
        mov ebx, 1       
        mov ecx, msg1     
        mov edx, 1       
        int 0x80          

        mov eax, 4        
        mov ebx, 1        
        mov ecx, newline  
        mov edx, 1       
        int 0x80        

        mov eax, 4       
        mov ebx, 1        
        mov ecx, msg2    
        mov edx, 1        
        int 0x80          

        mov eax, 4       
        mov ebx, 1        
        mov ecx, newline  
        mov edx, 1        
        int 0x80        

        mov eax, 4    
        mov ebx, 1       
        mov ecx, msg3     
        mov edx, 1        
        int 0x80          

        mov eax, 4        
        mov ebx, 1       
        mov ecx, newline  
        mov edx, 1        
        int 0x80          

        mov eax, 4        
        mov ebx, 1        
        mov ecx, msg4     
        mov edx, 1        
        int 0x80          

        mov eax, 4       
        mov ebx, 1        
        mov ecx, newline  
        mov edx, 1        
        int 0x80         

    ; Exit program
        mov eax, 1       
        xor ebx, ebx      
        int 0x80          

    section .data
        msg1 db 'a'       
        msg2 db 'A'      
        msg3 db 'z'     
        msg4 db 'Z'      

;sudo apt-get update
;sudo apt-get -y install nasm
;nasm -f elf act3.asm
;ld -m  elf_i386 act3.o -o act3
;./act3
