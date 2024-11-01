/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


// criando as estruturas do meu menu

opcao1 =
{
	texto : "Iniciar Jogo",
	
	funcao : function()
	{
		room_goto(Room1);
	},
}
opcao2 =
{
	texto : "Configurações",
}
opcao3 =
{
	texto: "Créditos",
}
opcao4 =
{
	texto : "Sair",
	
	funcao : function()
	{
		game_end();
	},
}

//menu
menu = [opcao1, opcao2, opcao3, opcao4];

// variavel para saber qual o indice atual
atual = 0;

// margem do menu
margem = 0;