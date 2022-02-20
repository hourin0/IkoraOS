[org 0x7c00]

CODE_SEG equ GDT_code - GDT_start
DATA_SEG equ GDT_data - GDT_start

boot:
	xor ax,ax
	mov es,ax
	mov ds,ax
	mov bp,0x7c00 ;set stack base pointer to 0x7c00
	mov sp,bp     ;set stack pointer to 0x8000 (stack is 0)

mov ah,0x03
mov al,0x05
mov bh,0x03
mov bl,0x1C
int 16h


	mov [diskno],dl ;save disk number
	mov bx,bootmsg
	call print16    ;print booting message
	jmp loadkernel

loadkernel:
	mov bx,loadmsg
	call print16
	mov ah,0x02
	mov al,0x0F	;read 16 sector
	mov ch,0x00	;read cylinder number 0
	mov cl,0x02	;read from sector number 2
	mov dh,0x00	;read head number 0
	mov dl,[diskno] ;read disk number diskno
	mov bx,0x7e00   ;load disk to 0x7e00
	int 0x13	;int 0x10,ah=0x02:BIOS read disk function
	jmp loadcomplete


print16:
pusha
mov ah,0x0E
.main:
	mov al,[bx]
	cmp al,0x00
	je .done
	int 0x10
	inc bx
	jmp .main
.done:
	popa
	ret
diskno:
	db 0x00
bootmsg:
	db "Booting to IkoraOS",13,10,00
loadmsg:
	db "Loading disk",13,10,00
times 510-($-$$) db 00
dw 0xaa55
;-------------------------------------------------------
;   end of first sector
;-------------------------------------------------------
loadsuccess:
	db "Disk read success. Press any keys to load the kernel in 32-bit mode",13,10,00
loadcomplete:
	mov bx,loadsuccess
	call print16

mov ah,0x0
int 0x16
mov ah,0x0  
mov al,0x3  ;get key and clear screen the second time just to be sure
int 0x10

mov ax,0x1003 ;disable cursor setting in AH register so we 
mov bl,0	  ; can use 16 background colors
int 0x10

mov ah,0x01
mov ch,0x3F		;disable the cursor
int 0x10

;now screen is in 80x25 text mode with 16 foreground colors, 8 background colors
;Feb 15 2022 update: 16 foreground colors and 16 background colors 

cli
lgdt [GDT_descriptor]
mov eax,cr0
or eax,1
mov cr0,eax
jmp CODE_SEG:start_protected_mode

jmp $

;---------------------------------------------
;   end of 16-bit codes
;---------------------------------------------

%include "./src/kernel/kernel_entry.asm"

GDT_start:
GDT_null:
	dd 0x0
	dd 0x0
GDT_code:
	dw 0xffff	;define limit
	dw 0x0
	db 0x0
	db 0b10011010	;define types
	db 0b11001111	;
	db 0x0
GDT_data:
	dw 0xffff
	dw 0x0
	db 0x0
	db 0b10010010
	db 0b11001111
	db 0x0
GDT_end:

GDT_descriptor:
	dw GDT_end - GDT_start - 1 ;size
	dd GDT_start		   ;start

[bits 32]
start_protected_mode:
	call main
	jmp $

