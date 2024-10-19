//Botões
botao_dir = keyboard_check(ord("D"));
botao_esq = keyboard_check(ord("A"));
botao_pular = keyboard_check_pressed(vk_space)

if botao_dir
{
	image_xscale = 1;
}
else if botao_esq
{
	image_xscale = -1;
}

//Movimento X
	//Direção
	dir_mov = botao_dir - botao_esq;

	//Receber velx
	velx = dir_mov * vel_mov;

	//Colisão X
	var _sub_pixel = .5;
	if place_meeting(x + velx, y, obj_chao)
	{
		//precisao na colisao com parede
		var _pixel_check = _sub_pixel * sign(velx);
		while !place_meeting(x + _pixel_check, y, obj_chao)
		{
			x += _pixel_check;
		}
	
		velx = 0;

	}

	//Mover x
	x += velx;
	
//Movimento Y
	//Gravidade
	vely += grav;
	
	//Pulo
	if botao_pular && place_meeting(x, y+1, obj_chao)
	{
		vely = vel_pulo;
	}
	
	//Colisao Y
	var _sub_pixel = .5;
	if place_meeting(x, y + vely, obj_chao)
	{
		//precisao na colisao com parede
		var _pixel_check = _sub_pixel * sign(vely);
		while !place_meeting(x, y + _pixel_check, obj_chao)
		{
			y += _pixel_check;
		}
		
		vely = 0;
	}
	
	//mover y
	y += vely





















