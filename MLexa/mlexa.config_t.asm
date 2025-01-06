#importonce

mlexa_config:

mlexa_path:
.encoding "screencode_mixed"
.text "<URL>"
mlexa_path_end:
.byte 0
mlexa_path_len:
.byte 0

mlexa_token: // token from mkzense
.encoding "petscii_mixed"
.text "<TOKEN>"
mlexa_token_end:
.byte 0
mlexa_token_len:
.byte 0


mlexa_calc_lens:
    lda #(mlexa_token_end-mlexa_token)
    sta mlexa_token_len
    lda #(mlexa_path_end-mlexa_path)
    sta mlexa_path_len
    lda #(mlexa_config_filename_end-mlexa_config_filename)
    sta mlexa_config_filename_len

    rts


mlexa_print_token:
    ldx #$00
!:
    lda mlexa_token,x
    beq !+
    jsr $ffd2
    inx
    jmp !-
!:
    rts


