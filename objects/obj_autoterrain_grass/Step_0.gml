if place_meeting(x, y - 32, obj_autoterrain_grass) {
	if sprite_index == spr_autoter_grass
		sprite_index = spr_autoter_dirt;
}

if gamepad_button_check(0, gp_shoulderrb) {
	if global.cm_tool == 1 {
		if place_meeting(x, y, obj_cm_cursor) {
			instance_destroy();	
		}
	}
}