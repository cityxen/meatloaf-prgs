petcat -w2 -o c64-wifi-preexomizer.prg wifi-c64.bas
exomizer sfx basic -o include-in-firmware/wifi-c64 c64-wifi-preexomizer.prg wifi-c64.scr.prg
del c64-wifi-preexomizer.prg
petcat -w2 -o include-in-firmware/wifi-vic20 wifi-plain.bas
petcat -w3 -o include-in-firmware/wifi-c16 wifi-plain.bas
petcat -w70 -o include-in-firmware/wifi-c128 wifi-plain.bas
petcat -w2 -o include-in-firmware/wifi wifi-loader.bas


