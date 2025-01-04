#import "Constants.asm"

#import "macros.asm"


.file [name="mlb.prg", segments="Default"]

.const sprloc = $3200
*=sprloc "SPRITES"
#import "sprites/meatloaf_sprites.asm"

*=$0aa8
#import "vars.asm"

*=$0801 "BASIC UPSTART"
 :BasicUpstart($0810)
*=$0810 "ACTUAL PROGRAM"



////////////////////////////////////////////////////////////////////////////////////////////////////////
// Init somethings

    ClearScreen(BLACK)
    lda #23
    sta VIC_MEM_POINTERS // set lower case

    jsr InitSprites

mainloop:

!wk:
    jsr KERNAL_GETIN
    beq !wk-

    cmp #KEY_Q
    bne !wk+
    rts
!wk:

    KeyFileLoad(KEY_1,filename1)
    KeyFileLoad(KEY_2,filename2)
    KeyFileLoad(KEY_3,filename3)
    KeyFileLoad(KEY_4,filename_lan1)
    KeyFileLoad(KEY_5,filename_lan2)
    KeyFileLoad(KEY_6,filename_lan3)
    KeyFileLoad(KEY_7,filename_disk1)
    KeyFileLoad(KEY_8,filename_disk2)
    KeyFileLoad(KEY_9,filename_disk3)


    jmp mainloop



InitSprites:
    jsr CopySprites
    lda #$ff
    sta SPRITE_ENABLE
    lda #$01
    sta SPRITE_EXPAND_X
    sta SPRITE_EXPAND_Y
    lda #$00
    sta SPRITE_MULTICOLOR
    sta SPRITE_MSB_X
    lda #$c0
    sta SPRITE_0_POINTER
    lda #$c1
    sta SPRITE_1_POINTER
    lda #$c2
    sta SPRITE_2_POINTER
    lda #$c3
    sta SPRITE_3_POINTER
    lda #$c4
    sta SPRITE_4_POINTER
    lda #$c5
    sta SPRITE_5_POINTER
    lda #$c6
    sta SPRITE_6_POINTER
    lda #X0_POS
    sta SPRITE_0_X
    lda #Y0_POS
    sta SPRITE_0_Y
    lda #X1_POS
    sta SPRITE_1_X
    lda #Y1_POS
    sta SPRITE_1_Y
    lda #X2_POS
    sta SPRITE_2_X
    lda #Y2_POS
    sta SPRITE_2_Y
    lda #X3_POS
    sta SPRITE_3_X
    lda #Y3_POS
    sta SPRITE_3_Y
    lda #X4_POS
    sta SPRITE_4_X
    lda #Y4_POS
    sta SPRITE_4_Y
    lda #X5_POS
    sta SPRITE_5_X
    lda #Y5_POS
    sta SPRITE_5_Y
    lda #X6_POS
    sta SPRITE_6_X
    lda #Y6_POS
    sta SPRITE_6_Y
    lda #YELLOW
    sta SPRITE_0_COLOR
    lda sprite_image_1+63
    sta SPRITE_1_COLOR
    lda sprite_image_2+63
    sta SPRITE_2_COLOR
    lda sprite_image_3+63
    sta SPRITE_3_COLOR
    lda sprite_image_4+63
    sta SPRITE_4_COLOR
    lda sprite_image_5+63
    sta SPRITE_5_COLOR
    lda sprite_image_6+63
    sta SPRITE_6_COLOR
    rts

////////////////////////////////////////////////////////////////////////////////////////////////////////
// Copy Sprites

CopySprites:
    ldx #$00
cpsloop:
    lda sprloc,x
    sta $3000,x
    lda sprloc+256,x
    sta $3000+256,x
    inx
    cpx #185
    bne cpsloop
    rts
    

////////////////////////////////////////////////////////////////////////////////////////////////////////
// Load file

load_data:
    ClearScreen(BLACK)

    lda #< load_loading
    sta $fb
    lda #> load_loading
    sta $fc
    jsr print_string_tbz

    lda #< color_white
    sta $fb
    lda #> color_white
    sta $fc
    jsr print_string_tbz

    lda #< filename_buffer
    sta $fb
    lda #> filename_buffer
    sta $fc
    jsr print_string_tbz

    ldx filename_length
    lda #$00
    sta filename_buffer,x
    inx
    sta filename_buffer,x
!ld: // Load the file

    lda filename_length
    ldx #<filename_buffer
    ldy #>filename_buffer
    jsr KERNAL_SETNAM

    lda #1
    ldx drive_number
    ldy #1
    jsr KERNAL_SETLFS

    lda #00
    ldx #00 // Set Load Address
    ldy #00 // 
    jsr KERNAL_LOAD

    inc $d020
    lda #$0d
    jsr KERNAL_CHROUT
    jsr KERNAL_CHROUT
    ldx #$00
!ld:
    lda #< dir_presskey_text
    sta $fb
    lda #> dir_presskey_text
    sta $fc
    jsr print_string_tbz
    
!wk:
    jsr KERNAL_GETIN
    beq !wk-

    ClearScreen(BLACK)
    rts


////////////////////////////////////////////////////////////////////////////////////////////////////////
// Print string terminated by zero, requires low byte in $fb (zero page), high byte in $fc

print_string_tbz:
    ldy #$00
!pst:
    lda ($fb),y
    beq !pst+
    jsr KERNAL_CHROUT
    inc $fb
    bne !pst-
    inc $fc
    jmp !pst-
!pst:
    rts

print_string_tbz_lf:
    jsr print_string_tbz
    lda #$0d
    jsr KERNAL_CHROUT
    rts


////////////////////////////////////////////////////////////////////////////////////////////////////////
// Zeroize filename buffer

zeroize_filename_buffer:
    ldx #$00
!zfb:
    lda #$00
    sta filename_buffer,x
    inx
    bne !zfb-
    rts


