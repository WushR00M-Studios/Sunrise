audio_play_sound(snd_select_yes, 0, false);
global.languageopt = 1;
instance_create_depth(0,0,-1,obj_fadein_routine_title);

ini_open("user.ini");
ini_write_real("settings","language",global.languageopt);
ini_close();