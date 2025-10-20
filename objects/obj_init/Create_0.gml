window_set_min_height(768);

global.connected = false;
global.setup = false;

randomnum = 0;

secret = 0;
vibcool = false;

sunrise_init();

global.mobile = false;
if os_type == os_android
	global.mobile = true;
else
	global.mobile = false;

global.haptics = false;

global.server_socket = "";
global.client_sockets = "";
global.client_socket = "";
global.party_list = "";

global.version = 3;

global.slidebar = false;

controller = false;
touch = false;

global.op_language = 0; // 0: English, 1: Spanish, 2: Japanese
						// Translations are heavily incomplete!!
global.playtestfin = false;
global.exiting = false;
	
global.input_result = "";
global.input_finished = false;

global.temp1 = "";
	
// instance_create_depth(0, 0, -1, obj_controller);

//////////////////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////////////////////

if file_exists("options.ini") {
	global.setup = false;
	ini_open("options.ini")
	
	global.op_photosen = ini_read_real("options", "Photosensitive Mode", 0);
	global.op_fullscreen = ini_read_real("options", "Fullscreen Mode", 0);
	global.op_borderless = ini_read_real("options", "Borderless Fullscreen", 0);
	global.op_voicechat = ini_read_real("options", "Voice Chat", 0);
	global.op_autosaving = ini_read_real("options", "Autosaving", 0);
	global.op_discordrp = ini_read_real("options", "Discord Rich Presence", 0);
	global.op_colorblind = ini_read_real("options", "Colorblind Symbols", 0);
	global.op_showfps = ini_read_real("options", "Show FPS", 0);
	global.op_errorep = ini_read_real("options", "Error Reporting", 0);
	global.op_telemetry = ini_read_real("options", "Telemetry", 0);
	global.op_language = ini_read_real("lang", "Language", 0); // 0: English, 1: Spanish, 2: Japanese
	global.op_accent = ini_read_string("color", "Color", "White");
	
	if global.op_accent == "White" {
		gamepad_set_color(0, c_white);
		gamepad_set_color(4, c_white);
	} else if global.op_accent == "Red" {
		gamepad_set_color(0, c_red);
		gamepad_set_color(4, c_red);
	} else if global.op_accent == "Orange" {
		gamepad_set_color(0, c_orange);
		gamepad_set_color(4, c_orange);
	} else if global.op_accent == "Yellow" {
		gamepad_set_color(0, c_yellow);
		gamepad_set_color(4, c_yellow);
	} else if global.op_accent == "Lime" {
		gamepad_set_color(0, c_lime);
		gamepad_set_color(4, c_lime);
	} else if global.op_accent == "Teal" {
		gamepad_set_color(0, c_teal);
		gamepad_set_color(4, c_teal);
	} else if global.op_accent == "Blue" {
		gamepad_set_color(0, c_blue);
		gamepad_set_color(4, c_blue);
	} else if global.op_accent == "Purple" {
		gamepad_set_color(0, c_purple);
		gamepad_set_color(4, c_purple);
	}
	
	global.languageopt = global.op_language; // For compatibility's sake, I'm a little lazy at the moment
	
	if global.op_language == 0
		ui_english();
	else if global.op_language == 1
		ui_spanish();
	
	telesent = false;
	
	ini_close();
	
	global.current_user = "Guest";
} else {
	global.setup = true;	
}

//////////////////////////////////////////////////////////////////////////

if global.op_borderless == 1
	window_enable_borderless_fullscreen(true)
	
if global.op_fullscreen == 1
	window_set_fullscreen(true);
	
if global.op_discordrp == 1 && !global.mobile
	instance_create_depth(0, 0, -1, obj_richpres);

if global.op_telemetry == 1 && telesent == false {
	if os_is_network_connected() {
		if (os_type == os_android) {
			var systemos = "Android ARM64 (reported: " + string(os_version) + ")";
				
			var mw = os_get_info()
			var devmodel = ds_map_find_value(mw, "MODEL");
			var cpuabi1 = ds_map_find_value(mw, "CPU_ABI");
			var cpuabi2 = ds_map_find_value(mw, "CPU_ABI2");
			var devboot = ds_map_find_value(mw, "BOOTLOADER");
			var glver = ds_map_find_value(mw, "GL_VERSION");
			
			set_webhook();

			var embed = new DiscordEmbed();
			embed.SetTitle("Sunrise Telemetry")
				.SetDescription("User is playing on v0.3.0 - Android!")
				.SetColor(0x0000ff)
				.AddField("System OS", string(systemos), true)
				.AddField("Device Model", string(devmodel), true)
				.AddField("CPU ABI", string(cpuabi1), true)
				.AddField("CPU ABI #2", string(cpuabi2), true)
				.AddField("System Bootloader", string(devboot), true)
				.AddField("OpenGL Version", string(glver), true)

			webhook.AddEmbed(embed)
				.Execute();
		} else {
			if os_version >= 655360	
				var systemos = "Windows 10 or 11 (reported: " + string(os_version) + ")";
			else
				var systemos = "Legacy Windows (Windows 8.1, 8, 7) - (reported: " + string(os_version) + ")";
				
			var mw = os_get_info()
			var dedmem = ds_map_find_value(mw, "video_adapter_dedicatedsystemmemory");
			var sharemem = ds_map_find_value(mw, "video_adapter_sharedsystemmemory");
			var videodes = ds_map_find_value(mw, "video_adapter_description");
			var dx11 = ds_map_find_value(mw, "video_d3d11_device");
			var udid = ds_map_find_value(mw, "udid");

			set_webhook();

			var embed = new DiscordEmbed();
			embed.SetTitle("Sunrise Telemetry")
				.SetDescription("User is playing on v0.3.0 - Windows!")
				.SetColor(0x0000ff)
				.AddField("System OS", string(systemos), true)
				.AddField("Hardware UDID", string(udid), true)
				.AddField("Video Dedicated Memory", string(dedmem), true)
				.AddField("Video Shared Memory", string(sharemem), true)
				.AddField("Video Adapter", string(videodes), true)
				.AddField("DirectX11 Adapter", string(dx11), true)

			webhook.AddEmbed(embed)
				.Execute();
		}
		
		telesent = true;
	} else {
		toast_create("FAILURE: Telemetry was unable to send! Are you connected to the internet?", 4);	
	}
}

//////////////////////////////////////////////////////////////////////////

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