// Evento Step
if (!global.music_on && audio_is_playing(global.room_music)) {
    audio_stop_sound(global.room_music); // Para a música
    global.room_music = noone; // Limpa a referência da música
}
