/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
//KROLIUM

if (global.is_paused) {
    // Impede a execução do restante do código, ou apenas a parte que você quer pausar
    exit;  // Faz o código da lógica não ser executado enquanto estiver pausado
}


var _chao = place_meeting(x, y + 1, obj_block);

if (!_chao)
{
	velv += GRAVIDADE * massa;
	
}

//if (mouse_check_button_pressed(mb_right))
//{
//	estado = "attack";
//}


switch(estado)
{
	case"parado":
	{
		velh = 0;
		timer_estado++;
		if(sprite_index != spr_inimigo_shynkir_parado)
		{
			image_index = 0;
		}
		sprite_index = spr_inimigo_shynkir_parado;
		
		//Condição de troca de estado
		if (position_meeting(mouse_x, mouse_y, self))
		{
			if(mouse_check_button_pressed(mb_right))
			{
				estado = "hit";
			}
		}
		
		//indo para o estado de patrulha
		if (irandom(timer_estado) > 300)
		{
			estado = choose("walk", "parado", "walk");
			timer_estado = 0;
		}
		scr_ataca_player_melee(obj_player, dist, xscale);
		
		break;
	}
	
	case "walk":
	{
	    timer_estado++;

	    // Configurar o sprite de animação para andar
	    if (sprite_index != spr_inimigo_shynkir_andando) {
	        image_index = 0;
	        velh = choose(1, -1); // Escolhe direção inicial: direita (1) ou esquerda (-1)
	    }
	    sprite_index = spr_inimigo_shynkir_andando;

	    // Guardar a posição anterior
	    var posicao_anterior = x;

	    // Movimentação normal
	    x += velh * .01;

	    // Verificar se a posição mudou
	    if (x == posicao_anterior) {
	        // Se não estiver se movendo, inverte a direção
	        velh = -velh;
	        x += velh * 2; // Ajusta posição para sair da colisão
	    }

	    // Verificação de limite de distância
	    var limite_distancia = 150; // Distância máxima a partir da posição inicial
	    if (abs(x - x_inicial) > limite_distancia) {
	        // Inverte direção ao atingir o limite
	        velh = -velh;
	    }

	    // Condição de saída do estado
	    if (irandom(timer_estado) > 200) {
	        estado = choose("parado", "walk", "walk");
	        timer_estado = 0;
	    }

	    // Tenta atacar o player, se dentro da distância
	    scr_ataca_player_melee(obj_player, dist, xscale);

	    break;
	}





	
	case"hit":
	{
		velh = 0;
		if (sprite_index != spr_inimigo_shynkir_dano)
		{
			//Iniciando o que for preciso para esse estado
			image_index = 0;
			//vida_atual--;
			if (global.sound_effects_on) 
				{
			        var _som_escolhido = choose(snd_blade_hit_1, snd_blade_hit_2);
			        audio_play_sound(_som_escolhido, 2, false, 1);
				
	            }
				hit_som = true;
		}
		sprite_index = spr_inimigo_shynkir_dano;
		if (estado != "hit") 
		{
			hit_som = false;
		}
		
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
	
	case"attack":
	{
		velh = 0;
		if (sprite_index != spr_inimigo_shynkir_atk)
		{
			image_index = 0;
			posso = true;
			dano = noone;
		}
		sprite_index = spr_inimigo_shynkir_atk;
		
		if (image_index > image_number-1)
		{
			estado = "parado";
		}
		
		//criando o dano
		if (image_index >= 10 && dano == noone && image_index < 14)
		{
			dano = instance_create_layer(x + sprite_width/2, y - sprite_height/3, layer, obj_dano);
			dano.dano = ataque;
			dano.pai = id;
			// Define o tamanho específico do objeto de dano
		    dano.image_xscale = 1.5; // Altera a escala horizontal (2x maior)
		    dano.image_yscale = 1.4; // Altera a escala vertical (1.5x maior)
		}
		
		//Destruindo o dano
		if (dano != noone && image_index >= 14)
		{
			instance_destroy(dano);
			dano = noone;
		}
		
		//Saindo do estado
		
		break;
	}
	
	case"morto":
	{
		velh = 0;
		if (sprite_index != spr_inimigo_shynkir_morte)
		{
			//Iniciando o que for preciso para esse estado
			image_index = 0; 
		}
		sprite_index = spr_inimigo_shynkir_morte;
		
		if (image_index > image_number-1)
		{
			image_speed = 0;
			image_alpha -= .01;
			
			if (image_alpha <= 0) instance_destroy();
		}
	}	
}

