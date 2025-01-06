# Meatloaf Browser (MLB)

### By Deadline / 🌆🅲🅸🆃🆈🆇🅴🅽☯️ (8 & 16 bit hijinx and programming!)

## C64 program to browse meatloaf websites

## Screenshots

![mainpage](https://raw.githubusercontent.com/cityxen/meatloaf-browser/master/images/mlb.png)
![helppage](https://raw.githubusercontent.com/cityxen/meatloaf-browser/master/images/mlb-help.png)


The idea for this is to present a standard to allow users to set up a webserver to host files for the c64 online.

Some standard files will work with the program to customize the site.

- Site sprite (can be multicolor) which will function in a similar fashion to modern favicon.ico. This will be shown at the top. If no site.spr file is found, it will show the Meatloaf sprite.
- Site information. This will load the site's site.inf file, which will have basic information about the server to allow customized display.
- The site will be configured using site.cfg which will have information about what kind of content will be available. ie; file section, forum, news, or whatever.
- Interaction with the site will be done via the Meatloaf by passing arguments through the load function. ie; ?x=1&y=2 which the site will read in using standard post/get http methods. The php script will then wrap responses into a small binary of data at a specific data address for c64 consumption. The c64 will then parse that data block to continue, and clear it once it is finished with the transaction. In this fashion it will act as a browser. Theoretically, it is possible to then create robust and infinite applications such as multi-user games, door games, single player games with huge maps lots of variations of enemies, etc

