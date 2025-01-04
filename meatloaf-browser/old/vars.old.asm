help_text_title:
.byte 14
.text "re"
.encoding "petscii_upper"
.text "mEATLOAF bROWSER - help                 "
.byte 146, 0
.encoding "screencode_mixed"

help_text:
.byte 146, 30, $0d
.text "re1"
.byte 30, 146
.text " - LOAD SPRITE 1"
.byte $0d
.text "re2"
.byte 30, 146
.text " - LOAD SPRITE 2"
.byte $0d
.text "re3"
.byte 30, 146
.text " - LOAD SPRITE 3"
.byte $0d, $0d
.text "re4"
.byte 30, 146
.text " - LOAD SPRITE 1 (LAN)"
.byte $0d
.text "re5"
.byte 30, 146
.text " - LOAD SPRITE 2 (LAN)"
.byte $0d
.text "re6"
.byte 30, 146
.text " - LOAD SPRITE 3 (LAN)"
.byte $0d, $0d
.text "re7"
.byte 30, 146
.text " - LOAD SPRITE 1 (DISK)"
.byte $0d
.text "re8"
.byte 30, 146
.text " - LOAD SPRITE 2 (DISK)"
.byte $0d
.text "re9"
.byte 30, 146
.text " - LOAD SPRITE 3 (DISK)"
.byte $0d, $0d
.text "reE"
.byte 30, 146
.text " - MANUALLY ENTER ADDRESS"
.byte $0d, $0d
.text "reR"
.byte 30, 146
.text " - RESTORE MEATLOAF SPRITE"
.byte $0d, $0d
.encoding "petscii_upper"
.text "wRITTEN BY "
.byte 156
.text "dEADLINE"
.byte 5
.text "/"
.byte 158
.text "cITYxEN"
.byte $0d
.byte 158
.text "GITHUB.COM/CITYXEN/MEATLOAF-BROWSER"
.byte $0d, $0d, 0
.encoding "screencode_mixed"
