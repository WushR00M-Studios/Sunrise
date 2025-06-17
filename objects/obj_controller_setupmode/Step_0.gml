if gamepad_button_check_pressed(0, gp_face1) {
	devicename = gamepad_get_description(0);
} else if keyboard_check_pressed(vk_enter) {
	devicename = "Keyboard & Mouse";
}

if gamepad_button_check_pressed(0, gp_start) {
	instance_create_depth(0,0,-1,obj_fadein_routine_title);	
} else if keyboard_check_pressed(vk_backspace) {
	instance_create_depth(0,0,-1,obj_fadein_routine_title);	
}