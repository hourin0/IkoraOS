;built-in program: display terminal text
[bits 32]

displayInfo:
	mov bx,.newl
	call print32
	mov ah,FORECYANL
	mov bx,liveusername
	call print32

	mov ah,FOREGRAYL
	mov bx,att
	call print32

	mov ah,FOREGREENL
	mov bx,livehostname
	call print32

	mov ah,FOREGRAYL
	mov bx,normgt
	call print32
	ret
.newl:
	db 13,0
