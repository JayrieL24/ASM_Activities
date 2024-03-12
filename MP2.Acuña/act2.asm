section .data
    fish_art db "  __      _", 0xA   ; Line 1
             db "o'')}____//", 0xA   ; Line 2
             db " `_/      )", 0xA   ; Line 3
             db " (_(_/-(_/", 0xA   ; Line 4
    fish_len equ $ - fish_art

section .text
    global _start

_start:
    ; Write the fish art to standard output (stdout)
    mov eax, 4            ; sys_write system call number
    mov ebx, 1            ; file descriptor (stdout)
    mov ecx, fish_art     ; pointer to the message
    mov edx, fish_len     ; length of the message
    int 0x80              ; make system call

    ; Exit the program
    mov eax, 1            ; sys_exit system call number
    xor ebx, ebx          ; exit code 0
    int 0x80              ; make system call

    ;sudo apt-get update
;sudo apt-get -y install nasm
;nasm -f elf act2.asm
;ld -m  elf_i386 act1.o -o act2
;./act2
