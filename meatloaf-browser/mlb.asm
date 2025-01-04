////////////////////////////////////////////////////
// Meatloaf Browser Prototype for the Commodore 64
// Written by Deadline/CityXen

#import "Constants.asm"
#import "Macros.asm"
#import "DrawPetMateScreen.asm"


.file [name="mlb.prg", segments="Default,sprites,main,vars,help_screen"]
// .file [name="mlb.spr", segments="sprites"]


.disk [filename="mlb.d64", name="MEATLOAF BROWSER", id="CXN24" ] {
	[name="MLB", type="prg",  segments="Default,sprites,main,vars,help_screen"],
    [name="NEWGET3", type="prg", prgFiles="basic/newget3.prg"],
    // [name="ML.SPRITES", type="prg", segments="sprites"],
    [name="ML1", type="prg", prgFiles="sprites/ML.1.SPR"],
    [name="ML2", type="prg", prgFiles="sprites/ML.2.SPR"],
    [name="ML3", type="prg", prgFiles="sprites/ML.3.SPR"],
}




.segment help_screen [allowOverlap]
*=$2000 "HELP SCREEN"
#import "screens/screen-help-1.asm"

.segment vars [allowOverlap]
*=$27d2 "VARIABLES"
#import "version.asm"
#import "vars.asm"

#import "sys.il.asm"
#import "disk.il.asm"
#import "print.il.asm"
#import "input.il.asm"

.segment sprites [allowOverlap]
.const sprloc = $3200
*=sprloc "SPRITES"
#import "sprites/meatloaf_sprites.asm"

.segment main [allowOverlap]
*=$0801 "BASIC UPSTART"
 :BasicUpstart($0810)
*=$0810 "ACTUAL PROGRAM"

////////////////////////////////////////////////////////////////////////////////////////////////////////
// Init somethings

    lda #23
    sta VIC_MEM_POINTERS // set lower case

    jsr InitSprites

////////////////////////////////////////////////////////////////////////////////////////////////////////
// Start main loop

main_loop:
    ClearScreen(BLACK)
    inc $d020
    Print(top_bar_text)
    PrintStrLF(version)
    jsr draw_drive_number
    jsr show_drive_status

////////////////////////////////////////////////////////////////////////////////////////////////////////
// Check keys hit loop

keyloop:
    jsr KERNAL_GETIN
    KeyFileLoad(KEY_1,filename1,sprloc)
    KeyFileLoad(KEY_2,filename2,sprloc)
    KeyFileLoad(KEY_3,filename3,sprloc)
    KeyFileLoad(KEY_4,filename_lan1,sprloc)
    KeyFileLoad(KEY_5,filename_lan2,sprloc)
    KeyFileLoad(KEY_6,filename_lan3,sprloc)
    KeyFileLoad(KEY_7,filename_disk1,sprloc)
    KeyFileLoad(KEY_8,filename_disk2,sprloc)
    KeyFileLoad(KEY_9,filename_disk3,sprloc)
    KeySub(KEY_F1,show_help)
    KeySub(KEY_E,enter_file_manual)
    KeySub(KEY_R,restore_meatloaf_sprite)

    KeySubWait(KEY_S,show_drive_status)

    KeySubNoMain(KEY_L,move_spr_3x)
    KeySubNoMain(KEY_O,move_spr_3y)

    cmp #KEY_Q
    bne !kfs+
    rts
!kfs:

    jmp keyloop


////// TEMP

move_spr_3x:
    inc SPRITE_3_X
    rts
move_spr_3y:
    inc SPRITE_3_Y
    rts

////////////////////////////////////////////////////////////////////////////////////////////////////////
// Restore Meatloaf Sprite

restore_meatloaf_sprite:
    ldx #$00
!restore_ml_sprite:
    lda sprite_image_6,x
    sta sprite_image_0,x
    inx
    cpx #64
    bne !restore_ml_sprite-
    rts

////////////////////////////////////////////////////////////////////////////////////////////////////////
// Enter filename manually

enter_file_manual:
    lda #$02
    sta $d020
    jsr zeroize_filename_buffer
    Print(enter_filename_text)
    Print(dir_presskey_text)
!kg:
    jsr KERNAL_GETIN
    beq !kg-
    rts


////////////////////////////////////////////////////////////////////////////////////////////////////////
// Show help

show_help:
    lda SPRITE_ENABLE // disable sprites
    sta sprite_enable_store
    lda #$00
    sta SPRITE_ENABLE
    DrawPetMateScreen(help_screen)
    WaitKey()
    lda sprite_enable_store // re-enable sprites
    sta SPRITE_ENABLE
    rts

////////////////////////////////////////////////////////////////////////////////////////////////////////
// Init Sprites

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
    Print(load_loading)
    Print(color_white)
    PrintScreenCode2Petscii(filename_buffer)
    jsr load_file
!ld:
    rts

