[bits 32]
kernelmain:

	push edx
	mov edx,0xb8000
	mov [videoptr],edx
	mov edx,00
	mov [charinline],edx
	pop edx

	mov ah,FOREREDL
	mov bx,osname
	call print32
	mov bx,kernelver
	call print32
	mov bx,kernelarch
	call print32

	call displayInfo

	
	mov ah,FOREWHITE	
	mov ebx,hahahehe
	call print32

	call newline32
	call ksplash

	jmp kernelmain

hahahehe:
	db "ksplash",0
kernelname: db "Ikoeru",0
kernelver: db "0.0.0.2Alpha",0
kernelarch: db "i386",0
