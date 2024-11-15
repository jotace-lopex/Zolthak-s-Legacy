/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Inherit the parent event
event_inherited();
// Coordenadas do botão na GUI
var _gui_x = x;
var _gui_y = y;

// Calcula as coordenadas da área de toque centralizada na GUI
var _left = _gui_x - desired_width / 2;
var _right = _gui_x + desired_width / 2;
var _top = _gui_y - desired_height / 2;
var _bottom = _gui_y + desired_height / 2;

toque = device_mouse_check_button(0, mb_left) &&
        point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), _left, _top, _right, _bottom);

