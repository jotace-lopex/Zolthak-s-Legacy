/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
view_xport[0] = random_range(-shake, shake);
view_yport[0] = random_range(-shake, shake);

shake *= .95;
//Destruindo
if (shake <= .02)
{
	instance_destroy();
}