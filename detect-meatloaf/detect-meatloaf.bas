

;ml2.prg ==0801==
    0 print"{clr}{wht}searching for meatloaf..."
    2 c=65327:hi=int(c/256):lo=c-256*hi
    3 open1,8,15:print#1,"m-r";chr$(lo);chr$(hi):get#1,z$:t=asc(z$):close1
    6 ift=48thenprint"meatloaf found":goto10
    7 print:print"meatloaf not found.":print:end
   10 rem continue program

