audio_sound_gain(snd_primeiro_mapa, 0.2, 0); // Volume da música definido para 30%


if (global.music_on) {
    if (room == rm_jogo && !audio_is_playing(snd_primeiro_mapa)) {
        global.room_music = audio_play_sound(snd_primeiro_mapa, 1, true);
    } else if ((room == rm_menu || room == rm_configuracao) && !audio_is_playing(snd_menu)) {
        global.room_music = audio_play_sound(snd_menu, 1, true);
    } else if (room == rm_creditos && !audio_is_playing(snd_menu)) {
        global.room_music = audio_play_sound(snd_menu, 1, true);
    }
} else {
    if (global.room_music != noone) {
        audio_stop_sound(global.room_music);
    }
}