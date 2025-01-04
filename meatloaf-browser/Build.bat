@echo off

call E:\\dev\\github\\cityxen\\retro-dev-tools\\build.bat

echo Build Script: Building %1
php update_revision.php
@rem call genkickass-script.bat -t C64 -o prg_files -m false -s false -l "RETRO_DEV_LIB"
call KickAss.bat mlb.asm

exomizer sfx systrim -o prg_files\\mlb-exo.prg prg_files\\mlb.prg

xcopy prg_files\\mlb-exo.prg x:\\www\\tech.cityxen.net\\html\\m64\\mlb\\mlb.prg /Y
xcopy prg_files\\mlb.d64 x:\\www\\tech.cityxen.net\\html\\m64\\mlb\\mlb.d64 /Y

@rem ftp -s:ftp.u64

sort prg_files\\mlb.sym > prg_files\\mlb_sorted.sym