if gamepad_is_connected(0) {
	global.settingstab = 1;
} else {
	instance_destroy();
}