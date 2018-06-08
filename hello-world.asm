bits 16 ; tells NASM that this is 16 bit code

org 0x7c00 ; we're outputting to 0x7c00 

boot:

    mov si, hello ; points si register to hello label memory location
    mov ah, 0x0e ; 0x0e means 'Write character in TTY mode

.loop: ; this is only a label (or procedure) ... probably called .loop because "loop" is a keyword
    lodsb
    or al, al ; is al == 0
        jz halt ; (uses previous instruction) if (al == 0), jump to halt label
    int 0x10 ; runs BIOS interrupt 0x10 - Video services
    jmp .loop ; unconditional jump to repeat the procedure

halt:
    cli ; clear interrupt flag
    hlt ; halt execution

hello: 
    db "Hello world!", 0

times 510 - ($-$$) db 0 ; pad remaining 510 bytes with zeroes

dw 0xaa55 ; magic bootloader mark - marks this 512 byte sector bootable!