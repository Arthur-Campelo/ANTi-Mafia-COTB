if oPlayer.state == player_states_attack {
	//checa colisão
	colision = instance_place(x,y, all)
	
	if variable_instance_exists(colision,"type") { //se a colisão tiver tipo
		if (colision.type == "enemy") {// e o tipo for inimigo
			instance_destroy(colision) // destroi inimigo
		}
	}
}

