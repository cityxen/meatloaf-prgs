<?php
$vf=file_get_contents("version_t.asm");
$vf=str_replace("<VERSION>",date("y.m.d.H.i"),$vf);
file_put_contents("version.asm",$vf);