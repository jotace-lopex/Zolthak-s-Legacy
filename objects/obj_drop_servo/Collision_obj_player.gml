/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


var _exists_servo = false;

// Verifica todos os objetos na camada atual
with (all) {
    if (layer == obj_drop_servo.layer && string_copy(object_get_name(object_index), 1, 9) == "obj_servo") {
        _exists_servo = true;
        break;
    }
}

    // Somente cria o obj_servo_eyokiri se não existir outro objeto "obj_servo" na camada
if (!_exists_servo) {
    var _servo = instance_create_layer(obj_player.x, obj_player.y, layer, obj_servo_eyokiri);
    _servo.image_alpha = 0;
}
	
instance_destroy();