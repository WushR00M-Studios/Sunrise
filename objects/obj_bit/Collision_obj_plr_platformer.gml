if collect == false {
	randomise();
	temp = irandom_range(1, 3);

	if temp == 1
		audio_play_sound(snd_musicnote_collect_plus1, 0, false);
	else if temp == 2
		audio_play_sound(snd_musicnote_collect_plus2, 0, false);
	else if temp == 3
		audio_play_sound(snd_musicnote_collect_plus3, 0, false);
	else
		audio_play_sound(snd_musicnote_collect_plus1, 0, false);
	
	collect = true;
}