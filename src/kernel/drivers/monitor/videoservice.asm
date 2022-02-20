videoptr dd 0xb8000
charinline dd 00
print32:
    pusha
    mov edx,[videoptr]
.main:
    mov al,[ebx]    ;move address of string to al
    cmp al,0x00    ;if end of string, then return
    je .done
    cmp al,13 ;if newline, jump to .makeline
    je .makeline
    mov [edx],ax    ;move ax to video memory
    inc ebx        ;move pointer to next character in string
    add edx,2   ;move to next video character
	push edx
	mov edx,[charinline]
	add edx,2
	mov [charinline],edx
	pop edx
    jmp .main
.makeline:        ;if newline
    mov edx,[videoptr] ;move edx to start of videomemory
    add edx,160        ;add 186, move to next line
	sub edx,[charinline]
	jmp .reschar
.done:
    mov [videoptr],edx
    popa
    ret
.reschar:
	mov [videoptr],edx
	mov edx,0
	mov [charinline],edx
	popa
	ret
