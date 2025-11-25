if !audio_is_playing(snd_logobump) {
	video_close();
	instance_create_depth(0, 0, -1, obj_fadein_routine_intro);
}