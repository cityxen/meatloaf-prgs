petcat -w2 -o c64-wifi-preexomizer.prg config.bas
exomizer sfx basic -o c64-wifi.prg c64-wifi-preexomizer.prg mlpm.scr.prg
del c64-wifi-preexomizer.prg
petcat -w2 -o vic20-wifi.prg config-plain.bas
petcat -w3 -o c16-wifi.prg config-plain.bas
petcat -w7 -o c128-wifi.prg config-plain.bas

ftp -s:ftp.u64
