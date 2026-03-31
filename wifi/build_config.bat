petcat -w2 -o c64-wifi-preexomizer.prg config.bas
exomizer sfx basic -o wifi-c64.prg c64-wifi-preexomizer.prg mlpm.scr.prg
del c64-wifi-preexomizer.prg
petcat -w2 -o wifi-vic20.prg config-plain.bas
petcat -w3 -o wifi-c16.prg config-plain.bas
petcat -w7 -o wifi-c128.prg config-plain.bas

ftp -s:ftp.u64
