// Evento Create
randomize();

// Criação da câmera
var _cam = instance_create_layer(x, y, layer, obj_camera);
_cam.alvo = id;

// Herança do evento
event_inherited();

// Configurações de vida do jogador
vida_max = 10;
vida_atual = vida_max;

//Configuração de estamina
estamina_max = 5;
estamina_atual = estamina_max;
estamina_recarregando = 0;

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

// Variáveis do dash
dash_speed = 10;       // Velocidade do dash
dash_duration = 10;    // Duração do dash em frames
dash_timer = 0;        // Temporizador para o dash
dash_cooldown = 0;     // Tempo de recarga para o dash