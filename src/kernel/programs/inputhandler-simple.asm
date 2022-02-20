;IkoraOS simplified string input handler
; only using 4 keyboard characters

input:
	db 0x00,0x00,0x00,0x00
chargot:
	db 00
tinput:
	db 0x00

getstr32:
	pusha
.main:
	call getchar32
	mov al,[key]
	cmp al,'d'
	je .done
	cmp al,'c'
	je .next
	mov ebx,tinput
	mov [ebx],al
	jmp .main
.next:
	mov al,[tinput]
	mov ebx,input
;	add ebx,[chargot]
	mov [ebx],al
	mov bx,input
	call print32
	je .main
.done:
	mov bx,osver
	call print32
	popa
	ret
