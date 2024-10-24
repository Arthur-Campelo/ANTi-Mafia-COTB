attack_spd = 2.5
attack_length = attack_spd*10
attack_cooldown = 13
attack_timer = 0

function attack() {
	//adicionar animação de ataque
	oPlayer.attack_timer+=attack_spd //serve como o timer para o ataque
	
	//armazena a movimentação do player e o move utilizando a função q checa colisão
	var _x_move=lengthdir_x(attack_spd, oPlayer.mouse_direction)
	var _y_move=lengthdir_y(attack_spd, oPlayer.mouse_direction)
	player_movement(_x_move,_y_move)
	
	//checa se a movimentação do ataque já chegou ao final
	if(oPlayer.attack_timer>= attack_length) {
		sprite_index = sPlayer_spear //retorna o sprite normal
		oPlayer.attack_timer = 0
		oPlayer.state = player_states_free//volta o player p estado livre
	}
}