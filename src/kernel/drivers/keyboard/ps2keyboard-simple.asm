;	simplified ps/2 keyboard
;	only takes a, b, spacebar and enter key
;keyboard service
;holy sht man i think i'm going crazy with this
[bits 32]

getchar32:
	pusha
	in al,0x60
	;handling scan code. this would be fuckin big

	cmp al,0x1E
	je scancode1.AKEY

	cmp al,0x30
	je scancode1.BKEY

	cmp al,0x39
	je scancode1.SPACEBAR

	cmp al,0x1C
	je scancode1.RETURNKEY

	jmp .despacito
.despacito:
	mov al,0x00
	mov [key],al
	popa
	ret
scancode1:
.AKEY:
	mov al,'a'
	jmp .xuehua
.BKEY:
	mov al,'b'
	jmp .xuehua
.SPACEBAR:
	mov al,'c'
	jmp .xuehua
.RETURNKEY:
	mov al,'d'
	jmp .xuehua
.xuehua:
	mov [key],al
	popa
	ret

key:
	db 0,0
