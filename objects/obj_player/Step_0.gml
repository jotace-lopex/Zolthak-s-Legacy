// Variáveis de controle de entrada
if (global.is_paused) {
    // Impede o movimento ou outras ações enquanto o jogo estiver pausado
    exit;
}

if (show_level_up_message) 
{
    level_up_timer -= 1;
    if (level_up_timer <= 0) 
    {
        show_level_up_message = false; // Desativa a mensagem
    }
}

//checando se o objeto transição existe
if (instance_exists(obj_transicao)) exit;

var _chao = place_meeting(x, y + 1, obj_block);

// Entrada do jogador controles
right = keyboard_check(ord("D")) || keyboard_check(vk_right);
left = keyboard_check(ord("A")) || keyboard_check(vk_left);
jump = keyboard_check_pressed(vk_space);
attack = keyboard_check(ord("J")) || keyboard_check(vk_numpad0);
dash = keyboard_check_pressed(ord("K")) || keyboard_check_pressed(vk_shift);
skill = keyboard_check_pressed(ord("U")) || keyboard_check_pressed(vk_numpad1);
down = keyboard_check(ord("S")) || keyboard_check(vk_down);

//controlando invencibilidade
if (invencivel && tempo_invencivel > 0)
{
	tempo_invencivel--;
	image_alpha = max(sin(get_timer()/100000), 0.2);
}
else
{
	invencivel = false;
	image_alpha = 1;
}

// Verifica se o jogador pode conjurar
if (power_up_skill && skill && estado != "morto" && estado != "dash" && estado != "pulando" && estado != "conjurando" &&
energia_atual >= custo_kaise_beam)
{
    estado = "conjurando";
}

// Buff de ataque que diminui ao longo do tempo
if(ataque_buff > 0) ataque_buff -= 1;

// Reduzindo o cooldown do dash
if (dash_cooldown > 0) 
{
    dash_cooldown--;
}

// Verificando a recarga de estamina
if (estamina_atual < estamina_max) 
{
    estamina_recarregando++;  // Incrementa o temporizador de recarga a cada Step
    if (estamina_recarregando >= room_speed * 4) 
	{
        estamina_atual++;           // Recupera 1 ponto de estamina
        estamina_recarregando = 0;  // Reinicia o temporizador
    }
} 
else 
{
    estamina_recarregando = 0;  // Reseta o temporizador se a estamina está cheia
}


// Verificando a recarga de energia
if (energia_atual < energia_max) 
{
    energia_recarregando++;  // Incrementa o temporizador de recarga a cada Step
    if (energia_recarregando >= room_speed * 4) 
	{  // A cada 1 segundo (room_speed passos)
        energia_atual++;           // Recupera 1 ponto de estamina
        energia_recarregando = 0;  // Reinicia o temporizador
    }
} 
else 
{
    energia_recarregando = 0;  // Reseta o temporizador se a estamina está cheia
}


// Lógica do dash (consome estamina)
if (dash && dash_cooldown <= 0 && estamina_atual > 0 && estado != "morto" && estado != "conjurando") 
{
    if (right || left) 
	{
		screenshake(2);
        estado = "dash";
        dash_timer = dash_duration;
        dash_cooldown = 30;   // Tempo de recarga para o dash
        estamina_atual -= 1;  // Consome 1 ponto de estamina
    }
}

// Aplicando a gravidade
if (!_chao) 
{
    if (velv < max_velv * 2) 
	{
        velv += GRAVIDADE * massa * global.vel_mult;
    }
}

velh = (right - left) * max_velh * global.vel_mult;

// Código de movimentação (não se aplica durante o dash)
if (estado != "dash")
{
    velh = (right - left) * max_velh * global.vel_mult;
}

