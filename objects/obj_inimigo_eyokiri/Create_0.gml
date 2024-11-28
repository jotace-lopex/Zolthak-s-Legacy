/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Inherit the parent event
event_inherited();

vida_max = 10;
vida_atual = vida_max;

max_velh = 1;
max_velv = 1;

timer_estado = 0;

dist = 70;
dano = noone;
ataque = 8;
posso = true;

velocidade = 3.1;  // Velocidade padrão para seguir o jogador e atacar
velocidade_patrulha = 1;  // Velocidade reduzida para patrulha
distancia_visao = 130;  // Distância de visão do inimigo
distancia_ataque = 30;  // Distância mínima para o ataque
tempo_patrol_max = 120;  // Tempo máximo para mudar a direção na patrulha
tempo_patrol = 0;  // Timer da patrulha
sentido_patrulha = 1;  // Sentido inicial da patrulha (1 = direita, -1 = esquerda)
inicial_x = x;  // Posição inicial X
inicial_y = y;  // Posição inicial Y
atacando = false;  // Estado de ataque
tempo_ataque = 0;  // Timer do ataque
estado = "patrulha";  // Estado inicial
tempo_recuperacao = 0; // Timer de recuperação
tempo_recuperacao_max = 120; // Duração da recuperação em frames (2 segundos se image_speed = 30 FPS)

//Sons

hit_som = false;