attack_cooldown = 15
function attack() {
	var _x_weapon_point = lengthdir_x(21,oPlayer.mouse_direction)
	var _y_weapon_point = lengthdir_y(21,oPlayer.mouse_direction)
	
	//cria uma nova bala
	bullet_instance = instance_create_layer(oPlayer.x+_x_weapon_point,oPlayer.y+_y_weapon_point,"instances", oAk47_bullet)
	bullet_instance.bullet_direction = oPlayer.mouse_direction// da a direção da nova bala
	oPlayer.state = player_states_free //retorna o player para o estado livre
}