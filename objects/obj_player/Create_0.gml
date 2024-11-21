// Evento Create
randomize();

// Criação da câmera
var _cam = instance_create_layer(x, y, layer, obj_camera);
_cam.alvo = id;

// Herança do evento
event_inherited();

// Configurações de vida do jogador
vida_max = 20;
vida_atual = vida_max;

//Configuração de estamina
estamina_max = 5;
estamina_atual = estamina_max;
estamina_recarregando = 0;

//Configuração energia
energia_max = 10;
energia_atual = energia_max;
energia_recarregando = 0;
custo_kaise_beam = 7;

// Configurações de velocidade máxima
max_velh = 3;
max_velv = 6.7;

// Outras variáveis de controle
mostra_estado = true;
combo = 0;
dano = noone;
ataque = 1;
posso = true;
ataque_mult = 1;
ataque_buff = room_speed;
skill_beam = noone;
ataque_down = false;

// Variáveis do dash
dash_speed = 10;       // Velocidade do dash
dash_duration = 10;    // Duração do dash em frames
dash_timer = 0;        // Temporizador para o dash
dash_cooldown = 0;     // Tempo de recarga para o dash

//invencivel
invencivel = false;
invencivel_timer = room_speed * 3;
tempo_invencivel = invencivel_timer;

//rastro movendo
rastro_timer = 0;         // Temporizador para controlar a criação de rastro
rastro_duracao = 15;      // Duração do rastro em steps (ajuste conforme desejado)


//pulo duplo
pulos_restantes = 1; // 1 pulo normal + 1 pulo duplo

//metodo para iniciar o ataque
///@method incia_ataque(_chao)
incia_ataque = function(_chao)
{
	if (_chao)
	{
		estado = "ataque";
	    velh = 0;
	    image_index = 0;
	}
	else
	{
		if (keyboard_check(ord("S")))
		{
			estado = "ataque aereo down";
			velh = 0;
			image_index = 0;
		}
		else
		{
			estado = "ataque aereo";
			image_index = 0;
		}
	}
}

finaliza_ataque = function()
{
	posso = true;
    if (dano) 
	{
        instance_destroy(dano, false);
        dano = noone;
    }
}