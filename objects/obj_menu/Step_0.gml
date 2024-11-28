/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


// mudando de opção
// descendo pelo menu
if (keyboard_check_pressed(vk_down))
{
	atual++;
	margem = 0;
}

//subindo no menu
if (keyboard_check_pressed(vk_up)) 
{	
	atual--;
	//zerando a margem
	margem = 0;
}

// limitando a variavel atual
atual = clamp(atual, 0, array_length(menu) - 1);

// se eu apertei enter, ele executa a função do menu
if (keyboard_check_pressed(vk_enter))
{
	menu[atual].funcao();
}

// Fazendo o valor da margem aumentar
margem = lerp(margem, 20, 0.2); // 20 é a distância de afastamento. Você pode aumentar ou diminuir esse valor.



if (room == rm_configuracao || room == rm_creditos) {
    var _pos_x = 20;
    var _pos_y = 20;

    // Verificar se o clique do mouse está sobre a seta
    if (mouse_check_button_pressed(mb_left)) {
        if (mouse_x >= _pos_x && mouse_x <= _pos_x + sprite_get_width(spr_seta) &&
            mouse_y >= _pos_y && mouse_y <= _pos_y + sprite_get_height(spr_seta)) 
        {
            room_goto(rm_menu); // Substitua "rm_menu" pelo nome da sala de menu principal
        }
    }
}