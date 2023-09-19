#!/usr/bin/bash

color0="\e[0m\e[38;5;240m"
color1="\e[0m\e[38;5;240m\e[48;5;245m"
color2="\e[0m\e[38;5;245m"
color3="\e[0m\e[38;5;245m\e[48;5;250m"
color4="\e[0m\e[38;5;250m"
color5="\e[0m\e[38;5;250m\e[48;5;240m"

echo -e "
     $color2$color1$color0█
    $color2██$color1$color0█
   $color2█$color3█$color1$color0█
  $color2█$color3$color4█$color2█$color1$color0█
 $color2█$color3$color4█  $color2█$color1$color0█
$color2█$color3$color5█$color0████████
$color2$color3$color4███████████
"
