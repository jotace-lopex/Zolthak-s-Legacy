/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// Evento de tecla pressionada (F1) para salvar
if (keyboard_check_pressed(vk_f1)) {
    var _save_data = ds_map_create(); // Cria um mapa de dados para armazenar informações

    // Adiciona dados ao mapa
    ds_map_add(_save_data, "vida_atual", obj_player.vida_atual);
    ds_map_add(_save_data, "vida_max", obj_player.vida_max);
	ds_map_add(_save_data, "energia_atual", obj_player.energia_atual);
	ds_map_add(_save_data, "energia_max", obj_player.energia_max);
    ds_map_add(_save_data, "x", obj_player.x);
    ds_map_add(_save_data, "y", obj_player.y);

    // Salva o mapa em um arquivo
    var _file = file_text_open_write("savefile.txt");
    var _json_string = json_encode(_save_data); // Converte o mapa para JSON
    file_text_write_string(_file, _json_string);
    file_text_close(_file);

    // Limpa o mapa
    ds_map_destroy(_save_data);

    // Mensagem de confirmação (opcional)
    show_message("Jogo salvo com sucesso!");
}