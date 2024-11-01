//Sistema de colisão e movimentação

var _velh = sign(velh);
var _velv = sign(velv);

//Horizontal	
repeat(abs(velh))
{
	//subindo e descendo rampas

	//subindo

	if (place_meeting(x + sign(velh), y, obj_block) && 
		!place_meeting(x + sign(velh), y - 1, obj_block)) y--;
	
	//descendo
	if (place_meeting(x + sign(velh), y, obj_block) && 
		!place_meeting(x + sign(velh), y + 1, obj_block) &&
		place_meeting(x + sign(velh), y + 2, obj_block)) y++;
	
	
	if (place_meeting(x + _velh, y, obj_block))
	{
		velh = 0;
		break;
	}
	x += _velh;
}

//vertical

repeat(abs(velv))
{
	if (place_meeting(x, y + _velv, obj_block))
	{
		velv = 0;
		break;
	}
	y += _velv;
}