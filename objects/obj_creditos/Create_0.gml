opcoes = ["Voltar"];
index = 0;
op_max = array_length(opcoes)


// margem do menu
margem = 0;

// Evento Create do obj_creditos

// Obtendo as dimensões da tela da interface
gui_largura = display_get_gui_width();
gui_altura = display_get_gui_height();

// Definindo a posição inicial para os créditos (inicia fora da tela)
y_position = gui_altura;  // Posição inicial para os créditos (fora da tela)

scroll_speed = 1;  // Velocidade de rolagem (ajuste conforme necessário)

// Informações dos créditos
creditos_texto_1 = "Programadores: João Guilherme, João Carlos, Maria Eduarda";
creditos_texto_2 = "Pixel Arte: João Carlos, João Guilherme";
creditos_texto_3 = "Efeitos sonoros: Zaina Valeska, João Guilherme, Maria Eduarda";
creditos_texto_4 = "Beta tester: Samuel Santos";
creditos_texto_5 = "Diretor de Arte: Maria Eduarda";

// Créditos de Músicas
creditos_musica_1 = "OST Abandoned Castle - Castlevania: Curse of Darkness - Composer: Michiru Yamane";
creditos_musica_2 = "Golden Sun The Lost Age - Boss Battle! - Composer: Motoi Sakuraba";
creditos_musica_3 = "Successor Of Fate - Theme Juste Belmont - Castlevania: Harmony of Dissonance - Composer: Soshiro Hokkai, Michiru Yamane e Arr. By Jorge D.Fuentes)";
creditos_musica_4 = "Bloody Tears - Castlevania II: Simon's Quest - Cover by FamilyJules (https://www.youtube.com/watch?v=NohjpGt5SvM)"; 
creditos_musica_5 = "Ruins of Alph/Union Cave Pokémon G/S Guitar Cover - By FamilyJules (https://www.youtube.com/watch?v=53gBfnkEU6I)";
creditos_musica_6 = "Pokémon Red and Blue - Lavender Town Theme Intense Symphonic Metal Cover - By FalKKone (https://www.youtube.com/watch?v=jQ2M9ass1pU)";

// Créditos de Sprites
creditos_sprites_1 = "Autor: Chierit - Cthulu - (https://chierit.itch.io/free-cthulu)";
creditos_sprites_2 = "Autor: Chierit - Boss Demon Slime - (https://chierit.itch.io/boss-demon-slime)";
creditos_sprites_3 = "Autor: Luiz Melo - Monsters & Creatures Fantasy - (https://luizmelo.itch.io/monsters-creatures-fantasy)";
creditos_sprites_4 = "Autor: Brullov - 2D Platformer - (https://brullov.itch.io/2d-platformer-asset-pack-castle-of-despair)";
creditos_sprites_5 = "Autor: RVROS - Animated Pixel Hero - (https://rvros.itch.io/animated-pixel-hero)";
creditos_sprites_6 = "Autor: BDragon1727 - (https://bdragon1727.itch.io)";
creditos_sprites_7 = "Autor: Arturo Anci - (https://x.com/arturo_anci?mx=2)";
creditos_sprites_8 = "Autor: Metal Slug - Database (http://laurelyn.folio.free.fr/Pixi/Steam/METAL%20SLUG/Anims/bg/096.gif)";
creditos_sprites_9 = "Autor: Luiz Melo - (https://luizmelo.itch.io/ghost-warrior-3)";
creditos_sprites_10= "Autor: Luiz Melo - (https://luizmelo.itch.io/dark-knight)";

// Agradecimentos Especiais
agradecimentos = "NONECLASS (https://noneclass.com.br) por nos ajudar do início ao fim na construção do jogo";

// Créditos de Efeitos Sonoros
creditos_som_1 = "Sons de Impacto e Vozes: The King Of Fighters 99 Evolution Miscellaneous Dreamcast";
creditos_som_2 = "Voz do Personagem: 'ADD' Personagem do Jogo Elsword - Level Up e Koge Games";
creditos_som_3 = "Som da Suprema: Kamehameha do Personagem Goku de Dragon Ball - Bandai Namco";

// Créditos da Logo
creditos_logo = "Autoral da Equipe - Feita com recursos do Open Source";



