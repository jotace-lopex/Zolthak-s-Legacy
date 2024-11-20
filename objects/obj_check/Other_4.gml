// Room Start de cada sala principal
if (!instance_exists(obj_sound_manager)) {
    instance_create_layer(x, y, "Instances", obj_sound_manager);
}


if (!global.music_on) {
    audio_stop_all();
}