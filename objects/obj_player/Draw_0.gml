/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Inherit the parent event
event_inherited();
if (show_level_up_message) 
{
    draw_set_color(c_yellow);
    draw_set_halign(fa_center);
    draw_text(x, y - 50, "Level UP!!!");
    draw_set_halign(fa_left); // Reseta o alinhamento
}

