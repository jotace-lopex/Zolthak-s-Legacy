// Coordenadas do botão na GUI
var _gui_x = x;
var _gui_y = y;

// Calcula as coordenadas da área de toque centralizada na GUI
var _left = _gui_x - desired_width / 2;
var _right = _gui_x + desired_width / 2;
var _top = _gui_y - desired_height / 2;
var _bottom = _gui_y + desired_height / 2;

// Verifique se o botão do mouse foi pressionado uma vez e se o cursor está na área específica
if (mouse_check_button_pressed(mb_left) &&
    point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), _left, _top, _right, _bottom)) 
	{
    
    // Registre o clique, pois foi detectado uma única vez e está na área desejada
    toque = true;
	} 
else 
{
    toque = false;
}