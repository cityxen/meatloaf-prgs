petcat -w2 -o c64-wifi-preexomizer.prg config.bas
exomizer sfx basic -o wifi-c64 c64-wifi-preexomizer.prg mlpm.scr.prg
del c64-wifi-preexomizer.prg
petcat -w2 -o wifi-vic20 config-plain.bas
petcat -w3 -o wifi-c16 config-plain.bas
petcat -w7 -o wifi-c128 config-plain.bas
petcat -w2 -o wifi loader.bas

ftp -s:ftp.u64
