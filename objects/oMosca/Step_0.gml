//checa se ouve colisão com alguem q da dano em inimigo
if place_meeting(x,y, oDamage_enemy) {
	var _attacker = instance_place(x,y,oDamage_enemy) 
	hp -= _attacker.damage
	if variable_instance_exists(_attacker, "destroy") {
		_attacker.destroy = true
	}
}

//morrer
if (hp<=0) {
	//animação de morte
	instance_destroy(self)
}

//orientação do sprite
player_dir = point_direction(x,y,oPlayer.x,oPlayer.y)
if (player_dir<270 and player_dir>90){
		image_xscale = 1
	} else {
		image_xscale = -1
	}
//movimentação
if(point_distance(x,y,oPlayer.x,oPlayer.y)<=40) {
	//backUp
	xspd = lengthdir_x(spd/1.5,player_dir)*-1
	yspd = lengthdir_y(spd/1.5,player_dir)*-1
	
	//atacl	
} else if (point_distance(x,y,oPlayer.x,oPlayer.y)>=50){
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
if place_meeting(x+xspd,y+xspd,oEnemy) {
	xspd *= -1
	yspd *= -1
}


//finalizar a movimentação
x += xspd
y += yspd

