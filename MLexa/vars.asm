////////////////////////////////////////////////////
// Some vars

#importonce

mlexa_config_filename:
.encoding "screencode_upper"
.text "MLEXA.CONFIG.PRG"
mlexa_config_filename_end:
.byte 0
mlexa_config_filename_len:
.byte 0

.encoding "petscii_upper"
drive_text:
.text "dRIVE:"
.byte 0
drive_status_text:
.text "sTATUS:"
.byte 0

.encoding "screencode_mixed"
top_bar_text:
.text "re"
.encoding "petscii_upper"
.text "mlEXA                            f1-help"
.encoding "screencode_mixed"
.byte 146
.byte 0

load_loading:
.byte 156
.text "LOADING "
.byte 0
dir_presskey_text:
.byte $0d
.byte 150
.text "PRESS ANY KEY"
.byte 0
enter_filename_text:
.byte $0d
.text "ENTER FILENAME:"
.byte 0


color_byte:
.byte 1
color_byte_underline:
.byte 1
drive_override_load_address_lo:
.byte $00
drive_override_load_address_hi:
.byte $30
sprite_enable_store:
.byte 0
color_white:
.encoding "screencode_mixed"
.text "e"
.byte 0

