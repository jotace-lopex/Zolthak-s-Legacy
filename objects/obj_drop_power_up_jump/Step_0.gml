/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
var _chao = place_meeting(x, y + 1, obj_block);

if (!_chao)
{
	velv += GRAVIDADE * massa;
	
}

// Aumenta a opacidade gradativamente até o máximo de 1
if (image_alpha < 1) {
    image_alpha += fade_speed;
}