// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function scr_ataca_player_melee(){
	///@arg player
	///@arg dist
	///@arg xscale

	var _outro = argument0;
	var _dist = argument1;
	var _xscale = argument2;

	// Definindo os limites do retângulo de colisão
	var _rect_x1 = x;                          // Ponto inicial (esquerda do retângulo)
	var _rect_x2 = x + (_dist * _xscale);      // Ponto final (direita do retângulo)
	var _rect_y1 = y - sprite_height / 1.7;    // Altura do retângulo (acima)
	var _rect_y2 = y + sprite_height / 14;    // Altura do retângulo (abaixo)

	// Checando se o player está dentro do retângulo de ataque
	var _player = collision_rectangle(_rect_x1, _rect_y1, _rect_x2, _rect_y2, _outro, false, true);
	//Atacar se o player entrar na linha
	if (_player)
	{
		estado = "attack";
	}

}