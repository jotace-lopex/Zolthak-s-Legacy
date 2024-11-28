/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// Reduz a opacidade gradativamente
if (instance_exists(obj_player)) {
    // Faz o efeito de cura seguir o jogador
    x = obj_player.x;
    y = obj_player.y;
}
image_alpha -= desaparecer_velocidade;

// Destrói o objeto quando estiver completamente invisível
if (image_alpha <= 0) {
    instance_destroy();
}