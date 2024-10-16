xspd = lengthdir_x(spd, bullet_direction)
yspd = lengthdir_y(spd, bullet_direction)

x+=xspd
y+=yspd
//checa colisao
colision = instance_place(x,y, all)
if variable_instance_exists(colision,"type") {//checa se objeto colidido é tipado
	
	switch(colision.type) {
		case "solid":
			instance_destroy(self)
			break
		case "enemy":
			instance_destroy(colision)
			instance_destroy(self)
			break
	}
}
