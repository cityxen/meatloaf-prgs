<?php
include("/var/www/include/phylactery/class.log.php");
$log=new phyLog("/var/www/tech.cityxen.net/mlexa.log");

$ip=$_SERVER["REMOTE_ADDR"];
$url=$_SERVER["SERVER_NAME"];
$a=$_REQUEST["a"];

if( (stristr($ip,"10.1.10") || 
    (stristr($ip,"24.125.54.201") ))
	) {

		$log->Entry(" GO!!: $ip -> $url -> $a");

		include("/var/www/tech.cityxen.net/mlexa.config.php");

		$url="https://mkzense.com/webhook/alexa/";
		
		switch($a[0]) {
			case "1":
				$a="Disco_ball_on";
				break;
				
			case "2":
				$a="Disco_ball_off";
				break;
				
			case "3":
				$a="IFTTTrigger-3"; // Red_alert
				break;
		
			case "4":
				$a="IFTTTrigger-4"; // Status_normal
				break;
		
			case "5":
				$a="IFTTTrigger-10"; // Spot_lights_on
				break;
				
			case "6":
				$a="IFTTTrigger-2"; // Spot_lights_off
				break;
				
			case "7":
				$a="IFTTTrigger-2"; // Spot_lights_off
				break;
			
			default:
				break;	
		}
		
		$url_out=$url.$mlexa_token."/".$a;
		$x=file_get_contents($url_out);
}
else {
	$log->Entry(" NOPE: $ip -> $url -> $a");
	die("No, this is for CityXen use only!");
	
}



