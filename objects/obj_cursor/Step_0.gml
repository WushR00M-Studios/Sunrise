if room == rm_dotdotdot
	instance_destroy();	
	
if os_type == os_android
	instance_destroy();
	
if gamepad_is_connected(0) {
	instance_destroy();	
}