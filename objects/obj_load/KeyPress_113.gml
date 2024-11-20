/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// Evento de tecla pressionada (F2) para carregar
if (keyboard_check_pressed(vk_f2)) {
    if (file_exists("savefile.txt")) {
        var _file = file_text_open_read("savefile.txt");
        var _json_string = file_text_read_string(_file); // Lê o conteúdo do arquivo
        file_text_close(_file);

        var _save_data = json_decode(_json_string); // Converte o JSON de volta para um mapa

        // Carrega os dados do mapa
        obj_player.vida_atual = ds_map_find_value(_save_data, "vida_atual");
        obj_player.vida_max = ds_map_find_value(_save_data, "vida_max");
		obj_player.energia_atual = ds_map_find_value(_save_data, "energia_atual");
		obj_player.energia_max = ds_map_find_value(_save_data, "energia_max");
        obj_player.x = ds_map_find_value(_save_data, "x");
        obj_player.y = ds_map_find_value(_save_data, "y");

        // Limpa o mapa
        ds_map_destroy(_save_data);

        // Mensagem de confirmação (opcional)
        show_message("Jogo carregado com sucesso!");
    } else {
        show_message("Nenhum arquivo de salvamento encontrado.");
    }
}