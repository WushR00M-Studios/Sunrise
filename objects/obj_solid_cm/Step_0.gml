if gamepad_button_check(0, gp_shoulderrb) {
	if global.cm_tool == 2 {
		if place_meeting(x, y, obj_cm_cursor) {
			instance_destroy();	
		}
	}
}