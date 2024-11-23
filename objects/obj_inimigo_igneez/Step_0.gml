/// @description Comportamento do inimigo Igneez com perseguição ao jogador

if (global.is_paused) {
    // Impede a execução do restante do código, ou apenas a parte que você quer pausar
    exit;  // Faz o código da lógica não ser executado enquanto estiver pausado
}

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
        if (tempo_recuperacao > 0)
        {
            tempo_recuperacao--;
            velh = 0;
            sprite_index = spr_inimigo_igneez_parado;
        }
        else
        {
            velh = 0;
            timer_estado++;

            var _distancia_jogador = point_distance(x, y, obj_player.x, obj_player.y);
            if (_distancia_jogador < distancia_visao)
            {
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
            sprite_index = spr_inimigo_igneez_andando;
        }
        break;
    }

    case "seguir_jogador":
    {
        var _distancia_jogador = point_distance(x, y, obj_player.x, obj_player.y);

        if (_distancia_jogador > distancia_ataque)
        {
            var _dir_x = (obj_player.x - x) / _distancia_jogador;
            var _dir_y = (obj_player.y - y) / _distancia_jogador;

            x += _dir_x * velocidade;
            y += _dir_y * velocidade;

            xscale = (_dir_x > 0) ? 1 : -1;
            sprite_index = spr_inimigo_igneez_andando;
        }
        else
        {
            if (cooldown_ataque2 <= 0)
            {
                estado = "ataque2";
            }
            else
            {
                estado = "attack";
            }
        }
        break;
    }

    case "attack":
    {
        if (!atacando)
        {
            atacando = true;
            tempo_ataque = 0;
        }

        velh = 0;

        if (sprite_index != spr_inimigo_igneez_atq)
        {
            image_index = 0;
            posso = true;
            dano = noone;
        }
        sprite_index = spr_inimigo_igneez_atq;

        tempo_ataque++;

        if (image_index >= 9 && dano == noone && image_index < 11 && posso)
        {
            screenshake(15);
            dano = instance_create_layer(x + sprite_width / 4, y - sprite_height / 3, layer, obj_dano);
            dano.dano = ataque;
            dano.pai = id;
            dano.image_xscale = 3;
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
        break;
    }

    case "ataque2":
    {
        if (!atacando)
        {
            atacando = true;
            tempo_ataque = 0;
        }

        velh = 0;

        if (sprite_index != spr_inimigo_igneez_atq2)
        {
            image_index = 0;
            posso = true;
            dano = noone;
        }
        sprite_index = spr_inimigo_igneez_atq2;

        tempo_ataque++;

        if (image_index >= 11 && dano == noone && image_index < 14 && posso)
        {
            screenshake(20);
            dano = instance_create_layer(x + sprite_width / -10, y - sprite_height / 5, layer, obj_dano);
            dano.dano = ataque * 2;
            dano.pai = id;
            dano.image_xscale = 8;
            dano.image_yscale = 2;
            posso = false;
        }

        if (dano != noone && image_index >= 14)
        {
            instance_destroy(dano);
            dano = noone;
        }

        if (image_index >= image_number - 1)
        {
            atacando = false;
            cooldown_ataque2 = room_speed * 3;
            tempo_recuperacao = tempo_recuperacao_max;
            estado = "patrulha";
        }
        break;
    }

    case "hit":
    {
        var _distancia_jogador = point_distance(x, y, obj_player.x, obj_player.y);

        if (_distancia_jogador <= distancia_ataque && cooldown_ataque2 <= 0)
        {
            estado = "ataque2";
        }
        else if (_distancia_jogador <= distancia_ataque && cooldown_ataque2 > 0)
        {
            estado = "attack";
        }
        else
        {
            velh = 0;
            if (sprite_index != spr_inimigo_igneez_dano)
            {
                image_index = 0;
            }
            sprite_index = spr_inimigo_igneez_dano;

            if (image_index >= image_number - 1)
            {
                estado = (vida_atual > 0) ? "patrulha" : "morto";
            }
        }
        break;
    }

    case "morto":
    {
        velh = 0;
        if (sprite_index != spr_inimigo_igneez_morte)
        {
            image_index = 0;
            screenshake(5);
        }
        sprite_index = spr_inimigo_igneez_morte;

        if (image_index >= image_number - 1)
        {
            image_speed = 0;
            image_alpha -= 0.01;

            if (image_alpha <= 0)
            {
                instance_destroy();
            }
        }
        break;
    }
}