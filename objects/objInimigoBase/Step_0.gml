chaoI = place_meeting(x, y + 1, objColisor); 

paredeEsquerda = (place_meeting(x - 1, y, objColisorDianonal)) || (place_meeting(x - 1, y, objInimigoBase));
paredeDireita = (place_meeting(x + 1, y, objColisorDianonal)) || (place_meeting(x + 1, y, objInimigoBase)) ;
show_debug_message("Parede E: " + string(paredeEsquerda) + " Parede D: " + string(paredeDireita));

if(paredeEsquerda || paredeDireita){velhI *= -1;}

if(velhI != 0){
	image_xscale = sign(velhI);	
	sprite_index = sprInimigoAndandoDireita;
}


if(!chaoI){velvI += gravI;}