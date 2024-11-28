


// se eu apertei enter, ele executa a função do menu
if (keyboard_check_pressed(vk_enter))
{
	if(index == op_max - 1){
	room_goto(rm_menu); // Muda para a room "Menu"
}

}

// Fazendo o valor da margem aumentar
margem = lerp(margem, 20, 0.2); // 20 é a distância de afastamento. Você pode aumentar ou diminuir esse valor.

// Evento Step do obj_creditos

// Movendo os créditos para cima
y_position -= scroll_speed;  // Faz a posição de y_position diminuir (movimento para cima)

// Quando os créditos saírem da tela, reposicione-os para reiniciar o movimento
if (y_position <= -300) {  // Se os créditos saírem completamente da tela
    y_position = gui_altura;  // Reinicia a posição dos créditos
}

// Verifica se o mouse clicou sobre o texto "Voltar"
if (mouse_check_button_pressed(mb_left)) {
    var voltar_x = gui_largura / 30;  // Posição horizontal do texto
    var voltar_y = gui_altura - 30;  // Posição vertical do texto
    var text_width = string_width("Voltar");  // Largura do texto
    var text_height = string_height("Voltar");  // Altura do texto
    
    // Verifica se o clique está dentro da área do texto
    if (mouse_check_button_pressed(mb_left)) {
        // Se o clique ocorreu sobre o texto "Voltar", vai para a sala "rm_menu"
        room_goto(rm_menu);
    }
}


