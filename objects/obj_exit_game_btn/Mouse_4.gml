audio_stop_all();
toast_dismiss();
audio_play_sound(snd_select_yes, 0, false);

instance_create_layer(0, 0, "Instances_1", obj_fadeout_close_game_routine);