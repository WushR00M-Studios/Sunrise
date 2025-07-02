if global.op_typesound == true {
	if keyboard_lastkey != vk_f2 or keyboard_lastkey != vk_f11 or keyboard_lastkey != vk_add or keyboard_lastkey != vk_subtract or keyboard_lastkey != vk_shift or keyboard_lastkey != vk_control or keyboard_lastkey != vk_tab {
		if room != rm_create
			audio_play_sound(snd_tab_change, 0, false);
	}
}