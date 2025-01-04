////////////////////////////////////////////////////
// Some vars

.const X0_POS = $a0
.const Y0_POS = $80

.const X1_POS = $19
.const Y1_POS = $e4
.const X2_POS = $19
.const Y2_POS = $e4
.const X3_POS = $19
.const Y3_POS = $e4
.const X4_POS = $19
.const Y4_POS = $e4
.const X5_POS = $19
.const Y5_POS = $e4
.const X6_POS = $19
.const Y6_POS = $e4


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
.text "mEATLOAF bROWSER                 f1-help"
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
.text "ENTER MANUALLY:"
.byte 0

filename1:
.encoding "screencode_mixed"
.text "http://tech.cityxen.net/m64/mlb/ml1"
.byte 0
filename2:
.text "http://tech.cityxen.net/m64/mlb/ml2"
.byte 0
filename3:
.text "http://tech.cityxen.net/m64/mlb/ml3"
.byte 0
filename_lan1:
.text "http://10.1.10.200/m64/mlb/ml1"
.byte 0
filename_lan2:
.text "http://10.1.10.200/m64/mlb/ml2"
.byte 0
filename_lan3:
.text "http://10.1.10.200/m64/mlb/ml3"
.byte 0
filename_disk1:
.text "ML1"
.byte 0
filename_disk2:
.text "ML2"
.byte 0
filename_disk3:
.text "ML3"
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

