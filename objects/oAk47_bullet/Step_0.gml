xspd = lengthdir_x(spd, bullet_direction)
yspd = lengthdir_y(spd, bullet_direction)

x+=xspd
y+=yspd

//code to destroy the bullet
if destroy {
	//animation de destruição
	instance_destroy(self)
}

if place_meeting(x,y,oSolid_parent) {
	destroy = true
}