@echo off
@echo ====================================================================================================================
@echo Build Script: Building MLexa
@echo ====================================================================================================================
@php update_revision.php
@php update_mlexa_config.php
@call KickAss.bat MLexa.asm

@exomizer sfx systrim -o prg_files\\mlexa-exo.prg prg_files\\mlexa.prg

@xcopy mlexa.php x:\\www\\tech.cityxen.net\\html\\mlexa.php /Y
@xcopy mlexa.config.php x:\\www\\tech.cityxen.net\\mlexa.config.php /Y
@xcopy prg_files\\mlexa-exo.prg x:\\www\\tech.cityxen.net\\html\\m64\\ml-prgs\\mlexa.prg /Y
@xcopy prg_files\\mlexa.d64 x:\\www\\tech.cityxen.net\\html\\m64\\ml-prgs\\mlexa.d64 /Y

@ftp -s:ftp.u64

@sort prg_files\\mlexa.sym > prg_files\\mlexa_sorted.sym