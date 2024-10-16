function player_states_free(_up,_down,_left,_right) {
	//se está se movendo ele mexe mais rápido sprite
	if moving {
		image_speed=2.5
	} else {
		image_speed=1
	}

	//direção do movimento
	var _horizontal = _right-_left
	var _vertical = _down - _up
	moveDir = point_direction(0,0,_horizontal,_vertical)
	if moving {
		last_direction = moveDir;
	}
	
	//chama a função movimentador que de fato move o player ela vai ser utilizada sempre que o player se mover para checar colisão
	player_movement(_horizontal*oPlayer.move_spd,_vertical*oPlayer.move_spd)
	
	//atualiza a direção do mouse em relação ao player
	mouse_direction = point_direction(oPlayer.x,oPlayer.y,mouse_x,mouse_y)
	
	//direcionamento do personagi
	if(mouse_direction<45 or mouse_direction>300) {
		sprite_index = sPlayer_right
	} else if (mouse_direction<120) {
		sprite_index = sPlayer_up
	} else if(mouse_direction<225) {
		sprite_index = sPlayer_left
	} else {
		sprite_index = sPlayer
	}
	
	//dash
	if keyboard_check(vk_space) and can_dash {
		state = player_states_dash
	}
	
	//ataque
	if mouse_check_button(mb_left) and can_attack { 
		state = player_states_attack
		
	}
}

function player_states_dash(_up,_down,_left,_right) {
	
	var _direction
	
	
	//dá invencibilidade durante o dash 
	player_tangible = false
	//tira a habilidade de dar o dash
	can_dash = false
	//checa se está se movimentando p utilizar a direção atual ou a ultima direção de movimento
	if moving {
		_direction = moveDir
		
	} else {
		_direction = last_direction
	}
	
	//movimenta o player através da função criada pra isso
	var _x_move= lengthdir_x(dash_spd, _direction)
	var _y_move= lengthdir_y(dash_spd, _direction)
	player_movement(_x_move,_y_move)
	
	//incrementação para finalizar o dash
	dash_timer+=dash_spd
	//checa se o dash atravessou a quantia de espaços esperado
	if(dash_timer>= dash_length) {
		dash_timer = 0//reinicia o timer
		state = player_states_free //volta o player p estado livre
		
		alarm[0] = dash_invincibility // cria um alarme para tirar a invencibilidade q aciona outro p o dash cooldown
	}
}

function player_states_attack() {
	can_attack = false //não pode mais atacar até que volte
	weapon.attack()//o player faz a ação específica da arma especifíca que está equipada (a ação é uma função dentro do objt arma)
	alarm[2] = weapon.attack_cooldown // alarme p voltar o ataque
}
