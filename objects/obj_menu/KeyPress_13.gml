if (keyboard_check_pressed(vk_enter)) {
    if (atual == 0) room_goto(rm_jogo);
    if (atual == 1) room_goto(rm_configuracao);
    if (atual == 2) room_goto(rm_creditos);
    if (atual == 3) game_end();
}
