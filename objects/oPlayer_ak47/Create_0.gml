//caracteristicas do ataque da arma
attack_cooldown = 7
attack_push = 3
attack_push_spd = 0.4
function attack() {
	var _x_weapon_point = lengthdir_x(21,oPlayer.mouse_direction)
	var _y_weapon_point = lengthdir_y(21,oPlayer.mouse_direction)
	
	//cria uma nova bala
	bullet_instance = instance_create_layer(oPlayer.x+_x_weapon_point,oPlayer.y+_y_weapon_point,"instances", oAk47_bullet)
	bullet_instance.bullet_direction = oPlayer.mouse_direction// da a direção da nova bala
	
	//move o jogador para trás um pouco
	var _x_movement = lengthdir_x(attack_push_spd*-1,oPlayer.mouse_direction)
	var _y_movement = lengthdir_y(attack_push_spd*-1,oPlayer.mouse_direction)
	player_movement(_x_movement,_y_movement)
	
	//retorna o player para o estado livre
	oPlayer.state = player_states_free 
}