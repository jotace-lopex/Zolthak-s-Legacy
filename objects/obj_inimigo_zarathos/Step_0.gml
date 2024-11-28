/// @description Comportamento do inimigo Igneez com perseguição ao jogador

var _chao = place_meeting(x, y + 1, obj_block);

if (!_chao)
{
    velv += GRAVIDADE * massa; // Adiciona gravidade caso não esteja no chão
}

if (cooldown_ataque2 > 0)
{
    cooldown_ataque2--; // Decrementa o cooldown
}

switch (estado)
{
    case "patrulha":
    {
        // Se o inimigo estiver tomando dano, não muda de estado
        if (estado != "hit")
        {
            if (tempo_recuperacao > 0)
            {
                tempo_recuperacao--;
                velh = 0;
                sprite_index = spr_inimigo_zarathos_parado;
            }
            else
            {
                velh = 0;
                timer_estado++;

                var _distancia_jogador = point_distance(x, y, obj_player.x, obj_player.y);
                if (_distancia_jogador < distancia_visao)
                {
                    // Prioriza ataque2 se cooldown zerado
                    if (cooldown_ataque2 <= 0)
                    {
                        estado = "ataque2";
                    }
                    else 
                    {
                        estado = "seguir_jogador";
                    }
                }

                tempo_patrol++;
                if (tempo_patrol >= tempo_patrol_max)
                {
                    tempo_patrol = 0;
                    sentido_patrulha = -sentido_patrulha;
                }

                if (sentido_patrulha == 1)
                {
                    x += velocidade_patrulha;
                }
                else if (sentido_patrulha == -1)
                {
                    x -= velocidade_patrulha;
                }

                xscale = (sentido_patrulha == 1) ? 1 : -1;
                sprite_index = spr_inimigo_zarathos_correndo;
            }
        }
        break;
    }

    case "seguir_jogador":
    {
        // Se o inimigo estiver tomando dano, não muda de estado
        if (estado != "hit")
        {
            var _distancia_jogador = point_distance(x, y, obj_player.x, obj_player.y);

            if (_distancia_jogador > distancia_ataque)
            {
                // Move o inimigo em direção ao jogador
                var _dir_x = (obj_player.x - x) / _distancia_jogador;
                var _dir_y = (obj_player.y - y) / _distancia_jogador;

                x += _dir_x * velocidade;
                y += _dir_y * velocidade;

                xscale = (_dir_x > 0) ? 1 : -1;
                sprite_index = spr_inimigo_zarathos_andando;
            }
            else
            {
                // Prioriza ataque2 caso cooldown esteja zerado
                if (cooldown_ataque2 <= 0)
                {
                    estado = "ataque2";
                }
                else
                {
                    // Realiza ataque normal se o inimigo estiver perto
                    estado = "attack";
                }
            }
        }
        break;
    }

    case "attack":
    {
        // Se o inimigo estiver tomando dano, não muda de estado
        if (estado != "hit")
        {
            if (!atacando)
            {
                obj_inimigo_zarathos.atacando = true;
                tempo_ataque = 0;
            }

            velh = 0;
            if (sprite_index != spr_inimigo_zarathos_atk)
            {
                image_index = 0;
                posso = true;
                dano = noone;
            }
            sprite_index = spr_inimigo_zarathos_atk;
			if (!atq1_som)
			{
				if (global.sound_effects_on) 
				{
		            audio_play_sound(snd_boss_slash, 2, false, 3);
		        }
				atq1_som = true;
			}
			

            tempo_ataque++;

            if (image_index >= 4 && dano == noone && image_index < 8 && posso)
            {
                dano = instance_create_layer(x + sprite_width / 4.5, y - sprite_height / 3, layer, obj_dano);
                dano.dano = ataque;
                dano.pai = id;
                dano.image_xscale = 1.5;
                dano.image_yscale = 1.5;
                posso = false;
            }

            if (dano != noone && image_index >= 11)
            {
                instance_destroy(dano);
                dano = noone;
            }

            if (image_index >= image_number - 1)
            {
                atacando = false;
                tempo_recuperacao = tempo_recuperacao_max;
                estado = "patrulha";
            }
        }
        break;
    }

    case "ataque2":
    {
        // Se o inimigo estiver tomando dano, não muda de estado
        if (estado != "hit")
        {
            if (!atacando)
            {
                obj_inimigo_zarathos.atacando = true;
                tempo_ataque = 0;
            }

            velh = 0;
            if (sprite_index != spr_inimigo_zarathos_atk_2)
            {
                image_index = 0;
                posso = true;
                dano = noone;
            }
            sprite_index = spr_inimigo_zarathos_atk_2;
			if (!atq2_som && image_index >= 11)
			{
				if (global.sound_effects_on) 
				{
	                audio_play_sound(snd_boss_slash, 2, false, 3);
				
	            }
				atq2_som = true;
			}

            tempo_ataque++;

            if (image_index >= 4 && dano == noone && image_index < 8 && posso)
            {
                dano = instance_create_layer(x + sprite_width / 4, y - sprite_height / 1.5, layer, obj_dano);
                dano.dano = ataque * 2; // Causa mais dano
                dano.pai = id;
                dano.image_xscale = 1.7;
                dano.image_yscale = 1.7;
                posso = false;
            }

            if (dano != noone && image_index >= 8)
            {
                instance_destroy(dano);
                dano = noone;
            }

            if (image_index >= image_number - 1)
            {
                atacando = false;
                cooldown_ataque2 = room_speed * 3; // Reseta cooldown (10 segundos)
                tempo_recuperacao = tempo_recuperacao_max;
                estado = "patrulha";
            }
        }
        break;
    }

    case "hit":
    {
		//Iniciando o meu delay
		delay = room_speed * 0;
		
		
        // Se o inimigo não estiver em "hit", ele pode voltar para outro estado
        velh = 0;
        if (sprite_index != spr_inimigo_zarathos_dano)
        {
           if (global.sound_effects_on) 
				{
			        var _som_escolhido = choose(snd_blade_hit_1, snd_blade_hit_2);
			        audio_play_sound(_som_escolhido, 2, false, 1);
				
	            }
				hit_som = true;
            // Iniciando a animação de dano
            image_index = 0;
			if (estado != "hit") 
			{
			    hit_som = false;
			}
        }
        sprite_index = spr_inimigo_zarathos_dano;

        if (image_index >= image_number - 1)
        {
            estado = (vida_atual > 0) ? "patrulha" : "morto";
        }
        break;
    }

    case "morto":
    {
        velh = 0;
        if (sprite_index != spr_inimigo_zarathos_morte)
        {
            image_index = 0;
            screenshake(10);
        }
        sprite_index = spr_inimigo_zarathos_morte;
		global.boss_zarathos_derrotado = true;
		// Incremento dos atributos apenas uma vez
	    if (obj_player.atributos_incrementados_1 = false)
	    {
	        obj_player.vida_max += 20;
	        obj_player.ataque += 1;
	        obj_player.energia_max += 4;
	        obj_player.estamina_max += 1;
			if (obj_player.level_up_som = false && global.sound_effects_on) 
			{
				audio_play_sound(snd_level_up, 2, false, 1);		
		    }
			obj_player.level_up_som = true;
			

	        obj_player.show_level_up_message_1 = true; // Exibir mensagem
	        obj_player.level_up_timer = room_speed * 3; // Mensagem por 3 segundos

	        obj_player.atributos_incrementados_1 = true; // Marca como incrementado
	    }
		
		if (obj_player.vida_atual != obj_player.vida_max) 
	        {
	            obj_player.vida_atual = obj_player.vida_max;
	        }
        if (image_index >= image_number - 1)
        {
            image_speed = 0;
            image_alpha -= 0.01;
			
			if (image_alpha <= 0) 
            {
                if (obj_player.power_up_skill = false)
				{				
	                instance_create_layer(x + sprite_width/7, y - sprite_height/2.5, layer, obj_drop_power_up_skill);
               
	                instance_destroy();
				}
            }

            if (image_alpha <= 0)
            {
                instance_destroy();
            }
        }
        break;
    }
}

if (obj_player.atributos_incrementados = true)
	{
		obj_player.level_up_som = false;
	}

if (estado != "attack") 
	{
		atq1_som = false; // Permite que o som toque novamente na próxima conjuração
	}

if (estado != "ataque2") 
	{
		atq2_som = false; // Permite que o som toque novamente na próxima conjuração
	}

if (delay > 0) delay--;