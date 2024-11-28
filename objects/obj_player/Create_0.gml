// Evento Create
randomize();

// Criação da câmera
var _cam = instance_create_layer(x, y, layer, obj_camera);
_cam.alvo = id;

// Herança do evento
event_inherited();

//Movimentação

// Entrada do jogador controles
right = false;
left = false;
jump = false;
attack = false;
dash = false;
skill = false;
down = false;

//powerup
pulo_duplo_power_up = false;
power_up_skill = false;

//servo
servo_eyokiri = false;
servo_oscalith = false;

//controles virutuais para mobile
if (MOBILE)
{
		//Esquerda
	virtual_key_add(30, 500, 180, 90, vk_left);
	//Direita
	virtual_key_add(260, 500, 180, 90, vk_right);
	//Baixo
	virtual_key_add(180, 630, 120, 200, vk_down);
	//Pular
	virtual_key_add(940, 600, 80, 71, vk_space);
	//Dash
	virtual_key_add(960, 500, 80, 80, vk_shift);
	//Ataque
	virtual_key_add(1050, 530, 120, 132, vk_numpad0);
	//Skill
	if (power_up_skill)
	{
		virtual_key_add(1050, 450, 90, 90, vk_numpad1);
	}

	
}



//plataform
plataforma = 0;

// Configurações de vida do jogador
vida_max = 130;
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
ataque = 5;
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
invencivel_timer = room_speed * 1.3;
tempo_invencivel = invencivel_timer;

//rastro movendo
rastro_timer = 0;         // Temporizador para controlar a criação de rastro
rastro_duracao = 15;      // Duração do rastro em steps (ajuste conforme desejado)


//pulo duplo
pulos_restantes = 1; // 1 pulo normal + 1 pulo duplo

//level up mensagem
show_level_up_message = false;
atributos_incrementados = false;

//level up mensagem
show_level_up_message_1 = false;
atributos_incrementados_1 = false;

//level up mensagem
show_level_up_message_2 = false;
atributos_incrementados_2 = false;

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
		if (keyboard_check(ord("S")) || keyboard_check(vk_down))
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

conjurando_som_tocado = false;
ataque1_som = false;
ataque2_som = false;
ataque3_som = false;
hit_som = false;
passos_som = false;
pulo_som = false;
ataque_ar_som = false;
level_up_som = false;



//Caixa de texto
global.text_index = 0; // Índice inicial do texto
global.text_timer = 0; // Timer para controlar o tempo do efeito
global.text_displayed_1 = false; // Variável para controlar se o texto já foi exibido
global.text_displayed_2 = false;