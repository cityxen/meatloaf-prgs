petcat -w2 -o c64-wifi-preexomizer.prg wifi-c64.bas
exomizer sfx basic -o wifi-c64 c64-wifi-preexomizer.prg wifi-c64.scr.prg
del c64-wifi-preexomizer.prg
petcat -w2 -o wifi-vic20 wifi-plain.bas
petcat -w3 -o wifi-c16 wifi-plain.bas
petcat -w7 -o wifi-c128 wifi-plain.bas
petcat -w2 -o wifi loader.bas

ftp -s:ftp.u64
