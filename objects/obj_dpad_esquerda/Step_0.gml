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

// Verifica se o botão foi pressionado
var _is_pressed = false;

for (var _i = 0; _i < 5; _i++) {
    if (device_mouse_check_button(_i, mb_left)) 
	{
        var _touch_x = device_mouse_x_to_gui(_i);
        var _touch_y = device_mouse_y_to_gui(_i);

        if (point_in_rectangle(_touch_x, _touch_y, _left, _top, _right, _bottom)) 
		{
            _is_pressed = true;
            break;
        }
    }
}

// Resultado da interação
if (_is_pressed) 
{
    toque = true;
}
else 
{
	toque = false;
}

