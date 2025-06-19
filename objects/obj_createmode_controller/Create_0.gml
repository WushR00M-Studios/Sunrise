global.newlvl = "Unnamed Level";
global.lvlauthor = "Unknown";

global.lsvspawn_x = 0;
global.lsvspawn_y = 0;
new_new_lvl = "";

selectable_objects = [obj_solid_cm, obj_txt_cm];
selectable_index = -1;

global.playtest = false;
global.playtestfin = false;

	if !audio_is_playing(mus_yourwelcome_74) or !audio_is_playing(mus_capslock) {
		audio_stop_all();
		mustrack = irandom_range(1,2);
		if mustrack == 1
			audio_play_sound(mus_yourwelcome_74, 1, true, 0.5);
		else if mustrack == 2
			audio_play_sound(mus_capslock, 1, true, 0.5); // play other create mode track
	} else {
			
	}

instance_create_depth(view_get_xport(0),0,-1,obj_flashout_routine);

global.clipboard = "";
global.clipboardx = 0;
global.clipboardy = 0;

global.newlocx = 0;
global.newlocy = 0;

lvlprop = false;

filemenu = false;
objmenu = false;
logicmenu = false;