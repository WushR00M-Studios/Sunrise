try {
	
	if (!visible) exit;

	if (state == "open" && InputPressed(INPUT_VERB.CANCEL)) {
	    state = "closing";
	}

	// Get view offsets
	var cam = view_camera[0];
	var view_x = camera_get_view_x(cam);
	var view_y = camera_get_view_y(cam);

	var _w = 500;
	var _x = draw_x + view_x;
	var _y = view_y;

	// Sliding animation
	switch (state) {
	    case "opening":
			if bgfade != 0.5
				bgfade += 0.05;
			
	        draw_x = lerp(draw_x, target_x, 0.2);
	        if (abs(draw_x - target_x) < 1) {
	            draw_x = target_x;
	            state = "open";
	        }
			if warningsound == false
				audio_play_sound(snd_warning_msg, 0, false);
		
			warningsound = true;
			global.dialogup = true;
	    break;

	    case "closing":
			if bgfade != 0
				bgfade -= 0.05;
			
	        draw_x = lerp(draw_x, -_w, 0.2);
	        if (draw_x <= -_w+1) {
	            draw_x = -_w;
	            state = "idle";
	            visible = false;
	        }
			warningsound = false;
			global.dialogup = false;
	    break;
	}

	// Button logic only when open
	if (state == "open") {
		if global.inputtype {
			var btn_count = array_length(buttons);
		    var btn_w = 300;
		    var btn_h = 50;
		    var btn_gap = 15;
		    var start_y = _y+350;
		    var new_hover = -1;
		    for (var i=0; i<btn_count; i++) {
		        var bx = _x+_w/2 - btn_w/2;
		        var by = start_y + i*(btn_h+btn_gap);

		        if (point_in_rectangle(mouse_x, mouse_y, bx, by, bx+btn_w, by+btn_h)) {
		            new_hover = i;
		            if (mouse_check_button_pressed(mb_left)) {
				
		                if buttons[i].label == "Yes, save my changes!" {
							save_level_as();
							room_restart();
						} else if buttons[i].label == "Forget all of my progress!" {
							room_restart();
						} else if buttons[i].label == "Forget my progress!" {
							instance_create_depth(0, 0, -1, obj_fadein_routine_mainmenu);
							audio_stop_all();
						} else if buttons[i].label == "Let me out already!" {
							instance_create_layer(0, 0, "Instances_1", obj_fadeout_close_game_routine);
							audio_stop_all();
						} else if buttons[i].label == "English" {
							ui_english();
							instance_create_depth(0, 0, -1, obj_fadein_routine_refreshroom);
						} else if buttons[i].label == "Español" {
							ui_spanish();
							instance_create_depth(0, 0, -1, obj_fadein_routine_refreshroom);
						} else if buttons[i].label == "Yes, delete it!" {
							array_delete(global.accounts, i, 1);	

							ini_open("user.ini");
							ini_section_delete("Account" + string(i))
							var count = ini_read_real("Meta", "AccountCount", "0");
							ini_write_string("Meta", "AccountCount", string(count - 1))
				
							ini_close();
				
							save_accounts();
				
							toast_dismiss();
							toast_create("SUCCESS: Account removed successfully!", 2);
						} else if buttons[i].label == "Just a little more..." or buttons[i].label == "Oops, continue editing!" {
							dummyscript();
							show_debug_message("close the dialog");
						}
				
		                state = "closing";
		            }
					
		        } else {
					// Block mouse input
					if (visible) {
					    mouse_clear(mb_left);
					    mouse_clear(mb_right);
					    mouse_clear(mb_middle);
					}	
				}
		    }
		    hover_index = new_hover;
		} else {
			var max_len = array_length(buttons);
			var min_len = array_get_index(buttons, array_first(buttons));
			
			if InputPressed(INPUT_VERB.UP) or InputPressed(INPUT_VERB.JOY_UP) {
				if hover_index > min_len
					hover_index--;
					
				audio_play_sound(snd_highlight, 0, false);
			} if InputPressed(INPUT_VERB.DOWN) or InputPressed(INPUT_VERB.JOY_DOWN) {
				if hover_index < max_len
					hover_index++;
					
				audio_play_sound(snd_highlight, 0, false);
			}
			
			if InputPressed(INPUT_VERB.ACCEPT) {
				
					if buttons[hover_index].label == "Yes, save my changes!" {
						save_level_as();
						room_restart();
					} else if buttons[hover_index].label == "Forget all of my progress!" {
						room_restart();
					} else if buttons[hover_index].label == "Forget my progress!" {
						instance_create_depth(0, 0, -1, obj_fadein_routine_mainmenu);
						audio_stop_all();
					} else if buttons[hover_index].label == "Let me out already!" {
						instance_create_layer(0, 0, "Instances_1", obj_fadeout_close_game_routine);
						audio_stop_all();
					} else if buttons[hover_index].label == "English" {
						ui_english();
						instance_create_depth(0, 0, -1, obj_fadein_routine_refreshroom);
					} else if buttons[hover_index].label == "Español" {
						ui_spanish();
						instance_create_depth(0, 0, -1, obj_fadein_routine_refreshroom);
					} else if buttons[hover_index].label == "Yes, delete it!" {
						array_delete(global.accounts, i, 1);
					
						ini_open("user.ini");
						ini_section_delete("Account" + string(i))
						var count = ini_read_real("Meta", "AccountCount", "0");
						ini_write_string("Meta", "AccountCount", string(count - 1))
				
						ini_close();
				
						save_accounts();
				
						toast_dismiss();
						toast_create("SUCCESS: Account removed successfully!", 2);
					} else {
						dummyscript();
						state = "closing";
					}
				
				
				audio_play_sound(snd_select_yes, 0, false);
				state = "closing";
			}
		}
	}

	function save_accounts() {
	    ini_open("user.ini");
	    var real_count = array_length(global.accounts) - 2;
	    ini_write_string("Meta", "AccountCount", string(real_count));

	    for (var i = 0; i < real_count; i++) {
	        ini_write_string("Account" + string(i), "Name", global.accounts[i].name);
	        ini_write_string("Account" + string(i), "PIN", global.accounts[i].pin);
	    }

	    ini_close();
	}
	
} catch(ex) {
	if global.op_errorep
		toast_create("FAILURE: An internal error has occured and has been reported to WushR00M Studios.", 4);
	else
		toast_create("FAILURE: An internal error has occured. Error data has been dumped to a debug file.", 4);
		
	if file_exists("error_rep.log") file_delete("error_rep.log");
	var _f = file_text_open_write("error_rep.log");
	file_text_write_string(_f, "Sunrise: Error Report\n \n" + ex.longMessage);
	file_text_close(_f);
	
	show_debug_message( "--------------------------------------------------------------");
	show_debug_message( "An error has occured:" );
    show_debug_message( string(ex.longMessage) );
    show_debug_message( "--------------------------------------------------------------");
}