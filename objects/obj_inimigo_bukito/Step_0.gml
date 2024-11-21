/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
//KROLIUM

var _chao = place_meeting(x, y + 1, obj_block);

if (!_chao)
{
	velv += GRAVIDADE * massa;
	
}

//if (mouse_check_button_pressed(mb_right))
//{
//	estado = "attack";
//}


switch(estado)
{
	case"parado":
	{
		velh = 0;
		timer_estado++;
		if(sprite_index != spr_inimigo_bukito_parado)
		{
			image_index = 0;
		}
		sprite_index = spr_inimigo_bukito_parado;
		
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
		if (sprite_index != spr_inimigo_bukito_andando)
		{
			image_index = 0;
			velh = choose (1, -1);
		}
		sprite_index = spr_inimigo_bukito_andando
		
		//condição de saída do estado
		if (irandom(timer_estado) > 300)
		{
			estado = choose("parado", "walk", "walk");
			timer_estado = 0;
		}
		scr_ataca_player_melee(obj_player, dist, xscale);
		
		break;
	}
	
	case"hit":
	{
		velh = 0;
		if (sprite_index != spr_inimigo_bukito_dano)
		{
			//Iniciando o que for preciso para esse estado
			image_index = 0;
			//vida_atual--;
		}
		sprite_index = spr_inimigo_bukito_dano;
		
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
		if (sprite_index != spr_inimigo_bukito_atq)
		{
			image_index = 0;
			posso = true;
			dano = noone;
		}
		sprite_index = spr_inimigo_bukito_atq;
		
		if (image_index > image_number-1)
		{
			estado = "parado";
		}
		
		//criando o dano
		if (image_index >= 6 && dano == noone && image_index < 8)
		{
			dano = instance_create_layer(x + sprite_width/2, y - sprite_height/3, layer, obj_dano);
			dano.dano = ataque;
			dano.pai = id;
			// Define o tamanho específico do objeto de dano
		    dano.image_xscale = 1.2; // Altera a escala horizontal (2x maior)
		    dano.image_yscale = 1.2; // Altera a escala vertical (1.5x maior)
		}
		
		//Destruindo o dano
		if (dano != noone && image_index >= 8)
		{
			instance_destroy(dano);
			dano = noone;
		}
		
		//Saindo do estado
		
		break;
	}
	
	case"morto":
	{
		velh = 0;
		if (sprite_index != spr_inimigo_bukito_morte)
		{
			//Iniciando o que for preciso para esse estado
			image_index = 0; 
		}
		sprite_index = spr_inimigo_bukito_morte;
		
		if (image_index > image_number-1)
		{
			image_speed = 0;
			image_alpha -= .01;
			
			if (image_alpha <= 0) instance_destroy();
		}
	}	
}