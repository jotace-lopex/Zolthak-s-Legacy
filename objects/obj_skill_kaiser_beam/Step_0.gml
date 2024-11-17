// Destruindo o beam ao final da animação
image_xscale = obj_player.image_xscale
if (image_index >= image_number - 1) {
    instance_destroy();
}