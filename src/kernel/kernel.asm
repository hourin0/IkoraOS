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
	mov bx,osver
	call print32
	mov bx,osarch
	call print32

	call displayInfo

	
	mov ah,FOREWHITE	
	call getstr32
	mov bx,input
	call print32


	jmp kernelmain
