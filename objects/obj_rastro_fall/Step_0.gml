// No evento Step do obj_rastro:
image_xscale = obj_player.image_xscale
image_alpha -= 0.05; // Reduz a transparência gradativamente
if (image_alpha <= 0) {
    instance_destroy(); // Destroi a instância quando está totalmente transparente
}