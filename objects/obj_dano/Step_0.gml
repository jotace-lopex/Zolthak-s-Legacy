/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
var _outro = instance_place(x, y, obj_entidade);

if (_outro) {
    // Verifica se `pai` ainda existe para evitar erros
    if (instance_exists(pai)) {
        // Se `_outro` não é o pai
        if (_outro.id != pai) {
            
            // Checa o tipo do pai de `_outro`
            var _ipai = object_get_parent(_outro.object_index);
            if (_ipai != object_get_parent(pai.object_index)) {
                
                // Confirma se `_outro` ainda tem vida
                if (_outro.vida_atual > 0) {
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
