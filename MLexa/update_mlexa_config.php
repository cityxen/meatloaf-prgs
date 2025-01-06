<?php

include("mlexa.config.php");

$mlexa_config=file_get_contents("mlexa.config_t.asm");

$mlexa_config = str_replace("<URL>",$mlexa_url,$mlexa_config);

// $mlexa_config = str_replace("<TOKEN>",$mlexa_token,$mlexa_config);

file_put_contents("mlexa.config.asm",$mlexa_config);


?>
