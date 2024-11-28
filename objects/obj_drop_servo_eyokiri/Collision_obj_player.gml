/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor



    // Somente cria o obj_servo_eyokiri se não existir outro objeto "obj_servo" na camada
if (obj_player.servo_eyokiri = false) 
{
    var _servo = instance_create_layer(obj_player.x, obj_player.y, layer, obj_servo_eyokiri);
    _servo.image_alpha = 0;
	obj_player.servo_eyokiri = true;
	obj_player.servo_oscalith = false;
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