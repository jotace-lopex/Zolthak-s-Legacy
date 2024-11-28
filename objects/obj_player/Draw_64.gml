/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//var _estamina_texto = string(estamina_atual) + "/" + string(estamina_max);
//draw_text(20, 20, "Estamina: " + _estamina_texto);

//var _energia_texto = string(energia_atual) + "/" + string(energia_max);
//draw_text(20, 50, "Energia: " + _energia_texto);

//var _vida_texto = string(vida_atual) + "/" + string(vida_max);
//draw_text(20, 80, "Vida: " + _vida_texto);

//CONTROLES VIRTUAIS PARA MOBILE

if (MOBILE)
{
	//Seta para esquerda
	draw_sprite_ext(spr_seta_esquerda, left, 40, 500, 1, 1, 0, -1, 1)
	//Seta para direita
	draw_sprite_ext(spr_seta_direita, right, 300, 500, 1, 1, 0, -1, 1)
	//Seta para baixo
	draw_sprite_ext(spr_seta_baixo, down, 175, 610, 1, 1, 0, -1, 1)
	//Seta para pular
	draw_sprite_ext(spr_botao_pulo, jump, 940, 600, 1, 1, 0, -1, 1)
	//Seta para dash
	draw_sprite_ext(spr_botao_dash, dash, 960, 500, 1, 1, 0, -1, 1)
	//Seta para ataque
	draw_sprite_ext(spr_botao_atk, attack, 1050, 530, 1, 1, 0, -1, 1)
	
	if (power_up_skill)
	{
		//Seta para skill
		draw_sprite_ext(spr_botao_skill, skill, 1060, 430, 1, 1, 0, -1, 1)
	}
}


// Caixas de texto
if (pulo_duplo_power_up && !global.text_displayed_1)
{
    // Configurações da caixa de texto
    var box_width = 600; // Largura da caixa
    var box_height = 150; // Altura da caixa
    var box_x = (display_get_gui_width() - box_width) / 2; // Posição X centralizada
    var box_y = display_get_gui_height() - box_height - 20; // Posição Y na parte inferior

    // Texto para exibir
    var text = "Salto duplo adquirido!!! Salte novamente enquanto estiver NO AR para executar um salto duplo.";

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
            close_message = "Toque na caixa de texto para fechar";
        } else if (!MOBILE) {
            close_message = "Pressione E para fechar";
        }

        // Desenhar mensagem de instrução
        draw_set_color(c_white);
        draw_set_halign(fa_center);
        draw_set_valign(fa_bottom);
        draw_text(box_x + box_width / 2, box_y + box_height - 10, close_message);

        // Interação para fechar a caixa
        if (MOBILE && mouse_check_button_pressed(mb_left)) 
		{
                global.text_displayed_1 = true;
        } 
        else if (!MOBILE && keyboard_check_pressed(ord("E")))
		{
            // Fechar para Windows (tecla E)
            global.text_displayed_1 = true;
        }
    }
}





// Caixas de texto
if (power_up_skill && !global.text_displayed_2)
{
    // Configurações da caixa de texto
    var box_width = 600; // Largura da caixa
    var box_height = 150; // Altura da caixa
    var box_x = (display_get_gui_width() - box_width) / 2; // Posição X centralizada
    var box_y = display_get_gui_height() - box_height - 20; // Posição Y na parte inferior

    // Texto para exibir
    var text = "Voce aprendeu KAISER BEAM utilize sua nova habilidade pressionando U ou botao da habilidade para devastar os inimigos causando um dano massivo.";

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
            close_message = "Toque na caixa de texto para fechar";
        } else if (!MOBILE) {
            close_message = "Pressione E para fechar";
        }

        // Desenhar mensagem de instrução
        draw_set_color(c_white);
        draw_set_halign(fa_center);
        draw_set_valign(fa_bottom);
        draw_text(box_x + box_width / 2, box_y + box_height - 10, close_message);

        // Interação para fechar a caixa
        if (MOBILE && mouse_check_button_pressed(mb_left)) 
		{
                global.text_displayed_2 = true;
        } 
        else if (!MOBILE && keyboard_check_pressed(ord("E")))
		{
            // Fechar para Windows (tecla E)
            global.text_displayed_2 = true;
        }
    }
}

