// Obter posição da câmera
var _cam_x = camera_get_view_x(view_camera[0]); // Posição X da câmera
var _cam_y = camera_get_view_y(view_camera[0]); // Posição Y da câmera

layer_x("Background_1", _cam_x);
layer_y("Background_1", _cam_y);

layer_x("Background_2", _cam_x * 0.5);


