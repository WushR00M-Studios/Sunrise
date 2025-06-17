audio_play_sound(snd_select_yes, 0, false);
instance_create_depth(0,0,-1,obj_fadein_routine_title);
global.languageopt = 0;

ini_open("user.ini");
ini_write_real("settings","language",global.languageopt);
ini_close();