// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function player_movement(_x_move,_y_move){
	with(oPlayer) {
		//normaliza o movimento na diagonal
		if (_x_move>0 and _y_move>0) {
			_x_move *=0.707
			_x_move *=0.707
		}
		//checa colisão e move x
		if !(place_meeting(oPlayer.x+_x_move,oPlayer.y,oBloco)) {
			oPlayer.x +=_x_move
		}
		//checa colisão e move y
		if !(place_meeting(oPlayer.x,oPlayer.y+_y_move,oBloco)) {
			oPlayer.y +=_y_move
		}
	}
}