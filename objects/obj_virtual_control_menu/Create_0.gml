/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if (MOBILE)
{
	cima = false;
	baixo = false;
	confirmar = false;

	//Cima
	virtual_key_add(450, 480, 78, 100, vk_up);
	//Baixo
	virtual_key_add(450, 630, 78, 100, vk_down);
	//Confirmar
	virtual_key_add(800, 560, 80, 78, vk_enter);
}