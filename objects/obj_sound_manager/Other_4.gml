if (global.music_on) {
    if (room == rm_jogo && !audio_is_playing(snd_inicial)) {
        global.room_music = audio_play_sound(snd_inicial, 1, true);
    } else if ((room == rm_menu || room == rm_configuracao) && !audio_is_playing(snd_inicial)) {
        global.room_music = audio_play_sound(snd_inicial, 1, true);
    } else if (room == rm_creditos && !audio_is_playing(snd_inicial)) {
        global.room_music = audio_play_sound(snd_inicial, 1, true);
    }
} else {
    if (global.room_music != noone) {
        audio_stop_sound(global.room_music);
    }
}