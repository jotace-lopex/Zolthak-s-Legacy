// Variáveis de controle de entrada
var _right, _left, _jump, _attack, _dash;
var _chao = place_meeting(x, y + 1, obj_block); // Verificação de chão

// Entrada do jogador
_right = keyboard_check(ord("D"));
_left = keyboard_check(ord("A"));
_jump = keyboard_check_pressed(vk_space);
_attack = keyboard_check_pressed(ord("J"));
_dash = keyboard_check_pressed(ord("K"));

// Buff de ataque que diminui ao longo do tempo
if(ataque_buff > 0) ataque_buff -= 1;

// Verificando a recarga de estamina
if (estamina_atual < estamina_max) {
    estamina_recarregando++;  // Incrementa o temporizador de recarga a cada Step
    if (estamina_recarregando >= room_speed * 4) {  // A cada 1 segundo (room_speed passos)
        estamina_atual++;           // Recupera 1 ponto de estamina
        estamina_recarregando = 0;  // Reinicia o temporizador
    }
} else {
    estamina_recarregando = 0;  // Reseta o temporizador se a estamina está cheia
}

// Lógica do dash (consome estamina)
if (_dash && dash_cooldown <= 0 && estamina_atual > 0) {
    if (_right || _left) {
        estado = "dash";
        dash_timer = dash_duration;
        dash_cooldown = 30;   // Tempo de recarga para o dash
        estamina_atual -= 1;  // Consome 1 ponto de estamina
    }
}

// Aplicando a gravidade
if (!_chao) {
    if (velv < max_velv * 2) {
        velv += GRAVIDADE * massa;
    }
}

// Código de movimentação (não se aplica durante o dash)
if (estado != "dash") {
    velh = (_right - _left) * max_velh; // Movimentação horizontal
}

// Máquina de estados (movimento, pulo, ataque, dash, etc.)
switch (estado) {
    case "parado": {
        sprite_index = spr_player_parado;

        if (_right || _left) {
            estado = "movendo";
        } else if (_jump || velv != 0) {
            estado = "pulando";
            velv = (-max_velv * _jump);
            image_index = 0;
        } else if (_attack) {
            estado = "ataque";
            velh = 0;
            image_index = 0;
        } else if (_dash && dash_cooldown <= 0 && estamina_atual > 0) {
			if (_right || _left)
			{
	            estado = "dash";
	            dash_timer = dash_duration;
	            dash_cooldown = 30; // Tempo de recarga para o dash
			}
        }
        break;
    }

    case "movendo": {
        sprite_index = spr_player_correndo;

        if (abs(velh) < .1) {
            estado = "parado";
            velh = 0;
        } else if (_jump || velv != 0) {
            estado = "pulando";
            velv = (-max_velv * _jump);
            image_index = 0;
        } else if (_attack) {
            estado = "ataque";
            velh = 0;
            image_index = 0;
        } else if (_dash && dash_cooldown <= 0 && estamina_atual > 0) {
            estado = "dash";
            dash_timer = dash_duration;
            dash_cooldown = 30;
        }
        break;
    }

    case "pulando": {
        if (velv > 0) {
            sprite_index = spr_player_caindo;
        } else {
            sprite_index = spr_player_pulo;
            if (image_index >= image_number - 1) {
                image_index = image_number - 1;
            }
        }

        if (_chao) {
            estado = "parado";
            velv = 0;
        }

        if (_dash && dash_cooldown <= 0 && estamina_atual > 0) {
			if (_right || _left)
			{
	            estado = "dash";
	            dash_timer = dash_duration;
	            dash_cooldown = 30;
			}
        }
        break;
    }

    case "ataque": {
        velh = 0;

        if (combo == 0) {
            sprite_index = spr_player_ataque1;
        } else if (combo == 1) {
            sprite_index = spr_player_ataque2;
        } else if (combo == 2) {
            sprite_index = spr_player_ataque3;
        }

        // Criando objeto dano
        if (image_index >= 2 && dano == noone && posso) {
            dano = instance_create_layer(x + sprite_width/2.7, y - sprite_height/2.1, layer, obj_dano);
            dano.dano = ataque * ataque_mult;
            dano.pai = id;
            posso = false;
        }

        // Configurando com buff
        if (_attack && combo < 2) {
            ataque_buff = room_speed;
        }

        if (ataque_buff && combo < 2 && image_index >= image_number - 1) {
            combo++;
            image_index = 0;
            posso = true;
            ataque_mult += .7;
            if (dano) {
                instance_destroy(dano, false);
                dano = noone;
            }
            // Zerando o buffer
            ataque_buff = 0;
        }

        if (image_index >= image_number - 1) {
            estado = "parado";
            velv = 0;
            combo = 0;
            posso = true;
            ataque_mult = 1;
            if (dano) {
                instance_destroy(dano, false);
                dano = noone;
            }
        }

        if (_dash && dash_cooldown <= 0 && estamina_atual > 0) {
			if (_right || _left)
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
        break;
    }

    case "dash": {
        dash_timer--; // Reduzindo o tempo do dash

        // Definindo a direção e velocidade do dash
        if (_right) {
            velh = dash_speed;
        } else if (_left) {
            velh = -dash_speed;
        }

        // Criando o rastro do dash
        if (dash_timer % 2 == 0) {
            var _rastro = instance_create_layer(x, y, layer, obj_rastro);
            _rastro.image_alpha = 0.5;
            _rastro.image_blend = c_red; // Cor do rastro
        }

        // Fim do dash
        if (dash_timer <= 0) {
            estado = "parado";
            velh = 0;
        }
        break;
    }
}

// Reduzindo o cooldown do dash
if (dash_cooldown > 0) {
    dash_cooldown--;
}