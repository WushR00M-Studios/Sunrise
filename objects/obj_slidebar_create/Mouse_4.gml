if room == rm_create {
	audio_play_sound(snd_disabled, 0, false);
} else {
	audio_play_sound(snd_select_yes, 0, false);
	room_goto(rm_create);
}