var _escala = 2;
var _guia = display_get_gui_height();
var _spra = sprite_get_height(spr_hud_barras) * _escala;
var _huda = _guia - _spra;

var _vida = obj_player.vida_atual;
var _maxvida = obj_player.vida_max;

var _estamina = obj_player.estamina_atual;
var _maxestamina = obj_player.estamina_max;

var _energia = obj_player.energia_atual;
var _maxenergia = obj_player.energia_max;


//Barra de Vida
draw_sprite_ext(spr_barra_vida, 0, 97, _huda - 500, (_vida/ _maxvida) * _escala, _escala + .4, 0, c_white, 1);

//Barra de Estamina
draw_sprite_ext(spr_barra_stm, 0, 79, _huda - 415, (_estamina/_maxestamina) * _escala, _escala + .4,  0, c_white, 1);

//Barra de Energia
draw_sprite_ext(spr_barra_ene, 0, 79, _huda - 457, (_energia/_maxenergia) * _escala, _escala + .4,  0, c_white, 1);

//HUD
draw_sprite_ext(spr_hud_barras, 0, 97, _huda - 500, _escala, _escala, 0, c_white, 1)







if (global.is_paused) {
    // Fundo semitransparente
    draw_set_color(c_black);
    draw_set_alpha(0.7); // Transparência para o fundo
    draw_rectangle(0, 0, display_get_width(), display_get_height(), false);
    draw_set_alpha(1); // Reseta a transparência para o restante

    // Texto "PAUSADO"
    draw_set_color(c_white);
    draw_set_font(fnt_arial_bold); // Use o nome da fonte que você criou no GameMaker
    var text_width = string_width("PAUSADO");
    var text_height = string_height("PAUSADO");
    draw_text(display_get_width()/2 - text_width/2, display_get_height()/2 - text_height/2, "PAUSADO");

    // Texto de instruções
    draw_set_font(fnt_arial_regular); // Outra fonte se necessário
    var inst_width = string_width("Pressione ESC para continuar");
    var inst_height = string_height("Pressione ESC para continuar");
    draw_text(display_get_width()/2 - inst_width/2, display_get_height()/2 + 40, "Pressione ESC para continuar");

    // Botão "Continuar"
    var button_width = 200;
    var button_height = 50;
    var button_x = display_get_width()/2 - button_width/2;
    var button_y = display_get_height()/2 + 100;

    // Botão de "Continuar"
    draw_set_color(c_green);
    draw_rectangle(button_x, button_y, button_x + button_width, button_y + button_height, false);
    draw_set_color(c_white);
    draw_text(button_x + button_width/2 - string_width("Continuar")/2, button_y + button_height/2 - string_height("Continuar")/2, "Continuar");

    // Efeito de hover no botão (interatividade)
    if (mouse_x >= button_x && mouse_x <= button_x + button_width && mouse_y >= button_y && mouse_y <= button_y + button_height) {
        draw_set_color(c_lightgreen);
        draw_rectangle(button_x, button_y, button_x + button_width, button_y + button_height, false);
        draw_text(button_x + button_width/2 - string_width("Continuar")/2, button_y + button_height/2 - string_height("Continuar")/2, "Continuar");

        // Verifica se o botão é clicado
        if (mouse_check_button_pressed(mb_left)) {
            global.is_paused = false; // Despausa o jogo
        }
    }
}


