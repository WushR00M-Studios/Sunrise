// Initialize Global Variables

global.connected = false;
global.setup = false;
global.mobile = false;
global.haptics = false;
global.server_socket = "";
global.client_sockets = "";
global.client_socket = "";
global.party_list = "";
global.version = 3;
global.op_language = 0;
global.playtestfin = false;
global.exiting = false;
global.input_result = "";
global.input_finished = false;
global.controllertype = 0;
global.op_photosen = 0;
global.op_fullscreen = 0;
global.op_borderless = 0;
global.op_voicechat = 0;
global.op_autosaving = 0;
global.op_discordrp = 0;
global.op_colorblind = 0;
global.op_showfps = 0;
global.op_errorep = 0;
global.op_telemetry = 0;
global.op_language = 0;
global.op_accent = 0;
global.current_user = "Guest";
global.setup = true;

global.object_timer = 0;
global.window_width = window_get_width();
global.window_height = window_get_height();

global.lvl_transition = false;
global.rotation_type = 0;				//This changes player's visual rotation 
global.use_airroll = true;				//Flag that allows rolling while air-borne
global.chaotix_dust_effect = false;		//Flag that disables classic spindash/skid dust effect
global.camera_type = 1;					//Vertical camera scrolling type
global.stage_timer = 0;

global.boostpad_contact = false;

global.character = 0; // Placeholder, character switching will come later!

global.bits = 0;
global.score = 0;

global.levelname = "Level Name"

global.col_tile = ["CollisionMain", "CollisionSemi", "CollisionA", "CollisionB"];
global.hud_number = font_add_sprite(spr_hudnumbers, ord("0"), false, 0);

#macro WINDOW_WIDTH 1366
#macro WINDOW_HEIGHT 768

init_var();

// Finish Preloading + Load Options and Definitions

audio_group_load(audiogroup_default);
audio_master_gain(0.5);

if os_type == os_android
	global.mobile = true;
else
	global.mobile = false;

	if InputPlayerUsingGamepad(0) {
		var _type = InputPlayerGetGamepadType(_player_index);
	    switch(_type)
	    {
	        case INPUT_GAMEPAD_TYPE_UNKNOWN:
	            global.controllertype = 4;
	        break;

	        case INPUT_GAMEPAD_TYPE_PS4:
				global.controllertype = 1;
			break;
	        case INPUT_GAMEPAD_TYPE_PS5:
	            global.controllertype = 2;
	        break;

	        case INPUT_GAMEPAD_TYPE_SWITCH:
	            global.controllertype = 3;
	        break;
		
			case INPUT_GAMEPAD_TYPE_XBOX:
				global.controllertype = 0;
			break;

	        default:
	            global.controllertype = 5;
	        break;
	    }
	}
	
//////////////////////////////////////////////////////////////////////////

if file_exists("settings.ini") {
	global.setup = false;
	ini_open("settings.ini")
	
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
	global.op_language = ini_read_real("lang", "Language", 0);
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
	
	ui_english();
	ini_close();
	global.current_user = "Guest";
} else {
	global.current_user = "Guest";
	ui_english();
	global.setup = true;
}

//////////////////////////////////////////////////////////////////////////

if global.op_borderless == 1
	window_enable_borderless_fullscreen(true)
	
if global.op_fullscreen == 1
	window_set_fullscreen(true);
	
if global.op_discordrp == 1 && !global.mobile
	instance_create_depth(0, 0, -1, obj_richpres);

//////////////////////////////////////////////////////////////////////////

room_goto_next();