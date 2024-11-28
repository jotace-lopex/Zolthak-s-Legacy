var _escala = 2;
var _guia = display_get_gui_height();
var _spra = sprite_get_height(spr_hud_barras) * _escala;
var _huda = _guia - _spra;

var _vida = obj_inimigo_zarathos.vida_atual;
var _maxvida = obj_inimigo_zarathos.vida_max;



//Fudo Barra de Vida
draw_sprite_ext(spr_fundo_barra_boss, 0, 385, _huda + 155, _escala, _escala, 0, c_white, 1)
//Barra de Vida
draw_sprite_ext(spr_barra_vida_boss, 0, 385, _huda + 155, (_vida/ _maxvida) * _escala, _escala + .4, 0, c_white, 1);
//HUD
draw_sprite_ext(spr_hud_vida_boss, 0, 370, _huda + 150 , _escala, _escala, 0, c_white, 1)
