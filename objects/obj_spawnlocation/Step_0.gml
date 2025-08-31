global.lsvspawn_x = x;
global.lsvspawn_y = y;

if rcm == true {
	if keyboard_check_pressed(ord("A")) {
		x -= 32;
	}
	if keyboard_check_pressed(ord("D")) {
		x += 32;
	}
	if keyboard_check_pressed(ord("W")) {
		y -= 32;
	}
	if keyboard_check_pressed(ord("S")) {
		y += 32;
	}
} else { }

if global.cmplay == true {
	instance_create_layer(0, 0, "UI", obj_camera);
	instance_create_layer(0, 0, "UI", obj_hud);
	instance_destroy(obj_cm_manager);
	instance_change(obj_plr_platformer,true);
	view_visible[1] = true;
	view_visible[0] = false;
} else {
	view_visible[1] = false;
	view_visible[0] = true;
}