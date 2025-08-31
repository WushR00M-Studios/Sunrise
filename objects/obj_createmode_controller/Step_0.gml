if !instance_exists(obj_light) && instance_exists(obj_lighting_engine)
	instance_destroy(obj_lighting_engine);

if keyboard_check_pressed(ord("1")) {
	global.cmmode = 1;
} else if keyboard_check_pressed(ord("2")) {
	global.cmmode = 2;
} else if keyboard_check_pressed(ord("3")) {
	global.cmmode = 3;
} else if keyboard_check_pressed(ord("9")) {
	global.cmplay = !global.cmplay;
}