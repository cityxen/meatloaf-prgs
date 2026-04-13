   10 print:print"detect meatloaf..."
   20 open1,8,15,"i":input#1,en,em$:close1
   30 en$=str$(en):m$=left$(em$,8)
   40 f$=right$(em$,11)
   50 y$="yes":ifm$<>"meatloaf"theny$="no"
   55 print
   60 print"meatloaf:"+y$
   70 print"firmware:"+f$
