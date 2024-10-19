//variáveis
var _right, _left, _jump, _attack;
var _solo = place_meeting(x, y + 1, obj_block);

_right = keyboard_check(ord("D"));
_left = keyboard_check(ord("A"));
_jump = keyboard_check_pressed(ord("K"));

//movimentação
velh = (_right - _left) * max_velh;


//gravidade e salto
if (!_solo)
{
	if velv < max_velv
	{
		velv += GRAVIDADE * massa;
	}
	
}
else
{
	if (_jump)
	{
		velv = -max_velv;
	}
}