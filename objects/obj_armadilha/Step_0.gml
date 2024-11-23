/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
//criando o dano
		if (image_index >= 0 && dano == noone)
		{
			dano = instance_create_layer(x, y, layer, obj_dano);
			dano.dano = ataque;
			dano.pai = id;
			// Define o tamanho específico do objeto de dano
		    dano.image_xscale = .3; // Altera a escala horizontal (2x maior)
		    dano.image_yscale = .3; // Altera a escala vertical (1.5x maior)
		}