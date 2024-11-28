// Evento Room End
global.last_room = room; // Armazena a sala anterior

// Apenas para rm_jogo e rm_jogo_2, a música não deve ser parada
if (!(room == rm_jogo || room == rm_jogo_2)) {
    if (global.room_music != noone) {
        audio_stop_sound(global.room_music); // Para a música se for outra sala
        global.room_music = noone;
    }
}
