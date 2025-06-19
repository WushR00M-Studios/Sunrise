if gamepad_is_connected(0) {
	if gamepad_button_check_pressed(0, gp_face2)
		global.cm_tool = 1;
	else if gamepad_button_check_pressed(0, gp_face4)
		global.cm_tool = 2;
	else if gamepad_button_check_pressed(0, gp_face3)
		global.cm_tool = 3;
}