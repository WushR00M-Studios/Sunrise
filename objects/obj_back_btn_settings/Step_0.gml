if global.languageopt == 1 {
	image_index = 1;	
} else {
	image_index = 0;	
}

if gamepad_is_connected(0) {
	instance_destroy();	
}