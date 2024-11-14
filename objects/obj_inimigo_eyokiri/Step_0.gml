/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
//EYOKIRI

var _chao = place_meeting(x, y + 1, obj_block);

if (!_chao)
{
	velv += GRAVIDADE * massa;
	
}

if (mouse_check_button_pressed(mb_right))
{
	estado = "attack";
}


switch(estado)
{
	case"parado":
	{
		velh = 0;
		timer_estado++;
		if(sprite_index != spr_inimigo_eyokiri_parado)
		{
			image_index = 0;
		}
		sprite_index = spr_inimigo_eyokiri_parado;
		
		//Condição de troca de estado
		if (position_meeting(mouse_x, mouse_y, self))
		{
			if(mouse_check_button_pressed(mb_right))
			{
				estado = "hit";
			}
		}
		
		//indo para o estado de patrulha
		if (irandom(timer_estado) > 300)
		{
			estado = choose("walk", "parado", "walk");
			timer_estado = 0;
		}
		scr_ataca_player_melee(obj_player, dist, xscale);
		
		break;
	}
	
	case "walk":
	{
		timer_estado++;
		if (sprite_index != spr_inimigo_eyokiri_andando)
		{
			image_index = 0;
			velh = choose (1, -1);
		}
		sprite_index = spr_inimigo_eyokiri_andando
		
		//condição de saída do estado
		if (irandom(timer_estado) > 300)
		{
			estado = choose("parado", "parado", "walk");
			timer_estado = 0;
		}
		scr_ataca_player_melee(obj_player, dist, xscale);
		
		break;
	}
	
	case"hit":
	{
		if (sprite_index != spr_inimigo_eyokiri_dano)
		{
			//Iniciando o que for preciso para esse estado
			image_index = 0;
			//vida_atual--;
		}
		sprite_index = spr_inimigo_eyokiri_dano;
		
		//Condição para sair de estado
		if (image_index > image_number-1)
		{
			//Checando se ainda tem vida
			if (vida_atual > 0)
			{
				estado = "parado";
			}
			else if (vida_atual <= 0)
			{
				estado = "morto";
			}
		}
		break;
	}
	
	case"attack":
	{
		velh = 0;
		if (sprite_index != spr_inimigo_eyokiri_atq)
		{
			image_index = 0;
		}
		sprite_index = spr_inimigo_eyokiri_atq;
		
		if (image_index > image_number-1)
		{
			estado = "parado";
		}
		
		//criando o dano
		if (image_index >= 1 && dano == noone && image_index < 2)
		{
			dano = instance_create_layer(x + sprite_width/2, y - sprite_height/2, layer, obj_dano);
			dano.dano = ataque;
			dano.pai = id;
		}
		
		//Destruindo o dano
		if (dano != noone && image_index >= 3)
		{
			instance_destroy(dano);
			dano = noone;
		}
		
		//Saindo do estado
		
		break;
	}
	
	case"morto":
	{
		if (sprite_index != spr_inimigo_eyokiri_morte)
		{
			//Iniciando o que for preciso para esse estado
			image_index = 0; 
		}
		sprite_index = spr_inimigo_eyokiri_morte;
		
		if (image_index > image_number-1)
		{
			image_speed = 0;
			image_alpha -= .01;
			
			if (image_alpha <= 0) 
			{
				if (irandom(99) < 30) 
				{
					instance_create_layer(x + sprite_width/7, y - sprite_height/2.5, layer, obj_drop_servo);
				}
			instance_destroy();
			}
		}
	}
}