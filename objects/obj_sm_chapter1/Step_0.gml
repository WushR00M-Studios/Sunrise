if gamepad_is_connected(0) {
	if global.contindex == 1
		sprite_index = spr_sm_chapter1;
	else
		sprite_index = spr_sm_chapter1_un;
}