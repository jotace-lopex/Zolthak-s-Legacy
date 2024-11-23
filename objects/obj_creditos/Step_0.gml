
var _touch_confirm = obj_botao_confirma.toque;


// se eu apertei enter, ele executa a função do menu
if (keyboard_check_pressed(vk_enter) || _touch_confirm)
{
	if(index == op_max - 1){
	room_goto(rm_menu); // Muda para a room "Menu"
}

}

// Fazendo o valor da margem aumentar
margem = lerp(margem, 20, 0.2); // 20 é a distância de afastamento. Você pode aumentar ou diminuir esse valor.