//code to destroy the bullet
if hit_confirm and !piercing{
	destroy = true
}
if destroy {
	//animation
	instance_destroy(self)
}
if place_meeting(x,y,oSolid_parent) {
	destroy = true
}

if (point_distance(xstart,ystart,x,y) > range ) {
	destroy = true
}

xspd = lengthdir_x(spd, bullet_direction)
yspd = lengthdir_y(spd, bullet_direction)

x+=xspd
y+=yspd