/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Inherit the parent event
event_inherited();

//linha de distancia
// Desenhar o retângulo de detecção
// Variáveis de controle para desenhar o retângulo
var _rect_x1 = x;                           // Ponto inicial (esquerda do retângulo)
var _rect_x2 = x + (dist * xscale);         // Ponto final (direita do retângulo)
var _rect_y1 = y - sprite_height / 1.8;     // Altura do retângulo (acima)
var _rect_y2 = y + sprite_height / -6;     // Altura do retângulo (abaixo)

//draw_rectangle(_rect_x1, _rect_y1, _rect_x2, _rect_y2, false);