;IkoraOS string input handler
;idk

string:
	times 255 db 00
elementinarray db 00


getstr32:
	pusha
.main:
	call getchar32
	mov al,[key]
	cmp al,13
	je .done
	mov ebx,string
	mov [ebx],al
	mov bx,string
	call print32
	je .main
.done:
	mov bx,osver
	call print32
	popa
	ret
