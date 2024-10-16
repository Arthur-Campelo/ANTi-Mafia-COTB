// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function player_movement(_x_move,_y_move){
	with(oPlayer) {
		if !(place_meeting(oPlayer.x+_x_move,oPlayer.y,oBloco)) {
			oPlayer.x +=_x_move
		}
		if !(place_meeting(oPlayer.x,oPlayer.y+_y_move,oBloco)) {
			oPlayer.y +=_y_move
		}
	}
}