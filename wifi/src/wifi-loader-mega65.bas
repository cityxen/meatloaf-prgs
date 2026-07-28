;wifi-mega65-loader.prg ==2001==
    1 rem *** meatloaf wifi loader ***
    2 rem *** mega65 native version ***
    5 rem detect mega65 via vic-iv knock:
    6 rem write $47,$53 to $d02f; only a
    7 rem mega65 reads it back as $53.
   10 poke $d02f,$47:poke $d02f,$53
   20 if peek($d02f)<>$53 then 100
   30 print chr$(142):print"{clr}{grn}meatloaf wifi loader{wht}"
   40 print" mega65 detected":print
   50 print" loading wifi-mega65...":print
   60 run"wifi-mega65"
  100 print chr$(142):print"{clr}not a mega65 in native mode."
  110 print"this loader needs mega65 basic 65."
  120 print"in c64 mode, use the classic 'wifi'"
  130 print"loader (loads wifi-c64) instead."
  140 end
