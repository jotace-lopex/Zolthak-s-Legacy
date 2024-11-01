/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

var chao = place_meeting(x, y + 1, obj_block);

if (!chao)
{
	velv += GRAVIDADE * massa;
	
}

switch(estado)
{
	case"parado":
	{
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
				estado = "dano";
			}
		}
		break;
	}
	
	case"dano":
	{
		if (sprite_index != spr_inimigo_cthulu_dano)
		{
			//Iniciando o que for preciso para esse estado
			image_index = 0;
			vida_atual--;
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
			instance_destroy();
		}
	}
	

}