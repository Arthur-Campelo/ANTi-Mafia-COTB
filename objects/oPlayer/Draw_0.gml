
draw_text(x,y+16,string(hp))
if (flip_horizontal) {
	draw_sprite_ext(sprite_index, image_index, x, y, -1, 1, image_angle, image_blend, image_alpha);
} else {
	draw_self()
}