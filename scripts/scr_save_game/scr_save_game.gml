// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function save_game() {
    var _save_data = ds_map_create(); // Cria um mapa de dados

    // Adiciona dados ao mapa (exemplo)
    ds_map_add(_save_data, "vida_atual", obj_player.vida_atual);
    ds_map_add(_save_data, "vida_max", obj_player.vida_max);
	ds_map_add(_save_data, "energia_atual", obj_player.energia_atual);
	ds_map_add(_save_data, "energia_max", obj_player.energia_max);
    ds_map_add(_save_data, "x", obj_player.x);
    ds_map_add(_save_data, "y", obj_player.y);

    // Salva o mapa em um arquivo JSON
    var _file = file_text_open_write("savefile.json");
    var _json_string = json_encode(_save_data); // Converte o mapa para JSON
    file_text_write_string(_file, _json_string);
    file_text_close(_file);

    // Limpa o mapa
    ds_map_destroy(_save_data);

    show_message("Jogo salvo com sucesso!");
}