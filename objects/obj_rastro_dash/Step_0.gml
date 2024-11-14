// Evento Step do obj_rastro

// Diminui a opacidade gradualmente
image_alpha -= 0.03;

// Destroi o rastro quando a opacidade chega a zero
if (image_alpha <= 0) {
    instance_destroy();
}