draw_set_color(c_white)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_text(45,10,"SCORE: " + string(oPlayer.move_spd) + "/3")

if (global.colectables==3) {
	room_goto_next()
}