/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


if (obj_player.power_up_skill = false)
{
	obj_player.power_up_skill = true;
	
}

virtual_key_add(1050, 450, 90, 90, vk_numpad1);

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