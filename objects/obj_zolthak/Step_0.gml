/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

switch(state) {
    case "fade_in":
        alpha += fade_in_speed; // aumenta a transparência para exibir logo
        if (alpha >= 1) {
            alpha = 1;
            state = "display"; // muda para estado de exibição
            timer = logo_duration;
        }
        break;

    case "display":
        timer -= 1;
        if (timer <= 0) {
            state = "fade_out"; // muda para fade out após o tempo de exibição
        }
        break;

    case "fade_out":
        alpha -= fade_out_speed;
        if (alpha <= 0) {
            alpha = 0;
            room_goto(rm_menu); // transição para o menu do jogo
        }
        break;
}