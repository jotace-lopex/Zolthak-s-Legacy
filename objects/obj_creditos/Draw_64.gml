draw_set_font(fnt_fnt_menu);

var dist = 50;
var gui_largura = display_get_gui_width();
var gui_altura = display_get_gui_height();
var x1=gui_largura/2;
var y1=gui_altura/2;

for(var i=0;i<op_max;i++){
	if(opcoes[i] == "Voltar"){
		// Desenha o texto "Voltar" no canto inferior centralizado
		draw_set_halign(fa_center);
		draw_set_valign(fa_bottom);
		x1 = gui_largura / 2; // Centraliza na horizontal
		y1 = gui_altura - 30; // Posiciona no canto inferior
	}else{
		// Desenha os outros textos no centro da tela
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		x1 = gui_largura/2;
		y1 = gui_altura/2 + (30 * i);
	}
	
	if(index == i){
		draw_set_color(c_yellow);
	}else{
		draw_set_color(c_white);
	}
	
	draw_text(x1, y1, opcoes[i]);
}
draw_set_font(-1);

var creditos = " ai lula ";
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
draw_text(gui_largura/2, gui_altura/2, creditos);
