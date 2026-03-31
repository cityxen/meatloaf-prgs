<?php
//
// Meatloaf - A Commodore 64/128 multi-device emulator
// https://github.com/idolpx/meatloaf
// Copyright(C) 2022 James Johnston
//
// Meatloaf Server Script-----------------------------------------
// Create a directory listing as a Commodore Basic Program
// Responds with binary PRG file ready to load and list
// ---------------------------------------------------------------
//
// Meatloaf is free software : you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// Meatloaf is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Meatloaf. If not, see <http://www.gnu.org/licenses/>.
//

//
// https://gist.github.com/idolpx/ab8874f8396b6fa0d89cc9bab1e4dee2
//

function diskfree() {
    $bytesize = disk_free_space("/");
    $size = $bytesize." bytes";
    
    if($bytesize>(2**10)) $size = (round($bytesize/(2**10),2))." KB"; // 2**10 kilobyte
    if($bytesize>(2**20)) $size = (round($bytesize/(2**20),2))." MB"; // 2**20 megabyte
    if($bytesize>(2**30)) $size = (round($bytesize/(2**30),2))." GB"; // 2**30 gigabyte
    if($bytesize>(2**40)) $size = (round($bytesize/(2**40),2))." TB"; // 2**40 terabyte
    if($bytesize>(2**50)) $size = (round($bytesize/(2**50),2))." PB"; // 2**50 petabyte
    if($bytesize>(2**60)) $size = (round($bytesize/(2**60),2))." EB"; // 2**60 exabyte
    if($bytesize>(2**70)) $size = (round($bytesize/(2**70),2))." ZB"; // 2**70 zettabyte
    if($bytesize>(2**80)) $size = (round($bytesize/(2**80),2))." YB"; // 2**80 yottabyte

    return $size;
}


function get_type($name)
{
    global $root;

    if(is_dir($root.$name))
    {
        $ext = "DIR";
    }
    else
    {
        $ext = pathinfo($root.$name, PATHINFO_EXTENSION);
        if (strlen($ext) < 3)
            $ext = "PRG";
    }
    return strtoupper($ext);
}

function sendLine($blocks, $line)
{
    global $next_entry;

    $line .= "\x00";
    $next_entry = $next_entry + 4 + strlen($line);
    echo pack('v', $next_entry);
    echo pack('v', $blocks);
    echo strtoupper("$line");
}

function send_petscii_line_text($x){
    while(strlen($x)<17) $x.=" ";
    sendLine(0,"\"".chr(125).$x.chr(125)."\" NFO");
}
function send_petscii_line($x) {

    $out="";
    if($x=="top_curve")  $out="213,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,201";
    if($x=="bot_curve")  $out="202,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,203";
    if($x=="mid_nochar") $out="125,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,125";
    if($x=="mid_line")   $out="171,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,96,179";

    $line="\"";
    if(!empty($out)) {
        $a=explode(",",$out);
        foreach($a as $k=>$v){
            $line.=chr(intval($v));
        }
        $line.="\" NFO";
        sendLine(0,$line);
    }
  
    // 96 = horizontal line
    // 125 = vertical line

    // 171 = left side merge 
    // 179 = right side merge

    // 201 = top right curve
    // 202 = bot left curve
    // 203 = bot right curve
    // 213 = top left curve

    // 176 = top left square
    // 173 = bot left square
    // 174 = top right square
    // 189 = bot right square

    // 205 = \
    // 206 = /
    // 219 = big +
    // 214 = X
    // 211 = heart
    // 209 = filled circle
    // 215 = circle
    // 216 = spade
    // 218 = diamond
    
}

function sendListing($dir, $exp)
{
    global $url, $root, $basic_start;

    // Send basic load address
    echo pack('v', $basic_start);

    // Send List HEADER
    $t=date("Y");
    
    sendLine(0, "\x12\"TECH.CITYXEN.NET\" $t!");

    $dh = @opendir($root.$dir);

    send_petscii_line("top_curve");
    send_petscii_line_text("WELCOME 2 CITYXEN");
    send_petscii_line("mid_line");
    send_petscii_line_text("  TOP LEVEL...");
    send_petscii_line("bot_curve");

    if ($dh) {
        while (($fname = readdir($dh)) !== false) {
            if (preg_match($exp, $fname)) {
                $stat = stat("$root$dir/$fname");
                $type = get_type("$dir/$fname");
                $blocks = 0;
                $block_spc = 3;
                if ( $type != "DIR" ) {
                    $blocks = intval($stat['size']/256);
                    if($blocks==0) $blocks=1;
                    if ($blocks > 9) $block_spc--;
                    if ($blocks > 99) $block_spc--;
                }
                if(!strcasecmp($type,"spr")) $type="prg";
                $line = sprintf("%s%-18s %s", str_repeat(" ", $block_spc), "\"".$fname."\"", $type);
                
                sendLine( $blocks, $line );
            }
        }
        closedir($dh);
    
    }

    send_petscii_line("top_curve");
    
    send_petscii_line_text("PLEASE...");
    send_petscii_line_text(" SUBSCRIBE TO OUR");
    send_petscii_line_text("  YOUTUBE CHANNEL");
    send_petscii_line("mid_line");
    send_petscii_line_text("   YOUTUBE.COM/");
    send_petscii_line_text("      CITYXEN");
    send_petscii_line("bot_curve");
    $df=explode(" ",diskfree());
    $n=(int)$df[0];
    $f=$df[1];
    sendLine( $n, $f." FREE" );

    // sendLine( 65535, "BLOCKS FREE" );

    // Send 0000 to end basic program
    echo "\x00\x00";
}


if(stristr($_SERVER["HTTP_USER_AGENT"],"MEATLOAF")) {

    $basic_start = 0x0801;
    $next_entry = $basic_start;

    $root = $_SERVER["DOCUMENT_ROOT"]."/";
    $url = "http://tech.cityxen.net/m64/";

    $dir = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);

    //Set Content Type
    header('Content-Type: application/octet-stream');

    //Use Content-Disposition: attachment to specify the filename
    header('Content-Disposition: attachment; filename="index.prg"');

    sendListing($dir, '/(?!^\..*?$|^.*?.html|^.*?.php|^api$|^web.config$)^.*?$/i');

}
else {
    $x=scandir(getcwd());
    foreach($x as $k => $v) {
        if( ($v!=".") &&
            ($v!="..") ) {
                echo "$v";

            }
    }
}
