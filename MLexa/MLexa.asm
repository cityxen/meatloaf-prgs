////////////////////////////////////////////////////
// Meatloaf Browser Prototype for the Commodore 64
// Written by Deadline/CityXen

#import "Constants.asm"
#import "DrawPetmateScreen.asm"
#import "Macros.asm"

.file [name="mlexa.prg", segments="Default,main,vars,config,screen"]

.segment screen [allowOverlap]
*=$2000
#import "screens/screen.asm"

.segment vars [allowOverlap]
*=$1200 "VARIABLES"
#import "version.asm"
#import "vars.asm"

#import "sys.il.asm"
#import "disk.il.asm"
#import "print.il.asm"
#import "string.il.asm"
#import "input.il.asm"

.segment config [allowOverlap]
*=$0fe0 "Config"
#import "mlexa.config.asm"

.segment main [allowOverlap]
*=$0801 "BASIC UPSTART"
 :BasicUpstart($0810)
*=$0810 "ACTUAL PROGRAM"

////////////////////////////////////////////////////////////////////////////////////////////////////////
// Init somethings

    lda #23
    sta VIC_MEM_POINTERS // set lower case

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

    cmp #KEY_1
    bne !+
    jsr doit
!:
    cmp #KEY_2
    bne !+
    jsr doit
!:
    cmp #KEY_3
    bne !+
    jsr doit
!:
    cmp #KEY_4
    bne !+
    jsr doit
!:
    cmp #KEY_5
    bne !+
    jsr doit
!:
    cmp #KEY_6
    bne !+
    jsr doit
!:
    cmp #KEY_7
    bne !+
    jsr doit
!:
    cmp #KEY_F1
    bne !+
    jsr draw_help
    jmp main_loop
!:
    cmp #KEY_Q
    bne !+
    rts
!:

    jmp keyloop

doit:
    sta mlexa_path_end-1
    SetFileName(mlexa_path)
    PrintScreenCode2Petscii(mlexa_path)
    PrintChr($0d)
    lda #16
    sta drive_number
    jsr open_file_get_one_byte
    rts

load_data:
    rts

draw_help:
    DrawPetMateScreen(help_screen)
    WaitKey()
    rts