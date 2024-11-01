// Evento Step

// Iniciando variáveis de controle
var right, left, jump, attack, dash;
var chao = place_meeting(x, y + 1, obj_block);

// Entrada do jogador
right = keyboard_check(ord("D"));
left = keyboard_check(ord("A"));
jump = keyboard_check_pressed(vk_space);
attack = keyboard_check_pressed(ord("J"));
dash = keyboard_check_pressed(ord("K"));

// Aplicando gravidade
if (!chao) {
    if (velv < max_velv * 2) {
        velv += GRAVIDADE * massa;
    }
}

// Código de movimentação (não se aplica durante o dash)
if (estado != "dash") {
    velh = (right - left) * max_velh;
}

// Iniciando a máquina de estados
switch (estado) {
    case "parado": {
        sprite_index = spr_player_parado1;

        if (right || left) {
            estado = "movendo";
        } else if (jump || velv != 0) {
            estado = "pulando";
            velv = (-max_velv * jump);
            image_index = 0;
        } else if (attack) {
            estado = "ataque";
            velh = 0;
            image_index = 0;
        } else if (dash && dash_cooldown <= 0) {
            estado = "dash";
            dash_timer = dash_duration;
            dash_cooldown = 30; // Tempo de recarga para o dash
        }
        break;
    }

    case "movendo": {
        sprite_index = spr_player_correndo;

        if (abs(velh) < .1) {
            estado = "parado";
            velh = 0;
        } else if (jump) {
            estado = "pulando";
            velv = -max_velv;
            image_index = 0;
        } else if (attack) {
            estado = "ataque";
            velh = 0;
            image_index = 0;
        } else if (dash && dash_cooldown <= 0) {
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

        if (chao) {
            estado = "parado";
            velv = 0;
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

        if (attack && combo < 2 && image_index >= image_number - 2) {
            combo++;
            image_index = 0;
        }

        if (image_index > image_number - 1) {
            estado = "parado";
            velv = 0;
            combo = 0;
        }
        break;
    }

    case "dash": {
        dash_timer--;

        // Definindo a direção e velocidade do dash
        if (right) {
            velh = dash_speed;
        } else if (left) {
            velh = -dash_speed;
        }

        // Criando o rastro do dash
        if (dash_timer % 2 == 0) {
            var rastro = instance_create_layer(x, y, layer, obj_rastro);
            rastro.image_alpha = 0.5;
            rastro.image_blend = c_red; // Cor do rastro
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