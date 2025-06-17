slide = true;
vol = audio_get_master_gain(0) + 0.1
audio_master_gain(vol)
audio_play_sound(snd_tab_change, 0, false);