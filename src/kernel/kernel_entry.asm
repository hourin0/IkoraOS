jmp main

%include "./src/kernel/kernel.asm"
%include "./src/kernel/drivers/keyboard/ps2keyboard-simple.asm"
%include "./src/kernel/drivers/monitor/videoservice.asm"
%include "./src/kernel/globalvar.asm"

%include "./src/kernel/programs/displayinfo.asm"
%include "./src/kernel/programs/ksplash.asm"
%include "./src/kernel/programs/inputhandler-simple.asm"

[bits 32]
main:
	call kernelmain
	jmp $
