section .data
    prompt db 'Enter your password: ', 0
    weak_msg db 'Weak password! It is less than 8 characters long.', 0
    strong_msg db 'Strong password! It is 8 characters or longer.', 0
    invalid_msg db 'Invalid input! Please enter a password.', 0
    newline db 0xA, 0

section .bss
    password resb 32   ; Maximum password length

section .text
    global _start

_start:
    ; Print prompt
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 21
    int 0x80

    ; Read password from user
    mov eax, 3          ; syscall number for read
    mov ebx, 0          ; file descriptor 0 (stdin)
    mov ecx, password   ; buffer to read into
    mov edx, 32         ; maximum number of bytes to read
    int 0x80

    ; Check if input is valid
    mov esi, password   ; Address of password
    mov ecx, 0          ; Counter for password length
check_next_char:
    mov al, byte [esi] ; Load current character
    cmp al, 0          ; Check for null terminator
    je input_end
    inc esi            ; Move to next character
    inc ecx            ; Increment counter
    jmp check_next_char

input_end:
    cmp ecx, 8          ; Compare password length with 8
    jl weak_password    ; If less than 8, weak password
    jmp strong_password ; Otherwise, strong password

weak_password:
    ; Print weak password message
    mov eax, 4
    mov ebx, 1
    mov ecx, weak_msg
    mov edx, 50
    int 0x80

    ; Print newline
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    ; Exit program
    mov eax, 1
    xor ebx, ebx
    int 0x80

strong_password:
    ; Print strong password message
    mov eax, 4
    mov ebx, 1
    mov ecx, strong_msg
    mov edx, 50
    int 0x80

    ; Print newline
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    ; Exit program
    mov eax, 1
    xor ebx, ebx
    int 0x80
