draw_set_font(fnt_fnt_menu);

var dist = 50;
var gui_largura = display_get_gui_width();
var gui_altura = display_get_gui_height();
var x1 = gui_largura / 2;
var y1 = gui_altura / 2;

opcoes[0] = "Efeitos Sonoros: " + (global.sound_effects_on ? "Ligado" : "Desligado");
opcoes[1] = "Musica: " + (global.music_on ? "Ligada" : "Desligada");

for(var i = 0; i < op_max; i++){
    draw_set_halign(fa_center);
    draw_set_valign(fa_center);
    
    if(index == i){
        draw_set_color(c_yellow);
    } else {
        draw_set_color(c_white);
    }
    
    draw_text(x1, y1 + (100 * i), opcoes[i]);
}

draw_set_font(-1); 