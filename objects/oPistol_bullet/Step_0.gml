xspd = lengthdir_x(spd, bullet_direction)
yspd = lengthdir_y(spd, bullet_direction)

x+=xspd
y+=yspd

//code to destroy the bullet
if destroy {
	//animation
	instance_destroy(self)
}


colision = instance_place(x,y, all)//checa colisao
if variable_instance_exists(colision,"type") {//checa se objeto colidido é tipado
	
	switch(colision.type) {
		case "solid":
			destroy = true
			break
		case "enemy":
			instance_destroy(colision)
			destroy = true
			break
	}
}