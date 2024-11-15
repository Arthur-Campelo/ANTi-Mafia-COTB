//pega os controles
var _up = keyboard_check(ord("W"))
var _down = keyboard_check(ord("S"))
var _left  = keyboard_check(ord("A"))
var _right = keyboard_check(ord("D")) 
var _weapon_change = mouse_check_button_pressed(mb_right)
mouse_direction = point_direction(x,y,mouse_x,mouse_y)

//sistema de dano
get_damaged(oDamage_player, iframes)


//checa se está se movendo -> precisa ser retrabalhada no futuro
if((_up+_down+_left+_right)>0) {
		moving = true
		move_spd = (move_spd >= 2) ? 2 : move_spd + 0.05;
	} else {
		moving = false
		move_spd = 0.7
	}
	
//troca a arma caso o jogador queira
if _weapon_change {
	weapon_index++
	weapon = weapon_list[weapon_index%weapon_list_size]
}
	
// Destruir a instância da arma anterior se existir
if instance_exists(weapon_instance) {
    instance_destroy(weapon_instance);
}
//cria a arma que o jogador utiliza
weapon_instance = instance_create_layer(x,y, "Instances", weapon)
// Atualiza a posição e direção da arma que o jogador utiliza
weapon_movement()


//inicia o script de estados de jogador
state(_up,_down,_left,_right)