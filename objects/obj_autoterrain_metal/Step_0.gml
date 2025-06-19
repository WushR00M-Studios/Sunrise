if place_meeting(x, y - 32, obj_autoterrain_metal) {
	sprite_index = spr_autoter_metal_bottom;
}

if sprite_index != spr_autoter_metal_bottom {
	if place_meeting(x + 32, y, obj_autoterrain_metal) {
		sprite_index = spr_autoter_metal_top_left;
	} else if place_meeting(x - 32, y, obj_autoterrain_metal) {
		sprite_index = spr_autoter_metal_top_right;
	}

	if place_meeting(x + 32, y, obj_autoterrain_metal) && place_meeting(x - 32, y, obj_autoterrain_metal) {
		sprite_index = spr_autoter_metal_top_middle;
	}
}

if gamepad_button_check(0, gp_shoulderrb) {
	if global.cm_tool == 1 {
		if place_meeting(x, y, obj_cm_cursor) {
			instance_destroy();	
		}
	}
}