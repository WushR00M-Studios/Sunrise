if os_is_network_connected() {
	audio_play_sound(snd_select_yes, 0, false);
	instance_create_depth(0, 0, -1, obj_fadein_routine_connectmenu);
} else {
	audio_play_sound(snd_select_yes, 0, false);

	var btns = [
		{label:"Alright...", action: dummyscript()},
	];

	scr_show_dialog("We couldn't connect you - no internet connection!", spr_dialog_restricted, btns);
}