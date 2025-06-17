if gamepad_is_connected(0) {
	if global.contindex == 2
		sprite_index = spr_sm_chapter2;
	else
		sprite_index = spr_sm_chapter2_un;
}