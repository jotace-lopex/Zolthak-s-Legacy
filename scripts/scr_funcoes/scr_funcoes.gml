// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function scr_funcoes(){

}


//Screeshake
///@function screenshake(valor_da_tremida)
///@arg força_da_tremida
function screenshake(_treme)
{
	var _shake = instance_create_layer(0, 0, "Instances", obj_screenshake);
	_shake.shake = _treme;
}