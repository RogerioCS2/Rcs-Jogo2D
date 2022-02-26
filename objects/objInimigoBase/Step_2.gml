repeat(abs(velhI)){
	subindoRampaI = (place_meeting(x + sign(velhI), y, objColisor)) && (!place_meeting(x + sign(velhI), y - 1, objColisor));
	if(subindoRampaI){y--;}
	
	descendoRampaI = (!place_meeting(x + sign(velhI), y, objColisor)) && (!place_meeting(x + sign(velhI), y + 1, objColisor)) && (place_meeting(x + sign(velhI), y + 2, objColisor))  
	if(descendoRampaI){y++;}
		
	if(!place_meeting(x + sign(velhI), y, objColisor)){
		x += sign(velhI);		
	}else{
		velhI = 0;
		break;
	}	
}

repeat(abs(velvI)){
	if(!place_meeting(x, y + sign(velvI), objColisor)){
		y += sign(velvI);		
	}else{
		velvI = 0;
		break;
	}	
}