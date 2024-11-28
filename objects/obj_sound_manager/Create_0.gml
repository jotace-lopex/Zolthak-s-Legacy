// Evento Create
if (!variable_global_exists("music_on")) global.music_on = true;
if (!variable_global_exists("sound_effects_on")) global.sound_effects_on = true;

global.room_music = noone; // Inicializa a variável para armazenar a música atual
global.next_room = noone; // Inicializa a próxima sala
global.last_room = noone; // Inicializa a última sala para controle de transição
