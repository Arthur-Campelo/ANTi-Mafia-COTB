
//receber dano e apagar a bala q acertou (código novo)
get_damaged(oDamage_enemy)
	
//olhar para  o player
player_dir = point_direction(x,y,oPlayer.x,oPlayer.y)
if (player_dir<270 and player_dir>90){
		face = 1
	} else {
		face = -1
	}
	
	
//colisão com outro inimigo

if place_meeting(x + xspd , y + yspd , oEnemy) { //checa há colisão com outro inimigo
    var _enemy = instance_place(x + xspd , y + yspd , oEnemy);
    if instance_exists(_enemy) {
        // direção do inimigo 
        var _enemy_dir = point_direction(x, y, _enemy.x, _enemy.y);
        // faz andar na direção oposta do inimigo
        xspd = lengthdir_x(spd, _enemy_dir + 180);
        yspd = lengthdir_y(spd, _enemy_dir + 180);
    }
}