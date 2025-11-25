if global.setup == true {
	instance_create_depth(0, 0, -1, obj_splash_screen_alt);
	instance_destroy();
} else {
	hasplayed = false;

	ini_open("options.ini");
	enable = ini_read_real("options", global.opt_videopb, 0);
	ini_close();

	audio_play_sound(snd_logobump, 0, false, 0);
}

instance_create_depth(0, 0, -1, obj_fadeout_routine);