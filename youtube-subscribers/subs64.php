<?php
$channel = "UCWpMfbjzXGnp7jxwfrNNS6Q"; // CityXen YouTube Channel Identifier
$apikey  = ""; // Enter your own api key here
$cmd="curl -s \"https://www.googleapis.com/youtube/v3/channels?part=statistics&id=";
$cmd.="$channel&key=$apikey\" | jq '.items[0].statistics.subscriberCount'";
exec($cmd,$x);
$subs=intval(str_replace("\"","",$x[0]));
$outsubs_lo=($subs & 65535);// And the low bytes of the subscribers
$outsubs_hi=($subs >> 16);  // Shift the high bytes to the right 16 times
echo pack('v', 0xc000);     // C64 program starts at $C000 (49152) (two bytes)
echo pack('v',$outsubs_lo); // This will pack the subs into the next bytes of the program
echo pack('v',$outsubs_hi); // Pack high bytes
                            // the end result: 00,C0,XL,XL,XH,XH
                            // 6 bytes sent to the C64


                            





























