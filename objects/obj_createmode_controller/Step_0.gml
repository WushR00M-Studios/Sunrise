if !instance_exists(obj_light) && instance_exists(obj_lighting_engine)
	instance_destroy(obj_lighting_engine);
	
if global.playtest == true {
	global.playtestfin = false;
}