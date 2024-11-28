/// @description Aplica dano às entidades em colisão
var _outro;
var _outro_lista = ds_list_create();
var _aplicar_dano = ds_list_create();

try {
    // Obter lista de entidades em colisão
    var _quantidade = instance_place_list(x, y, obj_entidade, _outro_lista, false);
    
    // Adicionar entidades elegíveis à lista de dano
    for (var _i = 0; _i < _quantidade; _i++) {
        var _atual = _outro_lista[| _i];
		
		///checando se o atual esta invencivel
		if (_atual.invencivel)
		{
			continue;
		}

        // Evitar colisões com entidades da mesma hierarquia
        if (object_get_parent(_atual.object_index) != object_get_parent(pai.object_index)) {
            // Verificar se ainda não está na lista
            if (ds_list_find_index(_aplicar_dano, _atual) == -1) {
                ds_list_add(_aplicar_dano, _atual);
            }
        }
    }

    // Aplicar dano às entidades
    for (var _i = 0; _i < ds_list_size(_aplicar_dano); _i++) {
        _outro = _aplicar_dano[| _i];
        if (variable_instance_exists(_outro, "vida_atual") && _outro.vida_atual > 0) {
            
			if (_outro.delay <= 0 && _outro.atacando = false)
			{
				_outro.estado = "hit";
				_outro.image_index = 0;
			}
			
            _outro.vida_atual -= dano;

            // Screenshake para inimigos
            if (object_is_ancestor(_outro.object_index, obj_inimigo_pai)) {
                screenshake(2);
				
				//Garantindo que o cara vai morrer, ISSO É IMPORTANTE!
				if(_outro.vida_atual <=0)
				{
					_outro.estado = "morto";
				}
            }
        }
    }
    
    // Controlar destruição do objeto
    if (morrer || _quantidade > 0) {
        instance_destroy();
    } else {
        y = pai.y; // Sincronizar posição vertical
    }
    
} finally {
    // Destruir listas auxiliares
    ds_list_destroy(_aplicar_dano);
    ds_list_destroy(_outro_lista);
}




/*/
if (_outro) 
{
    // Verifica se `pai` ainda existe para evitar erros
    if (instance_exists(pai)) 
	{
        // Se `_outro` não é o pai
        if (_outro.id != pai) 
		{
            
            // Checa o tipo do pai de `_outro`
            var _ipai = object_get_parent(_outro.object_index);
            if (_ipai != object_get_parent(pai.object_index)) 
			{		
                
                // Confirma se `_outro` ainda tem vida
                if (_outro.vida_atual > 0) 
				{
                    _outro.estado = "hit";
                    _outro.image_index = 0;
                    _outro.vida_atual -= dano;
                    instance_destroy();
                }
            }        
        }
    } else {
        // Se `pai` não existe, pode destruir `obj_dano` para evitar erros
        instance_destroy();
    }
}
