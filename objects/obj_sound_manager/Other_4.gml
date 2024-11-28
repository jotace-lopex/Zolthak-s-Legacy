// Evento Room Start
global.next_room = room; // Define a sala atual como a próxima sala

// Configuração do volume (ajusta volumes para cada música)
audio_sound_gain(snd_primeiro_mapa, 0.6, 0);
audio_sound_gain(snd_primeiro_boss, 0.6, 0);
audio_sound_gain(snd_menu, 0.6, 0);

// Controle da música
if (global.music_on)
{
    // Música para rm_jogo e rm_jogo_2 (continua sem interrupções entre essas salas)
    if ((room == rm_jogo || room == rm_jogo_2)) 
    {
        if (global.room_music != snd_primeiro_mapa) 
        {
            if (global.room_music != noone) {
                audio_stop_sound(global.room_music); // Para a música anterior
            }
            global.room_music = snd_primeiro_mapa; // Define a nova música como atual
            if (!audio_is_playing(global.room_music)) {
                audio_play_sound(global.room_music, 1, true); // Toca a música apenas se não estiver tocando
            }
        }
    }
    // Música para rm_jogo_3 (troca a música se não for a correta)
    if (room == rm_jogo_3) 
    {
        if (global.room_music != snd_primeiro_boss) 
        {
            if (global.room_music != noone) {
                audio_stop_sound(global.room_music); // Para a música anterior
            }
            global.room_music = snd_primeiro_boss; // Define a nova música como atual
            if (!audio_is_playing(global.room_music)) {
                audio_play_sound(global.room_music, 1, true); // Toca a música apenas se não estiver tocando
            }
        }
    }
	// Música para rm_jogo_3 (troca a música se não for a correta)
    if (room == rm_jogo_6) 
    {
        if (global.room_music != snd_lavender_town_metal) 
        {
            if (global.room_music != noone) {
                audio_stop_sound(global.room_music); // Para a música anterior
            }
            global.room_music = snd_lavender_town_metal; // Define a nova música como atual
            if (!audio_is_playing(global.room_music)) {
                audio_play_sound(global.room_music, 1, true); // Toca a música apenas se não estiver tocando
            }
        }
    }
	// Música para rm_jogo_3 (troca a música se não for a correta)
    if (room == rm_jogo_5) 
    {
        if (global.room_music != snd_bloody_tears) 
        {
            if (global.room_music != noone) {
                audio_stop_sound(global.room_music); // Para a música anterior
            }
            global.room_music = snd_bloody_tears; // Define a nova música como atual
            if (!audio_is_playing(global.room_music)) {
                audio_play_sound(global.room_music, 1, true); // Toca a música apenas se não estiver tocando
            }
        }
    }
	
	// Música para rm_jogo_3 (troca a música se não for a correta)
    if (room == rm_jogo_7) 
    {
        if (global.room_music != snd_ruins_of_alph) 
        {
            if (global.room_music != noone) {
                audio_stop_sound(global.room_music); // Para a música anterior
            }
            global.room_music = snd_ruins_of_alph; // Define a nova música como atual
            if (!audio_is_playing(global.room_music)) {
                audio_play_sound(global.room_music, 1, true); // Toca a música apenas se não estiver tocando
            }
        }
    }
    // Música para rm_menu e rm_configuracao
    if (room == rm_menu || room == rm_configuracao) 
    {
        if (global.room_music != snd_menu) 
        {
            if (global.room_music != noone) {
                audio_stop_sound(global.room_music); // Para a música anterior
            }
            global.room_music = snd_menu; // Define a nova música como atual
            if (!audio_is_playing(global.room_music)) {
                audio_play_sound(global.room_music, 1, true); // Toca a música apenas se não estiver tocando
            }
        }
    }
    // Música para rm_creditos
    if (room == rm_creditos) 
    {
        if (global.room_music != snd_menu) 
        {
            if (global.room_music != noone) {
                audio_stop_sound(global.room_music); // Para a música anterior
            }
            global.room_music = snd_menu; // Define a nova música como atual
            if (!audio_is_playing(global.room_music)) {
                audio_play_sound(global.room_music, 1, true); // Toca a música apenas se não estiver tocando
            }
        }
    }
} 
else 
{
    // Desliga a música se 'music_on' estiver desativada
    if (global.room_music != noone) 
    {
        audio_stop_sound(global.room_music); // Para qualquer música
        global.room_music = noone; // Reseta a variável
    }
}







//// Evento Room Start (com verificação robusta para a música)
//global.next_room = room; // Define a sala de transição

//// Configuração do volume
//audio_sound_gain(snd_primeiro_mapa, 0.6, 0);
//audio_sound_gain(snd_primeiro_boss, 0.6, 0);
//audio_sound_gain(snd_menu, 0.6, 0);

//// Controle da música
//if (global.music_on) 
//{
//    // Verifique se a música deve ser tocada para rm_jogo e rm_jogo_2
//    if ((room == rm_jogo || room == rm_jogo_2)) 
//    {
//        if (global.room_music != snd_primeiro_mapa && !audio_is_playing(snd_primeiro_mapa)) 
//        {
//            // Para a música anterior se houver
//            if (global.room_music != noone) audio_stop_sound(global.room_music);
            
//            // Toca a música do primeiro mapa
//            global.room_music = audio_play_sound(snd_primeiro_mapa, 1, true);
//        }
//    }
//    // Música para rm_menu e rm_configuracao
//    else if ((room == rm_menu || room == rm_configuracao)) 
//    {
//        if (global.room_music != snd_menu && !audio_is_playing(snd_menu)) 
//        {
//            // Para a música anterior se houver
//            if (global.room_music != noone) audio_stop_sound(global.room_music);
            
//            // Toca a música do menu
//            global.room_music = audio_play_sound(snd_menu, 1, true);
//        }
//    } 
//    // Música para rm_creditos
//    else if (room == rm_creditos) 
//    {
//        if (global.room_music != snd_menu && !audio_is_playing(snd_menu)) 
//        {
//            // Para a música anterior se houver
//            if (global.room_music != noone) audio_stop_sound(global.room_music);
            
//            // Toca a música dos créditos
//            global.room_music = audio_play_sound(snd_menu, 1, true);
//        }
//    }
//} 
//else 
//{
//    // Desliga a música se 'music_on' estiver desativada
//    if (global.room_music != noone) 
//    {
//        audio_stop_sound(global.room_music);
//        global.room_music = noone;
//    }
//}
