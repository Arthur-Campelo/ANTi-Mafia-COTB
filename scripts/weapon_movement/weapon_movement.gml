function weapon_movement(){
	weapon.x = x;  // Alinha a posição horizontal da arma com o jogador
	weapon.y = y;  // Alinha a posição vertical da arma com o jogador
	weapon.image_angle = mouse_direction-90;  // Direção da arma baseada no mouse
	if (mouse_direction>90 and mouse_direction<270){
		weapon.image_xscale = -1
	} else {
		weapon.image_xscale = 1
	}
	if (mouse_direction >= 0 and mouse_direction < 180) {
		weapon_instance.depth=1
	} else {
		weapon_instance.depth=-1
	}
}