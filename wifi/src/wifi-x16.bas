;wifi-x16.prg ==0801==
    1 rem *** meatloaf wifi config ***
    2 rem *** commander x16 version ***
    3 rem ported from cityxen/meatloaf-prgs/wifi
    4 rem original c64 version by -deadline-
    5 dr=peek(186):if dr<8 or dr>29 then dr=8
   10 print chr$(142):print"{clr}"
   20 print"{grn}meatloaf wifi {red}-{gry1}dea{gry2}dl{gry3}ine{red}-{wht}"
   21 print" commander x16 port":print
   30 print"{cyn}w{wht} - wifi settings"
   31 print"{cyn}r{wht} - reset meatloaf"
   32 print"{cyn}q{wht} - quit":print
   40 get a$
   41 if a$="w" then 100
   42 if a$="r" then gosub 520:goto 40
   43 if a$="q" then print"{clr}":end
   44 goto 40
  100 print"{clr}{grn}meatloaf wifi ssid cfg {red}-{gry1}dea{gry2}dl{gry3}ine{red}-":print chr$(14)
  101 print" {yel}github.com/cityxen/meatloaf-prgs/wifi":print
  110 gosub 500:print"{grn}current wifi ssid {wht}: {yel}{rvon} "+a$
  111 gosub 510:print"{grn}current wifi ip   {wht}: {yel}{rvon}"+a$
  120 print:print"{grn}meatloaf fw {wht}: {yel}{rvon}";
  121 open 1,dr,15,"i:":input#1,en,em$,et,es:close 1
  122 print left$(em$,11):print:print
  130 print"{grn}scanning wifi aps{wht}...":print
  131 gosub 600:for x=0 to s:gosub 700:print"{yel}{rvon}"+s$+"{rvof}":next
  140 print:input"{grn}enter new wifi ssid {wht}";s$
  141 input"{grn}enter new wifi password {wht}";p$
  150 gosub 505:print
  160 gosub 500:print"{grn}set wifi ssid to {wht}: {yel}{rvon} "+a$
  161 gosub 510:print"{grn}        wifi ip {wht}: {yel}{rvon} "+a$
  499 end
  500 open 1,30,15,"getssid":input#1,a$:close 1:return
  505 open 1,30,15,"setssid:"+s$+","+p$:close 1:return
  510 open 1,30,15,"localip":input#1,a$:close 1:return
  520 open 1,30,15,"reset":input#1,a$:close 1:return
  600 open 1,30,15,"scan":input#1,s:close 1:return
  700 z$="scanresult,"+str$(x)
  710 open 1,30,15,z$:input#1,r$,s$:close 1:return
