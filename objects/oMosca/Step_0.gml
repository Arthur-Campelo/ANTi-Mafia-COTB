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