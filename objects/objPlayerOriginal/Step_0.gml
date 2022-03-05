chao = place_meeting(x, y + 1, objColisor); 

var left, right, jump, jump_s, run, dash;
var velocidade;

left = keyboard_check(vk_left);
right = keyboard_check(vk_right);
jump = keyboard_check_pressed(vk_space);
jump_s = keyboard_check_released(vk_space);
run = keyboard_check(ord("C"));
dash = keyboard_check_pressed(ord("D"));

if(dash){slide = true;}

if(run){velocidade = velh_cor;}else{velocidade = max_velh;}
velh = (right - left) * velocidade;

if(velh == 0 && playerSelecionado == 1){sprite_index = sprPlayerParadoA;}
if(!chao  && playerSelecionado == 1){sprite_index = sprPlayerPulandoA;}
if(velh != 0  && playerSelecionado == 1){
	image_xscale = sign(velh);
	sprite_index = sprPlayerAndandoDireitaA;
}
if(run && velh != 0  && playerSelecionado == 1){
	image_xscale = sign(velh);	
	sprite_index = sprPlayerCorrendoDireitaA;
}

if(velh == 0 && playerSelecionado == 2){sprite_index = sprPlayerParadoB;}
if(!chao  && playerSelecionado == 2){sprite_index = sprPlayerPulandoA;}
if(velh != 0  && playerSelecionado == 2){
	image_xscale = sign(velh);
	sprite_index = sprPlayerAndandoDireitaB;
}
if(run && velh != 0  && playerSelecionado == 2){
	image_xscale = sign(velh);	
	sprite_index = sprPlayerCorrendoB; 
}

if(chao && jump){
	velv = -max_velv;	
}else{
	velv += grav;
	if(jump_s && velv < 0){
		velv = velv * 0.7;	
	}
}

if(slide && chao && playerSelecionado == 1){	
	slide_time--;
	sprite_index = sprPlayerRasteiraDireitaA;
	velh = image_xscale * 15;
	image_yscale = 0.7;
	
	semColisaoTeto = (!place_meeting(x, y - sprite_height, objColisor));  	
	if(slide_time <= 0 && semColisaoTeto){
		slide_time = room_speed / 4;		
		slide = false;
		image_yscale = 1;		
	}	
}

if(dash && playerSelecionado == 2){	
	show_debug_message("Largando Balão");	
	instance_create_layer(x + 25 * image_xscale, y, layer, objBalao);
}

var danoInimigo = instance_place(x, y + 3, objInimigoBase);
if(danoInimigo && !chao && velv > 0){	
	velv = -max_velv;
	instance_destroy(danoInimigo);
}

if(instance_place(x, y, objTrocaPlayer)){
	playerSelecionado = 2;
	instance_destroy(objTrocaPlayer);
	//show_debug_message("Estou colidindo com o Player");	
}

if( place_meeting(x, y, objInimigoBase)){dano = true;}
if(dano){
	velh = velh * -2;
	velv = -2;
	sprite_index = sprLevandoDano;
	image_blend = c_red;
		
	danoTimer--;
	//show_debug_message( danoTimer);
	
	if(danoTimer <= 0){		
		dano = false;
		image_blend = c_white;			
		danoTimer = room_speed / 4;	
		vidaPlayer--;
	}	
}

//show_debug_message(image_xscale)