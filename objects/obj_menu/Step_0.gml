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

//fazendo o valor da margem aumentar
margem = lerp(margem, 20, .2);