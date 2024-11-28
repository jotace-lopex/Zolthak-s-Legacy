/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


if (obj_player.pulo_duplo_power_up = false)
{
	obj_player.pulo_duplo_power_up = true;
	
}

if (!get_item_som)
	{
		if (global.sound_effects_on) 
		{
		    audio_play_sound(snd_get_item, 2, false, 4);	
		}
		get_item_som = true;
	}

if (get_item_som) 
		{
			get_item_som = false;
		}
	
instance_destroy();