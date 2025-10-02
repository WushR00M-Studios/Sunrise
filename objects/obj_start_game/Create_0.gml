// timer = 0;
// show = true;

if !audio_is_playing(mus_titlescreen)
	audio_play_sound(mus_titlescreen, 0, false);
	
emit = audio_emitter_create();
gain = 0;
pitch = 0;