// Press Enter
if (index == 0) {
    global.sound_effects_on = !global.sound_effects_on;
} else if (index == 1) {
    global.music_on = !global.music_on;
    if (!global.music_on) {
        if (global.room_music != noone) {
            audio_stop_sound(global.room_music);
        }
    } else {
        // Restart the music based on the current room
        if (room == rm_menu) {
            global.room_music = audio_play_sound(snd_inicial, 1, true);
        } else if (room == rm_jogo || room == rm_creditos) {
            global.room_music = audio_play_sound(snd_inicial, 1, true);
        } else if (room == rm_configuracao) {
            global.room_music = audio_play_sound(snd_inicial, 1, true);
        }
    }
} else if (index == 2) {
    room_goto(rm_menu);
}