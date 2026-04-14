mkdir prg_files
petcat -w2 -o src/c64-wifi-preexomizer.prg src/wifi-c64.bas
exomizer sfx basic -o prg_files/wifi-c64 src/c64-wifi-preexomizer.prg src/meatloaf-c64-screen-sys49152.prg
del src/c64-wifi-preexomizer.prg
petcat -w2 -o prg_files/wifi-vic20 src/wifi-plain.bas
petcat -w3 -o prg_files/wifi-c16 src/wifi-plain.bas
petcat -w70 -o prg_files/wifi-c128 src/wifi-plain.bas
petcat -w2 -o prg_files/wifi src/wifi-loader.bas
7z a prg_files.zip prg_files/*
