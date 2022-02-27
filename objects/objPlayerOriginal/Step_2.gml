repeat(abs(velh)){
	subindoRampa = (place_meeting(x + sign(velh), y, objColisor)) && (!place_meeting(x + sign(velh), y - 1, objColisor));
	if(subindoRampa){y--;}
	
	descendoRampa = (!place_meeting(x + sign(velh), y, objColisor)) && (!place_meeting(x + sign(velh), y + 1, objColisor)) && (place_meeting(x + sign(velh), y + 2, objColisor))  
	if(descendoRampa){y++;}
		
	if(!place_meeting(x + sign(velh), y, objColisor)){
		x += sign(velh);		
	}else{
		velh = 0;
		break;
	}	
}

repeat(abs(velv)){
	if(!place_meeting(x, y + sign(velv), objColisor)){
		y += sign(velv);		
	}else{
		velv = 0;
		break;
	}	
}