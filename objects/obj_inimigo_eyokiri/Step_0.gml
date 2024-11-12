// Define a distância que o inimigo deve ficar atrás do player
var _pos_x = -25; // Distância horizontal. Ajuste conforme necessário
var _pos_y = -32;  // Distância vertical. Ajuste conforme necessário

// Calcula a posição-alvo x com base na direção do obj_ezen
var _alvo_x;
if (obj_player.image_xscale == -1) {
    _alvo_x = obj_player.x - _pos_x;
} else {
    _alvo_x = obj_player.x + _pos_x;
}

// Calcula a posição-alvo y
var _alvo_y = obj_player.y + _pos_y;

// Usa `lerp` para mover gradativamente a posição de x e y do obj_inimigo_eyokiri em direção ao alvo
x = lerp(x, _alvo_x, 0.1); // Ajuste o valor (0.1) para controlar a velocidade de transição; valores mais altos = mais rápido
y = lerp(y, _alvo_y, 0.1);

// Garante que o xscale seja o mesmo do obj_ezen
image_xscale = obj_player.image_xscale;