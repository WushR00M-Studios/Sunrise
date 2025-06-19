if instance_exists(obj_plr_platformer) {
	x = lerp(x, obj_plr_platformer.x, 0.05);
	y = lerp(y, obj_plr_platformer.y, 0.05);
} else if instance_exists(obj_plr_cm_playtest) {
	x = lerp(x, obj_plr_cm_playtest.x, 0.05);
	y = lerp(y, obj_plr_cm_playtest.y, 0.05);	
} else if instance_exists(obj_cm_camera) {
	x = lerp(x, obj_cm_camera.x, 0.05);
	y = lerp(y, obj_cm_camera.y, 0.05);
} else {
	instance_deactivate_object(obj_camera);	
}