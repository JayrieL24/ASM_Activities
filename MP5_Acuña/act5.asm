section .bss
    buffer resb 1

section .text
    global _start

_start:
    
    mov eax, 3           
    mov ebx, 0           
    mov ecx, buffer      
    mov edx, 1          
    int 80h             

    cmp byte [buffer], 'a'
    jl char_isnot_uppercase
    cmp byte [buffer], 'z'
    jg char_isnot_uppercase

    sub byte [buffer], 32 

    mov eax, 4           
    mov ebx, 1          
    mov ecx, buffer      
    mov edx, 1           
    int 80h 
    jmp system_exit

    char_isnot_uppercase:

    cmp byte [buffer], 'A'
    jl not_char
    cmp byte [buffer], 'Z'
    jg not_char

    add byte [buffer], 32


not_char:

    mov eax, 4           
    mov ebx, 1          
    mov ecx, buffer      
    mov edx, 1           
    int 80h      

system_exit:
    mov eax, 1

  ; sudo apt-get update
  ; sudo apt-get -y install nasm
  ; nasm -f elf act5.asm  
  ; ld -m  elf_i386 act5.o -o act5
  ; ./act5
