global.contindex = 1;
global.contname = string(gamepad_get_description(0));

controller_type = 1;
exitgame_timer = 0;

face1_enabled	= false;
face2_enabled	= false;
face3_enabled	= false;
face4_enabled	= false;
start_enabled	= false;
lb_enabled		= false;
rb_enabled		= false;
lt_enabled		= false;
rt_enabled		= false;

face1_prompt	= "";
face2_prompt	= "";
face3_prompt	= "";
face4_prompt	= "";
start_prompt	= "";
lb_prompt		= "";
rb_prompt		= "";
lt_prompt		= "";
rt_prompt		= "";

button_prompt_count = 0;

if string_count("Xbox", global.contname) >= 1
	global.controllertype = 1;
else if string_count("XInput", global.contname) >= 1
	global.controllertype = 1;
else if string_count("Nintendo", global.contname) >= 1
	global.controllertype = 2;
else if string_count("Dualsense", global.contname) >= 1
	global.controllertype = 3;
else if string_count("Dualshock", global.contname) >= 1
	global.controllertype = 3;
else if global.contname == "Wireless Controller"
	global.controllertype = 3;
else 
	global.controllertype = 1;