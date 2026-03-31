;ml2.prg ==0801==
    0 goto 10
    1 print"{clr}{wht}searching for meatloaf..."
    2 c=65327:hi=int(c/256):lo=c-256*hi
    3 open1,8,15:print#1,"m-r";chr$(lo);chr$(hi):get#1,z$:t=asc(z$):close1
    6 ift=48thenprint"meatloaf found":goto10
    7 print:print"meatloaf not found.":print:end
   10 print chr$(142):sys49152
   12 get a$
   13 ifa$="w"thengoto20
   14 ifa$="r"thengosub520:goto 12
   15 ifa$="q"thenprint"{clr}":end
   16 goto 12
   20 rem print "{clr}                             {red}/"
   21 print "{clr}{grn}Meatloaf WIFI SSID CFG by {red}-{gry1}Dea{gry2}dl{gry3}ine{red}-":printchr$(14)
   22 print " >{yel}github.com/cityxen/meatloaf-prgs/wifi":print
   23 gosub500:print "{grn}Current WIFI SSID {wht}: {yel}{rvon} "+a$
   24 gosub510:print "{grn}Current WIFI IP   {wht}: {yel}{rvon}"+a$
   25 print:print "{grn}Meatloaf FW {wht}: {yel}{rvon}";
   30 gosub 900:print:print
   40 print"{grn}Scanning WIFI APs{wht}...":print
   50 gosub 600:forx=0tos:gosub 700:print"{yel}{rvon}"+s$+"{rvof}":next
   70 print:input "{grn}Enter NEW WIFI SSID {wht}";s$
   80 input "{grn}Enter NEW WIFI Password {wht}";p$
  100 gosub 505:print 
  140 gosub 500:print "{grn}SET WIFI SSID TO {wht}: {yel}{rvon} "+a$
  150 gosub 510:print "{grn}         WIFI IP {wht}: {yel}{rvon} "+a$
  499 end
  500 open1,30,15,"getssid":input#1,a$:close1:return
  505 open1,30,15,"setssid:"+s$+","+p$:close1:return
  510 open1,30,15,"localip":input#1,a$:close1:return
  520 open1,30,15,"reset":input#1,a$:close1:return
  600 open1,30,15,"scan":input#1,s:close1:return
  700 z$="scanresult,"+str$(x)
  705 rem print"Scanning["+z$+"]"
  710 open1,30,15,z$:input#1,r$,s$:close1: return
  900 open 1,8,15,"i0":input#1,en,em$,et,es:close 1
  905 
  910 rem print en;
  915 print em$; :rem "{left},"+
  920 rem print et;:print "{left},";:print es;
  940 print "{rvof}";
  950 return