// Máquina de estados (movimento, pulo, ataque, dash, etc.)
switch (estado) 
{
	#region parado
    case "parado": 
	{
        sprite_index = spr_player_parado;

        if (velh != 0) 
		{
            estado = "movendo";
        } 
		else if (jump || velv != 0) 
		{
            estado = "pulando";
            velv = (-max_velv * jump);
            image_index = 0;
        } 
		else if (attack) 
		{
            incia_ataque(_chao);
        } 
		else if (dash && dash_cooldown <= 0 && estamina_atual > 0) 
		{
			if (right || left)
			{
	            estado = "dash";
	            dash_timer = dash_duration;
	            dash_cooldown = 30; // Tempo de recarga para o dash
			}
        }
        break;
    }
	#endregion
	
	
	#region movendo
    case "movendo": 
	{
        sprite_index = spr_player_correndo;
		if (!passos_som && _chao)
			{
				if (global.sound_effects_on) 
				{
	                audio_play_sound(snd_player_passos, 2, true, 4);	
	            }
				passos_som = true;
			}
		

        if (abs(velh) < .1) 
		{
            estado = "parado";
            velh = 0;
        } 
		else if (jump || velv != 0) 
		{
            estado = "pulando";
            velv = (-max_velv * jump);
            image_index = 0;
        } 
		else if (attack) 
		{
            incia_ataque(_chao);
        } 
		else if (dash && dash_cooldown <= 0 && estamina_atual > 0) 
		{
            estado = "dash";
            dash_timer = dash_duration;
            dash_cooldown = 30;
        }
		
	    if (rastro_timer <= 0) 
			{
		        var _rastro = instance_create_layer(x, y, layer, obj_rastro_run);
		        _rastro.image_alpha = 0.5;                 // Inicia com opacidade máxima
		        _rastro.image_blend = c_red;              // Cor inicial do rastro
		        _rastro.x = lerp(_rastro.x, x, 0.5);        // Suavizando a posição inicial usando lerp
		        _rastro.y = lerp(_rastro.y, y, 0.5);
        
		        // Reseta o temporizador para que o rastro seja criado novamente depois de alguns steps
		        rastro_timer = 3;  // Ajuste para espaçar o rastro
		    } 
		else 
			{
		        rastro_timer--;   // Reduzindo o temporizador
		    }
        break;
    }
	#endregion
	
	
	
	#region pulando
    case "pulando": 
	{
        if (velv > 0) 
		{
            sprite_index = spr_player_caindo;
        } 
		else 
		{
            sprite_index = spr_player_pulo;
            if (image_index >= image_number - 1) 
			{
                image_index = image_number - 1;
            }
			if (!pulo_som)
			{
				if (global.sound_effects_on) 
				{
			        var _som_escolhido = choose(snd_player_pulo, snd_player_pulo_1);
			        audio_play_sound(_som_escolhido, 2, false, 1);
	            }
				pulo_som = true;
			}
        }
		
		//condição de troca de estado
		if (attack)
		{
			incia_ataque(_chao);
		}

         // Verifica se o jogador está no chão
	    if (_chao) 
		{
	        estado = "parado";
	        velv = 0;
	        pulos_restantes = 1; // Resetar pulos restantes ao tocar o chão
	    }
	
		else 
		{
	        // Se não estiver no chão, verifique se pode pular novamente
	        if (jump && pulos_restantes > 0 && pulo_duplo_power_up) 
			{
				screenshake(2);
	            // Pulo duplo
	            velv = -max_velv; // Ajuste para a velocidade do pulo
	            pulos_restantes -= 1; // Reduzir o número de pulos restantes
	        }
	    }
		
		// --- Início do código para rastro ---
	    // Reduzindo o temporizador do rastro
	    if (rastro_timer <= 0) 
			{
				if (velv > 0) 
				{
			        var _rastro = instance_create_layer(x, y, layer, obj_rastro_jump);
			        _rastro.image_alpha = 0.5;
			        _rastro.image_blend = c_red;
			        _rastro.x = lerp(_rastro.x, x, 0.5);
			        _rastro.y = lerp(_rastro.y, y, 0.5);
			        rastro_timer = 1;  // espaçar o rastro
				}
				
				if (velv <= 0)
				{
					var _rastro = instance_create_layer(x, y, layer, obj_rastro_fall);
			        _rastro.image_alpha = 0.5;
			        _rastro.image_blend = c_red;
			        _rastro.x = lerp(_rastro.x, x, 0.5);
			        _rastro.y = lerp(_rastro.y, y, 0.5);
			        rastro_timer = 1;  // espaçar o rastro
				}
		    } 
		else 
			{
		        rastro_timer--;   // Reduzindo o temporizador
		    }
			if (estado != "pulando") 
			{
				audio_stop_sound(snd_player_passos)
				pulo_som = false;
			}
        break;
    }
	#endregion
	
	#region ataque aereo down
	
	case "ataque aereo down":
	{
		velh = 0;
		velv += .4;
		if (!ataque_down)
		{
			sprite_index = spr_player_ataque_ar_down_ready
			image_index = 0;
			ataque_down = true;
		}
		
		//indo para o loop
		if (sprite_index == spr_player_ataque_ar_down_ready)
		{
			if (image_index > .07)
			{
				sprite_index = spr_player_ataque_ar_down_loop;
				image_index = 0;
			}
		}
		
		//encerrando animação
		if (_chao)
		{
			if (sprite_index != spr_player_ataque_ar_down_end)
			{
				sprite_index = spr_player_ataque_ar_down_end;
				image_index = 0;
				
				//criando o screenshake direcional
				screenshake(10, true, 270);
			}
			else
			{
				if(image_index >= image_number - .2)
				{
					estado = "parado";
					ataque_down = false;
					finaliza_ataque();
				}
			}
		}
		
		//criando o dano
		if (sprite_index == spr_player_ataque_ar_down_ready && dano == noone && posso) 
		{
            dano = instance_create_layer(x + sprite_width/1.5 + velh * 2, y - sprite_height/2.1, layer, obj_dano);
            dano.dano = ataque;
            dano.pai = id;
            posso = false;
			dano.morrer = false;
        }
		
		break;
	}
	
	#endregion
	
	#region ataque aereo
	case "ataque aereo":
	{
		//checando se troquei de sprite
		if (sprite_index != spr_player_ataque_ar1)
		{
			sprite_index = spr_player_ataque_ar1;
			image_index = 0;
		}
		if (!ataque_ar_som)
			{
				if (global.sound_effects_on) 
				{
	                audio_play_sound(snd_player_atk_1, 2, false, 2);
					audio_play_sound(snd_slash_1, 2, false, 1);
				
	            }
				ataque_ar_som = true;
			}
		
		// Criando objeto dano
        if (image_index >= 1 && dano == noone && posso) 
		{
            dano = instance_create_layer(x + sprite_width/2.7 + velh * 2, y - sprite_height/2.1, layer, obj_dano);
            dano.dano = ataque;
            dano.pai = id;
            posso = false;
        }
		
		//saindo do estado
		if (image_index >= image_number - 1)
		{
			estado = "pulando";
			finaliza_ataque();
		}
		if (_chao)
		{
			estado = "parado";
			posso = true;
            if (dano) 
			{
                instance_destroy(dano, false);
                dano = noone;
            }
		}
		if (estado != "ataque aereo") 
			{
			    ataque_ar_som = false;
			}
		
		break;
	}
	#endregion

	
	#region ataque
    case "ataque": 
	{
        velh = 0;

        if (combo == 0) 
		{
            sprite_index = spr_player_ataque1;
			if (!ataque1_som)
			{
				if (global.sound_effects_on) 
				{
	                audio_play_sound(snd_player_atk_1, 2, false, 2);
					audio_play_sound(snd_slash_1, 2, false, 1);
				
	            }
				ataque1_som = true;
			}
        } 
		else if (combo == 1) 
		{
            sprite_index = spr_player_ataque2;
			if (!ataque2_som)
			{
				if (global.sound_effects_on) 
				{
	                audio_play_sound(snd_player_atk_2, 2, false, 2);
					audio_play_sound(snd_slash_2, 2, false, 1);
				
	            }
				ataque2_som = true;
			}
        } else if (combo == 2) 
		{
            sprite_index = spr_player_ataque3;
			if (!ataque3_som)
			{
				if (global.sound_effects_on) 
				{
	                audio_play_sound(snd_player_atk_3, 2, false, 2);
					audio_play_sound(snd_slash_3, 2, false, 1);
				
	            }
				ataque3_som = true;
			}
        }

        // Criando objeto dano
        if (image_index >= 2 && dano == noone && posso) 
		{
            dano = instance_create_layer(x + sprite_width/2.7, y - sprite_height/2.1, layer, obj_dano);
            dano.dano = ataque * ataque_mult;
            dano.pai = id;
            posso = false;
        }

        // Configurando com buff
        if (attack && combo < 2) 
		{
            ataque_buff = room_speed;
        }

        if (ataque_buff && combo < 2 && image_index >= image_number - 1) 
		{
            combo++;
            image_index = 0;
            posso = true;
            ataque_mult += .7;
            if (dano) 
			{
                instance_destroy(dano, false);
                dano = noone;
            }
            // Zerando o buffer
            ataque_buff = 0;
        }

        if (image_index >= image_number - 1) 
		{
            estado = "parado";
            velv = 0;
            combo = 0;
            posso = true;
            ataque_mult = 1;
            finaliza_ataque();
        }

        if (dash && dash_cooldown <= 0 && estamina_atual > 0) 
		{
			if (right || left)
			{
	            estado = "dash";
	            dash_timer = dash_duration;
	            dash_cooldown = 30;
			}
        }

        if (velv != 0) {
            estado = "pulando";
            image_index = 0;
        }
		
		if (estado != "ataque") 
			{
			    ataque1_som = false;
				ataque2_som = false;
				ataque3_som = false;// Permite que o som toque novamente na próxima conjuração
			}
        break;
    }
	#endregion
	
	
	#region dash
    case "dash": 
	{
        dash_timer--; // Reduzindo o tempo do dash

        // Definindo a direção e velocidade do dash
        if (right) 
		{
            velh = dash_speed;
        } 
		else if (left) 
		{
            velh = -dash_speed;
        }

        // Criando o rastro do dash
        if (dash_timer % 2 == 0) 
		{
            var _rastro = instance_create_layer(x, y, layer, obj_rastro_dash);
            _rastro.image_alpha = 0.9;
            _rastro.image_blend = c_red; // Cor do rastro
			_rastro.x = lerp(_rastro.x, x, 0.5);
			_rastro.y = lerp(_rastro.y, y, 0.5);
        }

        // Fim do dash
        if (dash_timer <= 0) 
		{
            estado = "parado";
            velh = 0;
        }
        break;
    }
	#endregion
	
	
	#region hit
	case "hit":
	{
	    if (sprite_index != spr_player_machucado)
	    {
	        sprite_index = spr_player_machucado;
			conjurando_som_tocado = true;
	        image_index = 0;
	        screenshake(4);
			if (!hit_som)
			{
				if (global.sound_effects_on) 
				{
	                audio_play_sound(snd_player_hit, 2, false, 5);
			        var _som_escolhido = choose(snd_enemy_hitting_1, snd_enemy_hitting_2, snd_enemy_hitting_3);
			        audio_play_sound(_som_escolhido, 2, false, 2);
				
	            }
				hit_som = true;
			}
			
			//deixando o player invencivel
			invencivel = true;
			tempo_invencivel = invencivel_timer;
	    }

	    ataque_down = false;

	    // Imobiliza o jogador
	    velh = 0;

	    // Cancela o Kaiser Beam se estiver ativo
	    if (instance_exists(obj_skill_kaiser_beam))
	    {
	        instance_destroy(obj_skill_kaiser_beam);
	    }
	    if (dano != noone)
	    {
	        instance_destroy(dano);
	        dano = noone;
	    }

	    // Verifica se o jogador deve sair do estado "hit"
	    if (vida_atual > 0)
	    {
	        if (image_index >= image_number - 1)
	        {
	            estado = "parado";
	        }
	    }
	    else
	    {
	        if (image_index >= image_number - 1)
	        {
	            estado = "morto";
	        }
	    }
		if (estado != "hit") 
			{
			    hit_som = false;
			}
	    break;
	}
	#endregion
	
	
	#region morto
	case "morto":
	{
		//Chegando se o objeto existe
		if (instance_exists(obj_game_controller))
		{
			with(obj_game_controller)
			{
				game_over = true;
			}
		}
		
		velh = 0;
		if (sprite_index != spr_player_morto)
		{
			image_index = 0;
			sprite_index = spr_player_morto;
		}
		
		if (image_index >= image_number -1)
		{
			image_index = image_number -1;
		}
		break;
	}
	#endregion
	
	#region conjurando
	case "conjurando":
	{
		if (!conjurando_som_tocado) 
		{
		    if (global.sound_effects_on) 
		    {
		        // Escolhe aleatoriamente um dos dois sons
		        var _som_escolhido = choose(snd_add_eu_vou_destruir_tudo, snd_player_skill_alt);
		        audio_play_sound(_som_escolhido, 2, false, 2);
		    }
		    conjurando_som_tocado = true; // Marca que o som foi tocado
		}

    // Verifica se o jogador está no estado "parado" e em contato com o chão
    if (_chao) 
    {
        velh = 0; // Imobiliza o jogador enquanto está conjurando

        // Configura o sprite de conjuração
        if (sprite_index != spr_player_cast) 
        {
            sprite_index = spr_player_cast; // Define o sprite de conjuração
            image_index = 0; // Inicia a animação do início
			screenshake(3);
        }

        // Criando o obj_skill_kaiser_beam no início da conjuração
        if (image_index == 0 && !instance_exists(obj_skill_kaiser_beam)) 
        {
            var _beam = instance_create_layer(x + sprite_width / 0.9, y - sprite_height / 1.5, "Inst_Skills", obj_skill_kaiser_beam);
            _beam.image_xscale = image_xscale; // A escala segue a direção do player
            _beam.image_xscale = 1;
            _beam.image_yscale = 1;
			screenshake(4);
			
			if (global.sound_effects_on) {
				sound_effect = audio_play_sound(snd_basicbeam_fire, 2, false);
			}
        }

        // Criando o obj_dano com base nos frames do obj_skill_kaiser_beam
        if (obj_skill_kaiser_beam.image_index >= 18 && obj_skill_kaiser_beam.image_index < 68 && dano == noone) 
        {
            // Criar o obj_dano com a mesma posição e tamanho do obj_skill_kaiser_beam
            dano = instance_create_layer(x + sprite_width / 0.089, y - sprite_height / 1.4, layer, obj_dano);
            dano.dano = ataque/3; // Define o dano com base no ataque do player
            dano.pai = id; // Define o dono do dano como o player

            dano.image_xscale = 11; // Copia a escala horizontal do beam
            dano.image_yscale = 1.4; // Copia a escala vertical do beam
			screenshake(6);
        }

        // Destruindo o obj_dano no frame correto (entre 29 e 43)
        if (dano != noone && obj_skill_kaiser_beam.image_index >= 68) 
        {
            instance_destroy(dano);
            dano = noone;
			screenshake(5);
        }

        // Finalizando a conjuração
        if (obj_skill_kaiser_beam.image_index >= obj_skill_kaiser_beam.image_number - 1) 
        {
            estado = "parado"; // Retorna ao estado normal após a conjuração
			energia_atual -= custo_kaise_beam;
        }
	    }
	    else
	    {
	        // Caso não tenha energia suficiente, retorna ao estado "parado" sem fazer a conjuração
	        estado = "parado"; 
	    }
		// Resetar conjurando_som_tocado se o estado mudar
		if (estado != "conjurando") 
		{
		    conjurando_som_tocado = false; // Permite que o som toque novamente na próxima conjuração
		}

	    break;
	}
	
	#endregion
	
	


	
	//Estado padrão PARADO
	default:
	{
		estado = "parado";
	}
	
}

//Garantir que o som possa ser tocado novamente caso seja interrompido durante o estado conjurando
if (estado != "conjurando") 
	{
		conjurando_som_tocado = false; // Permite que o som toque novamente na próxima conjuração
	}
	
if (estado != "movendo" || !_chao || estado = "morto") 
		{
			audio_stop_sound(snd_player_passos)
			passos_som = false;
		}