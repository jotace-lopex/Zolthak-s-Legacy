/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
var _outro = instance_place(x, y, obj_entidade);

if (_outro)
{
	//Se não esta tocando no obj pai
	if (_outro.id != pai)
	{
		if (_outro.vida_atual > 0)
		{
			_outro.estado = "hit";
			_outro.image_index = 0;
			_outro.vida_atual -= dano;
			instance_destroy();
		}
		
	}
}