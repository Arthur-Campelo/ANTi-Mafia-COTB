//caracteristicas do ataque da arma
attack_cooldown = 25
attack_push = 40
attack_push_spd = 10
bullet_number = 7
spread_angle = 90
function attack() {
	var _mouse_direction = oPlayer.mouse_direction
	var _x_weapon_point = lengthdir_x(23,_mouse_direction)
	var _y_weapon_point = lengthdir_y(23,_mouse_direction)
	var _bullet_angle = (spread_angle) / bullet_number-1
	
	//cria uma nova bala
	//bullet_instance = instance_create_layer(oPlayer.x+_x_weapon_point,oPlayer.y+_y_weapon_point,"instances", oShotgun_bullet)
	//bullet_instance.bullet_direction = _mouse_direction// da a direção da nova bala
	//faz o for para o número de balas 
	for (var i =0; i<bullet_number; i++) {
		bullet_instance = instance_create_layer(oPlayer.x+_x_weapon_point,oPlayer.y+_y_weapon_point,"instances", oShotgun_bullet)
		bullet_instance.bullet_direction = 20+_mouse_direction - spread_angle/2 + (_bullet_angle*i)// da a direção da nova bala
		//bullet_direction = mouse_direction - spread_angle/2 +
	}
	
	//move o jogador para trás um pouco
	var _x_movement = lengthdir_x(attack_push_spd*-1,_mouse_direction)
	var _y_movement = lengthdir_y(attack_push_spd*-1,_mouse_direction)
	player_movement(_x_movement,_y_movement)
	
	//retorna o player para o estado livre
	oPlayer.state = player_states_free 
}