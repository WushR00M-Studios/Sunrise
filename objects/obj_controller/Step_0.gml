if global.exiting == false {
	if gamepad_is_connected(0) {
	
		if room == rm_main_menu {
			face1_enabled = true;
			face2_enabled = false;
			face3_enabled = true;
			face4_enabled = true;
			start_enabled = false;
			lb_enabled = false;
			rb_enabled = false;
			lt_enabled = false;
			rt_enabled = false;
		
			face1_prompt = "Select";
			face2_prompt = "";
			face3_prompt = "Accounts";
			face4_prompt = "Exit Game";
			start_prompt = "";
			lb_prompt = "";
			rb_prompt = "";
			lt_prompt = "";
			rt_prompt = "";
		} else if room == rm_story_mode {
			face1_enabled = false;
			face2_enabled = true;
			face3_enabled = false;
			face4_enabled = false;
			start_enabled = false;
			lb_enabled = false;
			rb_enabled = false;
			lt_enabled = false;
			rt_enabled = false;
		
			face1_prompt = "";
			face2_prompt = "Back";
			face3_prompt = "";
			face4_prompt = "";
			start_prompt = "";
			lb_prompt = "";
			rb_prompt = "";
			lt_prompt		= "";
			rt_prompt		= "";
		} else if room == rm_connect_menu {
			face1_enabled = true;
			face2_enabled = true;
			face3_enabled = true;
			face4_enabled = true;
			start_enabled = false;
			lb_enabled = false;
			rb_enabled = false;
			lt_enabled = false;
			rt_enabled = false;
		
			face1_prompt = "Select";
			face2_prompt = "Back";
			face3_prompt = "Search";
			face4_prompt = "My Profile";
			start_prompt = "";
			lb_prompt = "";
			rb_prompt = "";
			lt_prompt		= "";
			rt_prompt		= "";
		} else if room == rm_settings {
			if global.settingstab == 1 {
				face1_enabled = true;
				face2_enabled = true;
				face3_enabled = false;
				face4_enabled = false;
				start_enabled = false;
				lb_enabled = true;
				rb_enabled = true;
				lt_enabled = false;
				rt_enabled = false;
		
				face1_prompt = "Select";
				face2_prompt = "Back";
				face3_prompt = "";
				face4_prompt = "";
				start_prompt = "";
				lb_prompt = "Switch Tab";
				rb_prompt = "Switch Tab";
				lt_prompt		= "";
				rt_prompt		= "";
			} else {
				face1_enabled = false;
				face2_enabled = true;
				face3_enabled = false;
				face4_enabled = false;
				start_enabled = false;
				lb_enabled = true;
				rb_enabled = true;
				lt_enabled = false;
				rt_enabled = true;
		
				face1_prompt = "";
				face2_prompt = "Back";
				face3_prompt = "";
				face4_prompt = "";
				start_prompt = "";
				lb_prompt = "Switch Tab";
				rb_prompt = "Switch Tab";
				lt_prompt = "";
				rt_prompt = "Switch Controller Type";
			}
		} else if room == rm_title_screen {
			face1_enabled = false;
			face2_enabled = false;
			face3_enabled = false;
			face4_enabled = false;
			start_enabled = false;
			lb_enabled = false;
			rb_enabled = false;
			lt_enabled = false;
			rt_enabled = false;
		
			face1_prompt = "";
			face2_prompt = "";
			face3_prompt = "";
			face4_prompt = "";
			start_prompt = "";
			lb_prompt = "";
			rb_prompt = "";
			lt_prompt		= "";
			rt_prompt		= "";
		} else if room == rm_credits {
			face1_enabled = false;
			face2_enabled = true;
			face3_enabled = false;
			face4_enabled = false;
			start_enabled = false;
			lb_enabled = false;
			rb_enabled = false;
			lt_enabled = false;
			rt_enabled = false;
		
			face1_prompt = "";
			face2_prompt = "Back";
			face3_prompt = "";
			face4_prompt = "";
			start_prompt = "";
			lb_prompt = "";
			rb_prompt = "";
			lt_prompt		= "";
			rt_prompt		= "";
		} else if room == rm_login {
			face1_enabled = true;
			face2_enabled = true;
			face3_enabled = false;
			face4_enabled = false;
			start_enabled = false;
			lb_enabled = false;
			rb_enabled = false;
			lt_enabled = false;
			rt_enabled = false;
		
			face1_prompt = "Switch Account";
			face2_prompt = "Cancel";
			face3_prompt = "";
			face4_prompt = "";
			start_prompt = "";
			lb_prompt = "";
			rb_prompt = "";
			lt_prompt		= "";
			rt_prompt		= "";
		} else if room == rm_create {
			if global.playtest == false {
				if global.controllertoolbar == false {
					if global.cm_tool == 1 {
						face1_enabled = false;
						face2_enabled = false;
						face3_enabled = true;
						face4_enabled = true;
						start_enabled = true;
						lb_enabled = true;
						rb_enabled = true;
						lt_enabled = true;
						rt_enabled = true;
		
						face1_prompt = "";
						face2_prompt = "";
						face3_prompt = "Object Editor";
						face4_prompt = "Level Properties";
						start_prompt = "Navigate Toolbar";
						lb_prompt = "Navigate Index";
						rb_prompt = "Navigate Index"
						lt_prompt = "Place Terrain";
						rt_prompt = "Remove Terrain";
					} else if global.cm_tool == 2 {
						face1_enabled = false;
						face2_enabled = true;
						face3_enabled = true;
						face4_enabled = false;
						start_enabled = true;
						lb_enabled = true;
						rb_enabled = true;
						lt_enabled = true;
						rt_enabled = true;
		
						face1_prompt = "";
						face2_prompt = "Terrain Editor";
						face3_prompt = "";
						face4_prompt = "Level Properties";
						start_prompt = "Navigate Toolbar";
						lb_prompt = "Navigate Index";
						rb_prompt = "Navigate Index"
						lt_prompt = "Place Object";
						rt_prompt = "Remove Object";
					} else if global.cm_tool == 3 {
						face1_enabled = false;
						face2_enabled = true;
						face3_enabled = false;
						face4_enabled = true;
						start_enabled = true;
						lb_enabled = false;
						rb_enabled = false;
						lt_enabled = false;
						rt_enabled = false;
		
						face1_prompt = "";
						face2_prompt = "Terrain Editor";
						face3_prompt = "Object Editor";
						face4_prompt = "";
						start_prompt = "Navigate Toolbar";
						lb_prompt = "";
						rb_prompt = ""
						lt_prompt = "";
						rt_prompt = "";
					}
				} else if global.controllertoolbar == true {
					face1_enabled = true;
					face2_enabled = true;
					face3_enabled = false;
					face4_enabled = false;
					start_enabled = false;
					lb_enabled = false;
					rb_enabled = false;
					lt_enabled = false;
					rt_enabled = false;
		
					face1_prompt = "Select";
					face2_prompt = "Exit Toolbar";
					face3_prompt = "";
					face4_prompt = "";
					start_prompt = "";
					lb_prompt = "";
					rb_prompt = "";
					lt_prompt = "";
					rt_prompt = "";
				}
			} else {
				face1_enabled = false;
				face2_enabled = false;
				face3_enabled = false;
				face4_enabled = false;
				start_enabled = true;
				lb_enabled = false;
				rb_enabled = false;
				lt_enabled = false;
				rt_enabled = false;
		
				face1_prompt = "";
				face2_prompt = "";
				face3_prompt = "";
				face4_prompt = "";
				start_prompt = "Stop Playtesting";
				lb_prompt = "";
				rb_prompt = "";
				lt_prompt = "";
				rt_prompt = "";	
			}
		}
	
		//////////////////
	
		if gamepad_button_check_pressed(0, gp_padu) {
			if room == rm_main_menu {
				if global.contindex == 1 {
					audio_play_sound(snd_error_placing, 0, false, 0.25);	
				} else {
					global.contindex -= 1;
					audio_play_sound(snd_highlight, 0, false);	
				}
			}
		}

		if gamepad_button_check_pressed(0, gp_padd) {
			if room == rm_main_menu {
				if global.contindex == 3 {
					audio_play_sound(snd_error_placing, 0, false, 0.25);	
				} else if global.contindex == 4 {
					audio_play_sound(snd_error_placing, 0, false, 0.25);	
				} else {
					global.contindex += 1;
					audio_play_sound(snd_highlight, 0, false);	
				}
			}
		}

		if gamepad_button_check_pressed(0, gp_padl) {
			if room == rm_main_menu {
				if global.contindex == 3 {
					audio_play_sound(snd_error_placing, 0, false, 0.25);	
				} else if global.contindex == 2 {
					audio_play_sound(snd_error_placing, 0, false, 0.25);	
				} else if global.contindex == 1 {
					audio_play_sound(snd_error_placing, 0, false, 0.25);	
				} else {
					global.contindex -= 1;
					audio_play_sound(snd_highlight, 0, false);	
				}
			}
		}

		if gamepad_button_check_pressed(0, gp_padr) {
			if room == rm_main_menu {
				if global.contindex == 4 {
					audio_play_sound(snd_error_placing, 0, false, 0.25);	
				} else if global.contindex == 2 {
					audio_play_sound(snd_error_placing, 0, false, 0.25);	
				} else if global.contindex == 1 {
					audio_play_sound(snd_error_placing, 0, false, 0.25);	
				} else {
					global.contindex += 1;
					audio_play_sound(snd_highlight, 0, false);	
				}
			}
		}

		if gamepad_button_check_pressed(0, gp_face1) {
			if room == rm_main_menu {
				if global.contindex == 1 {
					audio_play_sound(snd_select_yes, 0, false);
					instance_create_depth(0, 0, -1, obj_slidein_routine_sm);
				} else if global.contindex == 2 {
					audio_play_sound(snd_cancel_return_back, 0, false);
					toast_dismiss();
					toast_create("Sorry, but this feature isn't available yet! Check back soon!", 1);
				} else if global.contindex == 3 {
					room_goto(rm_create);
				} else if global.contindex == 4 {
					audio_play_sound(snd_select_yes, 0, false);
					instance_create_depth(0, 0, -1, obj_fadein_routine_settingsmenu);
				}
			}
		}

		if gamepad_button_check_pressed(0, gp_face2) {
			if room == rm_settings {
				audio_play_sound(snd_cancel_return_back, 0, false);
				instance_create_depth(0, 0, -1, obj_fadein_routine_mainmenu);
			} else if room == rm_story_mode {
				audio_play_sound(snd_cancel_return_back, 0, false);
				instance_create_depth(0, 0, -1, obj_fadein_routine_mainmenu);
			} else if room == rm_credits {
				audio_play_sound(snd_cancel_return_back, 0, false);
				audio_stop_sound(mus_a_millenium_to_a_dream);
				instance_create_depth(0, 0, -1, obj_fadein_routine_settingsmenu);
			}
		}

		if gamepad_button_check_pressed(0, gp_face4) {
			if room == rm_main_menu {
				audio_play_sound(snd_select_yes, 0, false);
				instance_create_depth(0, 0, -1, obj_fadein_routine_login);
			} else if room == rm_settings {
				if global.settingstab == 2 {
					if global.controllertype == 1
						global.controllertype = 2;
					else if global.controllertype == 2
						global.controllertype = 3;
					else if global.controllertype == 3
						global.controllertype = 1;
				}
			}
		}

		if gamepad_button_check_pressed(0, gp_face3) {
			if room == rm_main_menu {
				audio_stop_all();
				toast_dismiss();
				audio_play_sound(snd_select_yes, 0, false);

				voice = irandom_range(1, 4);
				if voice == 1 {
					audio_play_sound(vo_goodbye_wushy, 0, false);
					global.exiting = 1;
				} else if voice == 2 {
					audio_play_sound(vo_goodbye_blue1, 0, false);
					global.exiting = 2;
				} else if voice == 3 {
					audio_play_sound(vo_goodbye_blue2, 0, false);
					global.exiting = 3;
				} else if voice == 4 {
					audio_play_sound(vo_goodbye_h49, 0, false);
					global.exiting = 4;
				}

				instance_create_layer(0, 0, "Instances_1", obj_fadeout_close_game_routine);
				instance_deactivate_layer("Instances");
			}
		}

		if gamepad_button_check_pressed(0, gp_shoulderl) {
			if room == rm_settings {
				if global.settingstab == 1 {
					audio_play_sound(snd_error_placing, 0, false, 0.25);
					instance_deactivate_layer("Instances_1");
					instance_activate_layer("Options");
				} else {
					audio_play_sound(snd_cursor_click, 0, false, 0.5);
					instance_deactivate_layer("Instances_1");
					instance_activate_layer("Options");
					global.settingstab = 1;
				}
			}
		}

		if gamepad_button_check_pressed(0, gp_shoulderr) {
			if room == rm_settings {
				if global.settingstab == 2 {
					audio_play_sound(snd_error_placing, 0, false, 0.25);
					instance_activate_layer("Instances_1");
					instance_deactivate_layer("Options");
				} else {
					audio_play_sound(snd_cursor_click, 0, false, 0.5);
					instance_activate_layer("Instances_1");
					instance_deactivate_layer("Options");
					global.settingstab = 2;
				}
			}
		}
	
		if gamepad_button_check_pressed(0, gp_shoulderlb) {
		
		}
	
		if gamepad_button_check_pressed(0, gp_shoulderrb) {
			if room == rm_settings {
				if global.settingstab == 2 {
					if global.controllertype == 1
						global.controllertype = 2;
					else if global.controllertype == 2
						global.controllertype = 3;
					else if global.controllertype == 3
						global.controllertype = 1;
				}
			}
		}
	
		if room == rm_splash_autosave {
			if gamepad_button_check_pressed(0, gp_start)
				instance_create_depth(0, 0, -1, obj_fadein_routine_title);
		} else if room == rm_title_screen {
			if gamepad_button_check_pressed(0, gp_start)
				instance_create_depth(0, 0, -1, obj_fadein_routine_mainmenu);
		}
	}
}