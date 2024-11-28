// Caixas de texto
if (global.boss_krolium_derrotado)
{
    // Configurações da caixa de texto
    var box_width = 600; // Largura da caixa
    var box_height = 150; // Altura da caixa
    var box_x = (display_get_gui_width() - box_width) / 2; // Posição X centralizada
    var box_y = display_get_gui_height() - box_height - 20; // Posição Y na parte inferior

    // Texto para exibir
    var text = "Parabens voce chegou ate o final dessa versao, ainda ha novidades no futuro, ate mais.";

    // Inicialize o índice e o timer do texto somente quando o texto começar a ser exibido
    if (!global.text_index) global.text_index = 0;
    if (!global.text_timer) global.text_timer = 0;

    // Incrementa o texto gradualmente
    global.text_timer += 1;
    if (global.text_timer >= 1.5) { // Aumente o valor para texto mais lento
        global.text_index = min(global.text_index + 1, string_length(text));
        global.text_timer = 0;
    }

    // Texto visível até o índice atual
    var displayed_text = string_copy(text, 1, global.text_index);
    
    // Desenhar bordas amarelas
    draw_set_color(c_yellow);
    draw_rectangle(box_x - 2, box_y - 2, box_x + box_width + 2, box_y + box_height + 2, false);

    // Desenhar fundo preto da caixa
    draw_set_color(c_black);
    draw_rectangle(box_x, box_y, box_x + box_width, box_y + box_height, false);

    // Desenhar o texto principal
    draw_set_color(c_white);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_text_ext(box_x + 10, box_y + 10, displayed_text, -1, box_width - 20);

    // Verifica se o texto foi completamente exibido
    if (global.text_index == string_length(text)) {
        // Mensagem de instrução aparece somente após o texto terminar
        var close_message;
        if (MOBILE) {
            close_message = "Toque na caixa de texto para reiniciar";
        } else if (!MOBILE) {
            close_message = "Pressione E para reinicar";
        }

        // Desenhar mensagem de instrução
        draw_set_color(c_white);
        draw_set_halign(fa_center);
        draw_set_valign(fa_bottom);
        draw_text(box_x + box_width / 2, box_y + box_height - 10, close_message);

        // Interação para fechar a caixa
        if (MOBILE && mouse_check_button_pressed(mb_left)) 
		{
			game_restart();
        } 
        else if (!MOBILE && keyboard_check_pressed(ord("E")))
		{
            // Fechar para Windows (tecla E)
			game_restart();
        }
    }
}