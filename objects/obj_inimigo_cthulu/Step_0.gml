/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

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
		if(sprite_index != spr_inimigo_cthulu_parado)
		{
			image_index = 0;
		}
		sprite_index = spr_inimigo_cthulu_parado;
		
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
		
		break;
	}
	
	case "walk":
	{
		timer_estado++;
		if (sprite_index != spr_inimigo_cthulu_andando)
		{
			image_index = 0;
			velh = choose (1, -1);
		}
		sprite_index = spr_inimigo_cthulu_andando
		
		//condição de saída do estado
		if (irandom(timer_estado) > 300)
		{
			estado = choose("parado", "parado", "walk");
			timer_estado = 0;
		}
		
		break;
	}
	
	case"hit":
	{
		if (sprite_index != spr_inimigo_cthulu_dano)
		{
			//Iniciando o que for preciso para esse estado
			image_index = 0;
			//vida_atual--;
		}
		sprite_index = spr_inimigo_cthulu_dano;
		
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
		if (sprite_index != spr_inimigo_cthulu_atq1)
		{
			image_index = 0;
		}
		sprite_index = spr_inimigo_cthulu_atq1;
		
		if (image_index > image_number-1)
		{
			estado = "parado";
		}
		
		//Saindo do estado
		
		break;
	}
	
	case"morto":
	{
		if (sprite_index != spr_inimigo_cthulu_morte)
		{
			//Iniciando o que for preciso para esse estado
			image_index = 0; 
		}
		sprite_index = spr_inimigo_cthulu_morte;
		
		if (image_index > image_number-1)
		{
			image_speed = 0;
			image_alpha -= .01;
			
			if (image_alpha <= 0) instance_destroy();
		}
	}
	

}