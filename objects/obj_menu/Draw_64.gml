// calcular centro da tela
if (room == rm_menu) { // verifica se estamos na sala do menu
    var centro_x = display_get_gui_width() / 2;
    var centro_y = display_get_gui_height() / 2;

    // calcula altura total do menu para centralizar verticalmente
    var altura_total_menu = string_height("I") * array_length(menu);
	
	// deslocamento vertical para mover o menu para baixo
	var deslocamento_y = 200; // ajustar o valor conforme necessário

    for (var i = 0; i < array_length(menu); i++) {
        var _cor = c_white;
        draw_set_font(Fnt_menu);
        
        // Calcular largura do texto para centralização horizontal
        var largura_texto = string_width(menu[i].texto);
        

        // ajusta a posição inicial y para centralizar verticalmente o menu
        var pos_y = centro_y - altura_total_menu / 2 + string_height("I") * i + deslocamento_y;

        // se a opção estiver selecionada, aplica a cor vermelha e a margem
        var _margem = 0; // resetar a margem a cada iteração
        if (i == atual) {
            _cor = c_red;
            _margem = margem; // define a margem para a opção selecionada
        }
		
		draw_set_color(_cor);
		// desenhar o texto com a margem, afastando visualmente
		draw_text(centro_x - largura_texto / 2 + _margem, pos_y, menu[i].texto);
		draw_set_color(-1);
		draw_set_font(-1);
    }
}

// desenha a seta de "voltar" nas salas de Configuração e Créditos
if (room == rm_configuracao || room == rm_creditos) {
    var pos_x = 20;
    var pos_y = 20;
    draw_sprite(spr_seta, 0, pos_x, pos_y); // desenha a seta
}
