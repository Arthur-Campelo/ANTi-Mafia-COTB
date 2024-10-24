//movimentação
if !(place_meeting(x+hsp,y,oSolid_parent)) {
		x +=hsp
	} else {
		hsp=-hsp
	}
	if !(place_meeting(x,y+vsp,oSolid_parent)) {
		y +=vsp
	} else {
		vsp =-vsp
	}

if x<0 {
	hsp=-hsp
}
if x>room_width {
	hsp=-hsp
}

if y<0 {
	vsp=-vsp
}
if y>room_height {
	vsp=-vsp
}

//tomar dano
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