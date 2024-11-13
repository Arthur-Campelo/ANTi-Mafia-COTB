event_inherited()//orienta o sprite e checa se o inimigo tomou dano e checa colisão com outro inimigo

//checa se a vida chegou a zero e apaga o inimigo
if (hp<=0) {
	//animação de morte
	instance_destroy(self)
}
//movimentação
if(point_distance(x,y,oPlayer.x,oPlayer.y)<=40) {//caso esteja muito perto corre
	//backUp
	xspd = lengthdir_x(spd/1.5,player_dir)*-1
	yspd = lengthdir_y(spd/1.5,player_dir)*-1
	
	//attack no futuro
	
} else if (point_distance(x,y,oPlayer.x,oPlayer.y)>=50){// caso esteja mt longe aproxima
	xspd = lengthdir_x(spd,player_dir)
	yspd = lengthdir_y(spd,player_dir)
} else {
	//caso esteja entre 40 e 50 px movimenta-se aleatoriamente para ficar bnt
	if (random(1) < 0.02) { // Pequena chance de mudar a direção
	    var _random_dir = irandom_range(0, 359);
	    target_xspd = lengthdir_x(spd/6, _random_dir);
	    target_yspd = lengthdir_y(spd/6, _random_dir);
	}

	// Interpolar a velocidade para suavizar a transição
	xspd = lerp(xspd, target_xspd, 0.1);
	yspd = lerp(yspd, target_yspd, 0.1);
}



//colisão com outro inimigo
if place_meeting(x + xspd , y + yspd , oEnemy) { //checa havera colisão com outro inimigo
    var _enemy = instance_place(x + xspd , y + yspd , oEnemy);
    if instance_exists(_enemy) {
        // direção do inimigo 
        var _enemy_dir = point_direction(x, y, _enemy.x, _enemy.y);
        // faz andar na direção oposta do inimigo
        xspd = lengthdir_x(spd, _enemy_dir + 180);
        yspd = lengthdir_y(spd, _enemy_dir + 180);
    }
}

if place_meeting(x + xspd , y, oSolid_parent) {
	xspd = 0
}
if place_meeting(x,y+yspd, oSolid_parent) {
	yspd=0
}

//finalizar a movimentação
x += xspd
y += yspd

