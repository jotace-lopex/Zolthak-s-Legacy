// Evento Draw do obj_creditos

// Definir a cor e fonte dos créditos
draw_set_font(fnt_arial_bold);
draw_set_color(c_yellow);

// Desenhando o título "Créditos"
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(gui_largura / 2, y_position - 40, "Créditos");  // Créditos no topo

// Desenhando os textos dos créditos
var y_offset = y_position;

draw_set_color(c_white);
draw_text(gui_largura / 2, y_offset, creditos_texto_1);  // Programadores
y_offset += 30;
draw_text(gui_largura / 2, y_offset, creditos_texto_2);  // Pixel Arte
y_offset += 30;
draw_text(gui_largura / 2, y_offset, creditos_texto_3);  // Efeitos Sonoros
y_offset += 30;
draw_text(gui_largura / 2, y_offset, creditos_texto_4);  // Beta tester
y_offset += 30;
draw_text(gui_largura / 2, y_offset, creditos_texto_5);  // Diretor de Arte

// Adicionando os créditos de música (com título "Músicas")
y_offset += 40; // Espaço entre a seção de créditos e a de músicas
draw_set_color(c_yellow);
draw_text(gui_largura / 2, y_offset, "Músicas");
y_offset += 30; // Espaço para a lista de músicas
draw_set_color(c_white);
draw_text(gui_largura / 2, y_offset, creditos_musica_1);  // Música 1
y_offset += 30;
draw_text(gui_largura / 2, y_offset, creditos_musica_2);  // Música 2
y_offset += 30;
draw_text(gui_largura / 2, y_offset, creditos_musica_3);  // Música 3
y_offset += 30;
draw_text(gui_largura / 2, y_offset, creditos_musica_4);  // Música 4
y_offset += 30;
draw_text(gui_largura / 2, y_offset, creditos_musica_5);  // Música 5
y_offset += 30;
draw_text(gui_largura / 2, y_offset, creditos_musica_6);  // Música 6

// Adicionando os créditos de sprites (com título "Sprites")
y_offset += 40; // Espaço entre a seção de músicas e a de sprites
draw_set_color(c_yellow);
draw_text(gui_largura / 2, y_offset, "Sprites");
y_offset += 30; // Espaço para a lista de sprites
draw_set_color(c_white);
draw_text(gui_largura / 2, y_offset, creditos_sprites_1);  // Sprites Chierit Cthulu
y_offset += 30;
draw_text(gui_largura / 2, y_offset, creditos_sprites_2);  // Sprites Chierit Demon Slime
y_offset += 30;
draw_text(gui_largura / 2, y_offset, creditos_sprites_3);  // Sprites Luiz Melo Monsters
y_offset += 30;
draw_text(gui_largura / 2, y_offset, creditos_sprites_4);  // Sprites Brullov 2D Platformer
y_offset += 30;
draw_text(gui_largura / 2, y_offset, creditos_sprites_5);  // Sprites RVROS Animated Hero
y_offset += 30;
draw_text(gui_largura / 2, y_offset, creditos_sprites_6);  // Sprites BDragon1727
y_offset += 30;
draw_text(gui_largura / 2, y_offset, creditos_sprites_7);  // Sprite de barra de vida, energia e estamina
y_offset += 30;
draw_text(gui_largura / 2, y_offset, creditos_sprites_8);  // Sprite Burning City
y_offset += 30;
draw_text(gui_largura / 2, y_offset, creditos_sprites_9);  // Sprite Shynkir
y_offset += 30;
draw_text(gui_largura / 2, y_offset, creditos_sprites_10);  // Sprite Zarathos


// Adicionando os agradecimentos especiais
y_offset += 40; // Espaço entre a seção de sprites e a de agradecimentos
draw_set_color(c_yellow);
draw_text(gui_largura / 2, y_offset, "Agradecimentos Especiais");
y_offset += 30; // Espaço para o agradecimento especial
draw_set_color(c_white);
draw_text(gui_largura / 2, y_offset, agradecimentos);  // Agradecimento especial Noneclass

// Agora vamos adicionar a nova seção para os Efeitos Sonoros
y_offset += 40; // Espaço entre a seção de agradecimentos e os efeitos sonoros
draw_set_color(c_yellow);
draw_text(gui_largura / 2, y_offset, "Efeitos Sonoros");
y_offset += 30; // Espaço para a lista de efeitos sonoros
draw_set_color(c_white);
draw_text(gui_largura / 2, y_offset, creditos_som_1); // Efeitos Sonoros
y_offset += 30;
draw_text(gui_largura / 2, y_offset, creditos_som_2); // Voz do ADD
y_offset += 30;
draw_text(gui_largura / 2, y_offset, creditos_som_3); // Som da Suprema


// Adicionando os créditos da Logo
y_offset += 40; // Espaço entre a seção de agradecimentos e os créditos da logo
draw_set_color(c_yellow);
draw_text(gui_largura / 2, y_offset, "Logos do Jogo e Empresa");
y_offset += 30; // Espaço para a lista de créditos da logo
draw_set_color(c_white);
draw_text(gui_largura / 2, y_offset, creditos_logo);  // Créditos da Logo

// Desenha o texto "Voltar" no canto inferior centralizado
var voltar_x = gui_largura / 15;  // Centraliza horizontalmente
var voltar_y = gui_altura - 650;  // Coloca o texto "Voltar" perto do fundo

// Desenha o texto "Voltar"
draw_set_font(fnt_fnt_menu);  // Definindo a fonte
draw_set_color(c_red);        // Cor do texto
draw_set_halign(fa_center);     // Centraliza horizontalmente
draw_set_valign(fa_bottom);     // Coloca o texto no fundo da tela
draw_text(voltar_x, voltar_y, "Voltar");  // Desenha o texto "Voltar"
