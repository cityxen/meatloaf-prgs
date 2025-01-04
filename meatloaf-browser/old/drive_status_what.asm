
/*
show_drive_status:
    PrintString(drive_status_text)
    lda #$00
    sta $90 // clear status flags
    lda drive_number // device number
    jsr KERNAL_LISTEN
    lda #$6f // secondary address
    jsr KERNAL_SECLSN
    jsr KERNAL_UNLSTN
    lda $90
    bne sds_devnp // device not present
    lda drive_number
    jsr KERNAL_TALK
    lda #$6f // secondary address
    jsr KERNAL_SECTLK
sds_loop:
    lda $90 // get status flags
    bne sds_eof
    jsr KERNAL_IECIN
    jsr KERNAL_CHROUT
    jmp sds_loop
sds_eof:
    jsr KERNAL_UNTALK
    PrintLF()
    rts
sds_devnp:
    // handle device not present error handling
    PrintString(device_not_present_text)
    jsr draw_drive_number
    PrintString(device_not_present_text2)
    PrintLF()
    rts
    */