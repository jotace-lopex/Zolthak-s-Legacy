/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Criação da câmera
var _cam = instance_create_layer(x, y, layer, obj_camera);
_cam.alvo = id;

// Entrada do jogador controles
right = false;
left = false;
jump = false;
attack = false;
dash = false;
skill = false;
down = false;
////controles virutuais para mobile
if (MOBILE)
{
		//Esquerda
	virtual_key_add(30, 500, 180, 90, vk_left);
	//Direita
	virtual_key_add(260, 500, 180, 90, vk_right);
	//Baixo
	virtual_key_add(165, 610, 90, 180, vk_down);
	//Pular
	virtual_key_add(940, 600, 80, 71, vk_space);
	//Dash
	virtual_key_add(960, 500, 80, 80, vk_shift);
	//Ataque
	virtual_key_add(1050, 530, 120, 132, vk_numpad0);
	
	if(power_up_skill)
	{
		virtual_key_add(1050, 450, 90, 90, vk_numpad1);
	}
	
}