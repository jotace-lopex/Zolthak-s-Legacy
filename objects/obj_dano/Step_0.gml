/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
var _outro;
var _outro_lista = ds_list_create();
var _quantidade = instance_place_list(x, y, obj_entidade, _outro_lista, 0);

//adicionando todo mund o que eu toquei na lista de aplicar dano
for (var _i = 0; _i < _quantidade; _i++)
{
	//checando o atual
	var _atual = _outro_lista[| _i];
	
	//show_message(object_get_name(_atual.object_index));
	
	//checando se a colisão não é com filho do proprio pai
	if (object_get_parent(_atual.object_index) != object_get_parent(pai.object_index))
	{
		//isso só vai rodar se eu puder dar dano no coisinho
		
		//checar se eu realmente posso dar dano
		
		//checar se o atual já esta na lista
		var _pos = ds_list_find_index(aplicar_dano, _atual);
		if (_pos == -1)
		{
			//o atual ainda não esta na minha lista de dano
			//adiciono o atual a lista de dano
			ds_list_add(aplicar_dano, _atual);
		}
	}
}

//aplicando o dano
var _tam = ds_list_size(aplicar_dano);
for (var _i = 0; _i < _tam; _i++)
{
	_outro = aplicar_dano[| _i].id;
	if (_outro.vida_atual > 0) 
	{
	    _outro.estado = "hit";
	    _outro.image_index = 0;
	    _outro.vida_atual -= dano;
	}
}


ds_list_destroy(aplicar_dano);
ds_list_destroy(_outro_lista);
instance_destroy();
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
