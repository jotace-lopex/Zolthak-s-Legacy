/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// Reduz a opacidade gradativamente
image_alpha -= desaparecer_velocidade;

// Destrói o objeto quando estiver completamente invisível
if (image_alpha <= 0) {
    instance_destroy();
}