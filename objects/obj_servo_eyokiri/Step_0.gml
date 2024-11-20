// Define a distância que o inimigo deve ficar atrás do player
var _pos_x = -25; // Distância horizontal. Ajuste conforme necessário
var _pos_y = -32;  // Distância vertical. Ajuste conforme necessário

// Calcula a posição-alvo x com base na direção do obj_player
var _alvo_x;
if (obj_player.image_xscale == -1) 
{
    _alvo_x = obj_player.x - _pos_x;
} 
else 
{
    _alvo_x = obj_player.x + _pos_x;
}

// Calcula a posição-alvo y
var _alvo_y = obj_player.y + _pos_y;

// Usa `lerp` para mover gradativamente a posição de x e y do obj_servo_eyokiri em direção ao alvo
x = lerp(x, _alvo_x, 0.1); // Ajuste o valor (0.1) para controlar a velocidade de transição; valores mais altos = mais rápido
y = lerp(y, _alvo_y, 0.1);

// Garante que o xscale seja o mesmo do obj_player
image_xscale = obj_player.image_xscale;

// Aumenta a opacidade gradativamente até o máximo de 1
if (image_alpha < 1) 
{
    image_alpha += fade_speed;
}

// Sistema de cura
// Verifica se o obj_player existe
if (instance_exists(obj_player)) 
{
    var _player = obj_player;

    // Incrementa o temporizador
    cura_timer += 1;

    // Verifica se o intervalo foi atingido, se o player pode ser curado e se não está no estado "morto"
    if (cura_timer >= cura_intervalo && _player.vida_atual < _player.vida_max && _player.estado != "morto" ||
        keyboard_check_pressed(vk_numpad0)) 
    {
        // Restaura a vida do player
        _player.vida_atual += 10;

        // Garante que a vida não ultrapasse o máximo
        if (_player.vida_atual > _player.vida_max) 
        {
            _player.vida_atual = _player.vida_max;
        }

        // Reinicia o temporizador
        cura_timer = 0;
		// Cria o efeito de cura no centro do player
	    var _efeito = instance_create_layer(_player.x, _player.y, "Inst_Buffs", obj_cura);

	    // Gradualmente faz o efeito desaparecer
	    _efeito.image_alpha = 1;
	    _efeito.image_speed = 1; // Controla a velocidade da animação

        // Altera o sprite para o ataque
        sprite_index = spr_servo_eyokiri_ataque;

        // Reinicia o índice da imagem para o primeiro frame
        image_index = 0; 
    }
}

// No evento Step do obj_servo_eyokiri, adicione:
if (instance_exists(self)) // Verifica se o objeto ainda existe
{
    // Verifica se o sprite de ataque terminou
    if (sprite_index == spr_servo_eyokiri_ataque && image_index == (sprite_get_number(spr_servo_eyokiri_ataque) - 1))
    {
        // Retorna ao sprite parado após o último frame do ataque
        sprite_index = spr_servo_eyokiri_parado;
    }
}