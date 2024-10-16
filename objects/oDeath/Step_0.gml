if !(place_meeting(x+hsp,y,oBloco)) {
		x +=hsp
	} else {
		hsp=-hsp
	}
	if !(place_meeting(x,y+vsp,oBloco)) {
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