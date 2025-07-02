window_set_min_height(768);

global.connected = false;
global.setup = false;

randomnum = 0;

secret = 0;

sunrise_init();

if file_exists("options.ini") {
	global.setup = false;
	ini_open("options.ini")
	global.op_fullscreen = ini_read_real("options", "Fullscreen Mode_2", 0);
	global.op_typesound = ini_read_real("options", "Typing Sounds_3", 0);

	if global.op_fullscreen == 1
		window_set_fullscreen(true);
	else
		window_set_fullscreen(false);
	
	ini_close();
	
	global.current_user = "Guest";
} else {
	global.setup = true;	
}

global.server_socket = "";
global.client_sockets = "";
global.client_socket = "";
global.party_list = "";

global.version = 3;

controller = false;
touch = false;

global.languageopt = 0;
global.playtestfin = false;
global.exiting = false;

instance_create_depth(0, 0, -1, obj_cursor);
instance_create_depth(0, 0, -1, obj_controller);

if os_device != os_android {
	instance_create_depth(0, 0, -1, obj_richpres);
} else {
	if instance_exists(obj_voice_hub)
		instance_destroy(obj_voice_hub);
}

room_goto_next();

// CONTROLLER GUIDE
//gp_face1	Top button 1 (this maps to the "A" on an Xbox controller and the cross on a PS controller)
//gp_face2	Top button 2 (this maps to the "B" on an Xbox controller and the circle on a PS controller)
//gp_face3	Top button 3 (this maps to the "X" on an Xbox controller and the square on a PS controller)
//gp_face4	Top button 4 (this maps to the "Y" on an Xbox controller and the triangle on a PS controller)
//gp_shoulderl	Left shoulder button
//gp_shoulderlb	Left shoulder trigger
//gp_shoulderr	Right shoulder button
//gp_shoulderrb	Right shoulder trigger
//gp_select	The select button (on a PS controller, this triggers when you press the touchpad down)
//gp_start	The start button (this is the "options" button on a PS controller)
//gp_stickl	The left stick pressed (as a button)
//gp_stickr	The right stick pressed (as a button)
//gp_padu	D-pad up
//gp_padd	D-pad down
//gp_padl	D-pad left
//gp_padr	D-pad right
//gp_home	The "home" button on Switch controllers, and the PS/XBOX logo buttons on some controllers
//gp_touchpadbutton	The touchpad button on a PS controller
//gp_paddler	Upper or primary paddle, under your right hand (e.g. Xbox Elite paddle P1)
//gp_paddlel	Upper or primary paddle, under your left hand (e.g. Xbox Elite paddle P3)
//gp_paddlerb	Lower or secondary paddle, under your right hand (e.g. Xbox Elite paddle P2)
//gp_paddlelb	Lower or secondary paddle, under your left hand (e.g. Xbox Elite paddle P4)
//gp_extra1	An extra button that may be mapped to anything
//gp_extra2	An extra button that may be mapped to anything
//gp_extra3	An extra button that may be mapped to anything
//gp_extra4	An extra button that may be mapped to anything
//gp_extra5	An extra button that may be mapped to anything
//gp_extra6	An extra button that may be mapped to anything

// CONTROLLER - JOYSTICK GUIDE
//gp_axislh	Left stick horizontal axis (analog)
//gp_axislv	Left stick vertical axis (analog)
//gp_axisrh	Right stick horizontal axis (analog)
//gp_axisrv	Right stick vertical axis (analog)