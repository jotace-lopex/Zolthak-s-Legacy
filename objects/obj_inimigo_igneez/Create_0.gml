event_inherited();

vida_max = 50;
vida_atual = vida_max;

max_velh = 1;
max_velv = 1;

timer_estado = 0;

dist = 120;
dano = noone;
ataque = 10;
posso = true;

velocidade = 3.2;  // Velocidade padrão para seguir o jogador e atacar
velocidade_patrulha = 1;  // Velocidade reduzida para patrulha
distancia_visao = 400;  // Distância de visão do inimigo
distancia_ataque = 100;  // Distância mínima para o ataque
tempo_patrol_max = 200;  // Tempo máximo para mudar a direção na patrulha
tempo_patrol = 0;  // Timer da patrulha
sentido_patrulha = 1;  // Sentido inicial da patrulha (1 = direita, -1 = esquerda)
atacando = false;  // Estado de ataque
tempo_ataque = 0;  // Timer do ataque
estado = "patrulha";  // Estado inicial
tempo_recuperacao = 0; // Timer de recuperação
tempo_recuperacao_max = 60; // Duração da recuperação em frames (2 segundos se image_speed = 30 FPS)
cooldown_ataque2 = 0;