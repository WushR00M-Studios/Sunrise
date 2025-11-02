if !audio_is_playing(snd_logobump) && hasplayed == true {
	video_close();
	
	ini_open("options.ini");
	if ini_section_exists("options")
		room_goto(rm_intro_animation);
	else
		room_goto_next();
}