if gamepad_button_check_pressed(0, gp_face1) {
	devicename = gamepad_get_description(0);
} else if keyboard_check_pressed(vk_enter) {
	devicename = "Keyboard & Mouse";
}

if gamepad_button_check_pressed(0, gp_start) {
	room_goto(rm_settings);	
} else if keyboard_check_pressed(vk_backspace) {
	room_goto(rm_settings);	
}