chaoI = place_meeting(x, y + 1, objColisor); 
paredeDireita = place_meeting(x + 1, y, objColisor); 
paredeEsquerda = place_meeting(x - 1, y, objColisor);
if(paredeEsquerda || paredeDireita){velhI *= -1;}

if(velhI != 0){
	image_xscale = sign(velhI);	
	sprite_index = sprInimigoAndandoDireita;
}

if(!chaoI){
	velvI += gravI;
}