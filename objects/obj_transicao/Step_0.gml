/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if (mudei)
{
	alpha -= .02;
}
else
{
	alpha += .02;
}

//quando o alpha passar de 1 muda room
if (alpha >= 1)
{
	room_goto(destino);
	
	//posição
	obj_player.x = destino_x;
	obj_player.y = destino_y;
}

//destruindo depois de ficar transparente e mudar de room

if (mudei && alpha <= 0)
{
	instance_destroy();
}