window_set_size(1080,720)

depth = 0

state = player_states_free;



move_spd =0.7
moving = false
player_tangible = true

moveDir = 270
last_direction = 270

can_dash=true
dash_spd = 4.5
dash_length = dash_spd*9
dash_timer = 0
dash_cooldown = 30
dash_invincibility = 12

weapon_instance = noone
can_attack = true
attack_timer = 0

//lista de armars e variável para management da lista de armas
	weapon_index = 0 
	weapon_list_size = 4
	
	//iniciando cada arma manualmente p facilitar a visualização
		weapon_list = array_create(weapon_list_size)
		weapon_list[0] = oPlayer_spear
		weapon_list[1] = oPlayer_pistol
		weapon_list[2] = oPlayer_ak47
		weapon_list[3] = oPlayer_shotgun
	//da o valor da arma escolhida
	weapon = weapon_list[weapon_index]