;program ksplash
[bits 32]

ksplash:
	jmp .main
.row0:
	db "__IKORAOS_X86_KSP__",0
.row1:
	db "     #####       ",0
.row2:
	db "#################",0
.row3:
	db "    #########    ",0
.row4:
	db "     ########    ",0
.row5:
	db "    #####   #### ",0
.row6:
	db "   #####    #####",0
.row7:
	db "#######     ###  ",0
.osmsg:
	db "  OS: ",0
.kernelmsg:
	db "  Kernel: ",0
.kernelvermsg:
	db "  Kernel Ver: ",0
.kernelarchmsg:
	db "  Kernel Arch: ",0
.main:
	call newline32
	mov ah,FOREGREENL
	mov ebx,liveusername
	call print32
	mov ebx,att
	call print32
	mov ebx,livehostname
	call print32
	call newline32
	mov ah,FOREYELLOWL
	mov ebx,.row0
	call print32
	call newline32
	mov ah,FOREGREENL
	mov ebx,.row1
	call print32
	mov ebx,.osmsg
	call print32
	mov ebx,osname
	call print32
	call newline32
	mov ebx,.row2
	call print32
	mov ebx,.kernelmsg
	call print32
	mov ebx,kernelname
	call print32
	call newline32

	mov ah,FORECYANL
	mov ebx,.row3
	call print32
	mov ebx,.kernelvermsg
	call print32
	mov ebx,kernelver
	call print32
	call newline32
	mov ebx,.row4
	call print32
	mov ebx,.kernelarchmsg
	call print32
	mov ebx,kernelarch
	call print32
	call newline32
	
	mov ah,FOREBLUEL
	mov ebx,.row5
	call print32
	call newline32
	mov ebx,.row6
	call print32
	call newline32

	mov ah,FOREREDL
	mov ebx,.row7
	call print32
	call newline32
	ret
