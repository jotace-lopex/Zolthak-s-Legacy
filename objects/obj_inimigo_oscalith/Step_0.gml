var _chao = place_meeting(x, y + 1, obj_block);

switch(estado)
{
    case "patrulha":
	{
	    if (tempo_recuperacao > 0)  // Se ainda está no tempo de recuperação
	    {
	        tempo_recuperacao--;  // Decrementa o timer
	        velh = 0;  // Impede movimento
	        sprite_index = spr_inimigo_oscalith_voando;  // Define sprite parado (se existir)
	    }
	    else
	    {
	        velh = 0;
	        timer_estado++;
        
	        // Verifica se o jogador está dentro da distância de visão
	        var _distancia_jogador = point_distance(x, y, obj_player.x, obj_player.y);
	        if (_distancia_jogador < distancia_visao)
	        {
	            estado = "seguir_jogador";  // Transição para o estado de seguir o jogador
	        }

	        // Controle de tempo para mudar a direção
	        tempo_patrol++;  // Incrementa o timer de patrulha
	        if (tempo_patrol >= tempo_patrol_max)
	        {
	            // Reseta o timer de patrulha
	            tempo_patrol = 0;
	            // Inverte o sentido da patrulha
	            sentido_patrulha = -sentido_patrulha;  // Alterna a direção (1 para -1 ou -1 para 1)
	        }

	        // Movimento de patrulha com a velocidade reduzida
	        if (sentido_patrulha == 1)  // Movimento para a direita
	        {
	            x += velocidade_patrulha;  // Usa a velocidade reduzida
	        }
	        else if (sentido_patrulha == -1)  // Movimento para a esquerda
	        {
	            x -= velocidade_patrulha;  // Usa a velocidade reduzida
	        }

	        // Faz o inimigo olhar para a direção em que está indo
	        if (sentido_patrulha == 1)
	        {
	            xscale = 1;  // Olha para a direita
	        }
	        else if (sentido_patrulha == -1)
	        {
	            xscale = -1;  // Olha para a esquerda
	        }
        
	        sprite_index = spr_inimigo_oscalith_voando;  // Animação de movimento
	    }
	    break;
	}
    
	case "seguir_jogador":
	{
    var _distancia_jogador = point_distance(x, y, obj_player.x, obj_player.y);
    
    // Se o inimigo ainda estiver longe o suficiente do jogador, continua seguindo
    if (_distancia_jogador > distancia_ataque)  // Distância mínima para atacar
    {
        // Movimento em direção ao jogador
        var _dir_x = (obj_player.x - x) / _distancia_jogador; // Direção horizontal
        var _dir_y = (obj_player.y - y) / _distancia_jogador; // Direção vertical

        // Movendo o inimigo em direção ao jogador
        x += _dir_x * velocidade;  // Usa a velocidade normal
        y += _dir_y * velocidade;  // Usa a velocidade normal
        
        // Faz o inimigo olhar na direção em que está indo (alterando xscale)
        if (_dir_x > 0)
        {
            xscale = 1;  // Olha para a direita
        }
        else if (_dir_x < 0)
        {
            xscale = -1;  // Olha para a esquerda
        }

        sprite_index = spr_inimigo_oscalith_voando;  // Animação de movimento
	    }
	    else // Quando estiver na distância de ataque
	    {
	        // Movendo suavemente o inimigo na direção vertical para alinhar com a altura do jogador
	        y = lerp(y, obj_player.y, 0.1);  // Interpola suavemente a posição y do inimigo até a posição y do jogador

	        // Quando o inimigo estiver suficientemente próximo do jogador na altura
	        if (abs(y - obj_player.y) < 2) // Verifica se a posição vertical está quase igual à do jogador
	        {
	            estado = "attack";  // Transição para o estado de ataque
	        }
	    }
    
	    break;
	}


    case "attack":
    {
        if (!atacando)  // Só inicia o ataque se ainda não estiver atacando
        {
            atacando = true;  // Marca como atacando
            tempo_ataque = 0;  // Reseta o timer de ataque
        }
        
        // Executa o ataque
        velh = 0;
        if (sprite_index != spr_inimigo_oscalith_atq)
        {
            image_index = 0;
            posso = true;
            dano = noone;
        }
        sprite_index = spr_inimigo_oscalith_atq;

        // Incrementa o timer de ataque
        tempo_ataque++;
        
        // Criando o dano (se necessário)
        if (image_index >= 6 && dano == noone && image_index < 8 && posso)
        {
            dano = instance_create_layer(x + sprite_width/2, y - sprite_height/2, layer, obj_dano);
            dano.dano = ataque;
            dano.pai = id;
            posso = false;
        }
        
        // Destruindo o dano após o ataque
        if (dano != noone && image_index >= 8)
        {
            instance_destroy(dano);
            dano = noone;
        }
        
        if (tempo_ataque > 60)  // 30 frames ou o tempo necessário para o ataque
		{
		    atacando = false;  // Marca como não atacando
		    tempo_recuperacao = tempo_recuperacao_max;  // Inicia o tempo de espera no estado de patrulha
		    estado = "voltar_para_origem";  // Transição para voltar à origem
		}
        
        break;
    }

    case "voltar_para_origem":
    {
        // Movimenta o inimigo de volta para a posição inicial
        var _dir_x = (inicial_x - x) / point_distance(x, y, inicial_x, inicial_y);
        var _dir_y = (inicial_y - y) / point_distance(x, y, inicial_x, inicial_y);

        // Movendo o inimigo em direção à posição inicial
        x += _dir_x * velocidade;  // Usa a velocidade normal
        y += _dir_y * velocidade;  // Usa a velocidade normal

        // Faz o inimigo olhar na direção em que está indo (alterando xscale)
        if (_dir_x > 0)
        {
            xscale = 1;  // Olha para a direita
        }
        else if (_dir_x < 0)
        {
            xscale = -1;  // Olha para a esquerda
        }

        // Quando o inimigo atingir a posição inicial, ele volta ao estado "patrulha"
        if (point_distance(x, y, inicial_x, inicial_y) < 5)
        {
            estado = "patrulha";  // Retorna para patrulha após voltar à origem
        }

        sprite_index = spr_inimigo_oscalith_voando;  // Animação de movimento
        break;
    }

    case "hit":
    {
        velh = 0;
        if (sprite_index != spr_inimigo_oscalith_dano)
        {
            // Iniciando a animação de dano
            image_index = 0;
        }
        sprite_index = spr_inimigo_oscalith_dano;
        
        // Se a animação de dano acabar, transita de volta para "morto" ou "parado"
        if (image_index > image_number-1)
        {
            if (vida_atual > 0)
            {
                estado = "patrulha";  // Retorna para parado após o dano
            }
            else
            {
                estado = "morto";  // Se a vida do inimigo for zero, ele morre
            }
        }
        break;
    }

    case "morto":
    {
        velh = 0;
        if (sprite_index != spr_inimigo_oscalith_morte)
        {
            // Iniciando o que for preciso para esse estado
            image_index = 0; 
            screenshake(20);
        }
        sprite_index = spr_inimigo_oscalith_morte;
        
        if (image_index > image_number-1)
        {
            image_speed = 0;
            image_alpha -= .01;
            
            if (image_alpha <= 0) 
            {
                if (irandom(99) < 50) 
                {
                    instance_create_layer(x + sprite_width/7, y - sprite_height/2.5, layer, obj_drop_servo);
                }
                instance_destroy();
            }
        }
    }
}