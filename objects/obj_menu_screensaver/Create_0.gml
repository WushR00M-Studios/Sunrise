// this is also a init script and config file

if audio_is_playing(mus_mainmenu) {
	
} else { audio_play_sound(mus_mainmenu, -1, true); }

instance_create_depth(0,0,-1,obj_fadeout_routine);
window_set_caption("Sunrise");