;keyboard service
;holy sht man i think i'm going crazy with this
[bits 32]

getchar32:
	pusha
	in al,0x60
	;handling scan code. this would be fuckin big
	
	cmp al,0x10
	je scancode1.QKEY
	
	cmp al,0x11
	je scancode1.WKEY

	cmp al,0x12
	je scancode1.EKEY
	
	cmp al,0x13
	je scancode1.RKEY
	
	cmp al,0x14
	je scancode1.TKEY
	
	cmp al,0x15
	je scancode1.YKEY
	
	cmp al,0x16
	je scancode1.UKEY

	cmp al,0x17
	je scancode1.IKEY

	cmp al,0x18
	je scancode1.OKEY

	cmp al,0x19
	je scancode1.PKEY

	cmp al,0x1A
	cmp al,0x1B
	cmp al,0x1C
	je scancode1.ENTERKEY
	cmp al,0x1D

	cmp al,0x1E
	je scancode1.AKEY
	
	cmp al,0x1F
	je scancode1.SKEY

	cmp al,0x20
	je scancode1.DKEY

	cmp al,0x21
	je scancode1.FKEY

	cmp al,0x22
	je scancode1.GKEY

	cmp al,0x23
	je scancode1.HKEY

	cmp al,0x24
	je scancode1.JKEY

	cmp al,0x25
	je scancode1.KKEY

	cmp al,0x26
	je scancode1.LKEY

	cmp al,0x27
	cmp al,0x28
	cmp al,0x29
	cmp al,0x2A
	cmp al,0x2B

	cmp al,0x2C
	je scancode1.ZKEY

	cmp al,0x2D
	je scancode1.XKEY

	cmp al,0x2E
	je scancode1.CKEY

	cmp al,0x2F
	je scancode1.VKEY

	cmp al,0x30
	je scancode1.BKEY

	cmp al,0x31
	je scancode1.NKEY

	cmp al,0x32
	je scancode1.MKEY

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
.CKEY:
	mov al,'c'
	jmp .xuehua
.DKEY:
	mov al,'d'
	jmp .xuehua
.EKEY:
	mov al,'e'
	jmp .xuehua
.FKEY:
	mov al,'f'
	jmp .xuehua
.GKEY:
	mov al,'g'
	jmp .xuehua
.HKEY:
	mov al,'h'
	jmp .xuehua
.IKEY:
	mov al,'i'
	jmp .xuehua
.JKEY:
	mov al,'j'
	jmp .xuehua
.KKEY:
	mov al,'k'
	jmp .xuehua
.LKEY:
	mov al,'l'
	jmp .xuehua
.MKEY:
	mov al,'m'
	jmp .xuehua
.NKEY:
	mov al,'n'
	jmp .xuehua
.OKEY:
	mov al,'o'
	jmp .xuehua
.PKEY:
	mov al,'p'
	jmp .xuehua
.QKEY:
	mov al,'q'
	jmp .xuehua
.RKEY:
	mov al,'r'
	jmp .xuehua
.SKEY:
	mov al,'s'
	jmp .xuehua
.TKEY:
	mov al,'t'
	jmp .xuehua
.UKEY:
	mov al,'u'
	jmp .xuehua
.VKEY:
	mov al,'v'
	jmp .xuehua
.WKEY:
	mov al,'w'
	jmp .xuehua
.XKEY:
	mov al,'x'
	jmp .xuehua
.YKEY:
	mov al,'y'
	jmp .xuehua
.ZKEY:
	mov al,'z'
	jmp .xuehua
.ENTERKEY:
	mov al,13
	jmp .xuehua
.xuehua:
	mov [key],al
	popa
	ret

key:
	db 0,0
