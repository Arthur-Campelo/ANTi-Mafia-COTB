//centralizar no player
if instance_exists(oPlayer) {
	x=oPlayer.x
	y=oPlayer.y
}

//posição da camera p posição desse objt
camera_set_view_pos(view_camera[0],x-camera_get_view_width(view_camera[0])/2,y-camera_get_view_height(view_camera[0])/2)