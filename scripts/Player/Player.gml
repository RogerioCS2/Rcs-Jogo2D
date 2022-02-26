function Colisao(){	
if(place_meeting(x + velocidadeHorizontal, y, objColisor)){
		while !place_meeting(x + sign(velocidadeHorizontal), y, objColisor){
			x += sign(velocidadeHorizontal);
		}
		velocidadeHorizontal = 0;
	}

	if(place_meeting(x, y + velocidadeVertical, objColisor)){
		while !place_meeting(x, y + sign(velocidadeVertical), objColisor){
			y += sign(velocidadeVertical);			
		}
		velocidadeVertical = 0;	
	}
}

function MovimentoPlayer(){	
	frente = keyboard_check(vk_right);
	traz = keyboard_check(vk_left);
	pulo = keyboard_check_pressed(vk_space);
	
	velocidadeHorizontal = (frente - traz) * velocidadeHorizontalMaxima;
	Colisao();
	
	noChao = (place_meeting(x, y + 1, objColisor));
	if(noChao){gravidade = 0;}else{gravidade = 0.2;}		
	if(pulo){velocidadeVertical = -velocidadeVerticalMaxima;}else{velocidadeVertical += gravidade}

	x += velocidadeHorizontal;
	y += velocidadeVertical;		
}

function Update(){	
	MovimentoPlayer();
}