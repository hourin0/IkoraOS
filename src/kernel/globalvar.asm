FOREBLACK equ 0x00
FOREBLUE equ 0x01
FOREGREEN equ 0x02
FORECYAN equ 0x03
FORERED equ 0x04
FOREMAGENTA equ 0x05
FOREBROWN equ 0x06
FOREGRAYL equ 0x07
FOREGRAY equ 0x08
FOREBLUEL equ 0x09
FOREGREENL equ 0x0A
FORECYANL equ 0x0B
FOREREDL equ 0x0C
FOREMAGENTAL equ 0x0D
FOREYELLOWL equ 0x0E
FOREWHITE equ 0x0F

BACKBLACK equ 0x00
BACKBLUE equ 0x10
BACKGREEN equ 0x20
BACKCYAN equ 0x30
BACKRED equ 0x40
BACKMAGENTA equ 0x50
BACKBROWN equ 0x60
BACKGRAYL equ 0x70
BACKGRAY equ 0x80
BACKBLUEL equ 0x90
BACKGREENL equ 0xA0
BACKCYANL equ 0xB0
BACKREDL equ 0xC0
BACKMAGENTAL equ 0xD0
BACKYELLOWL equ 0xE0
BACKWHITE equ 0xF0

att: db "@",0
normgt: db ">",0
surugt: db "#",0


liveusername: db "ikoiso",0
livehostname: db "liveiso",0
username: db "unnamed",0
hostname: db "unnamed",0

islive db 1
isroot db 0

osname: db "IkoraOS",0
