// Configuração inicial
draw_set_font(fnt_fnt_menu);

var dist = 50;
var gui_largura = display_get_gui_width();
var gui_altura = display_get_gui_height();
var x1 = gui_largura / 2;
var y1 = gui_altura / 2;

// Desenho das opções
for (var i = 0; i < op_max; i++) {
    draw_set_halign(fa_center);
    draw_set_valign(fa_center);

    // Configurar a cor da seleção
    var cor_selecao = (index == i) ? c_yellow : c_white;

    // Substituir texto por sprites nas opções "Efeitos Sonoros" e "Música"
    if (i == 0 || i == 1) {
        // Escolher o sprite correto
        var sprite_usar = (i == 0) 
                          ? (global.sound_effects_on ? spr_efeitos_ligado : spr_efeitos_desligado) 
                          : (global.music_on ? spr_musica_ligada : spr_musica_desligada);

        // Desenhar o sprite com cor da seleção
        draw_sprite_ext(sprite_usar, 0, x1, y1 + (100 * i), 1, 1, 0, cor_selecao, 1);
    } else {
        // Desenhar o texto "Voltar" com a cor da seleção
        draw_set_color(cor_selecao);
        draw_text(x1, y1 + (150 * i), "Voltar");
    }
}

// Restaurar configurações de fonte
draw_set_font(-1);
