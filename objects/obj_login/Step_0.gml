current_scroll = lerp(current_scroll, target_scroll, 0.1);
hovered_index = -1;

var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);
var start_x = display_get_gui_width() / 2 - ((array_length(accounts) - 1) * spacing) / 2;

for (var i = 0; i < array_length(accounts); i++) {
    var tx = start_x + i * spacing - current_scroll;
    var ty = display_get_gui_height() / 2;

    if (point_in_rectangle(mx, my, tx - item_width/2, ty - item_height/2, tx + item_width/2, ty + item_height/2)) {
        hovered_index = i;
        if (mouse_check_button_pressed(mb_left)) {
            selected_index = i;
            var acc = accounts[i];
            if (acc.name == "Add New") {
				if array_length(accounts) < 4 {
	                input_mode = "new_name";
	                input_text = "";
				} else {
					toast_dismiss();
					toast_create("FAILURE: You've reached the maximum account of accounts allowed to be created.", 4);
				}
            } else if (acc.name == "Guest") {
                global.current_user = "Guest";
				audio_play_sound(snd_select_yes, 0, false);
				instance_create_depth(0, 0, -1, obj_fadein_routine_mainmenu);
            } else {
                if (acc.pin != "") {
                    input_mode = "login_pin";
                    input_text = "";
                    input_index = i;
                } else {
                    global.current_user = acc.name;
					audio_play_sound(snd_select_yes, 0, false);
                    instance_create_depth(0, 0, -1, obj_fadein_routine_mainmenu);
                }
            }
        }
		
		if (mouse_check_button_pressed(mb_right)) {
	        selected_index = i;
            var acc = accounts[i];
			
			if acc.name == "Guest" {
				toast_dismiss();
				toast_create("FAILURE: You cannot delete this account!", 4);
			} else if acc.name == "Add New" {
				toast_dismiss();
				toast_create("FAILURE: That isn't an account!", 4);
			} else {
				array_delete(accounts, i, 1);	
				
				ini_open("user.ini");
				ini_section_delete("Account" + string(i))
				var count = ini_read_real("Meta", "AccountCount", "0");
				ini_write_string("Meta", "AccountCount", string(count - 1))
				
				ini_close();
				
				save_accounts();
				
				toast_dismiss();
				toast_create("SUCCESS: Account removed successfully!", 2);
			}
		}
    }
}

// Gamepad Support
var pad = 0;
if (gamepad_is_connected(pad)) {
    if (gamepad_button_check_pressed(pad, gp_padr)) {
        selected_index = clamp(selected_index + 1, 0, array_length(accounts) - 1);
    }
    if (gamepad_button_check_pressed(pad, gp_padl)) {
        selected_index = clamp(selected_index - 1, 0, array_length(accounts) - 1);
    }
    if (gamepad_button_check_pressed(pad, gp_face1)) {
        var acc = accounts[selected_index];
        if (acc.name == "Add New") {
            input_mode = "new_name";
            input_text = "";
        } else if (acc.name == "Guest") {
            global.current_user = "Guest";
            audio_play_sound(snd_select_yes, 0, false);
            instance_create_depth(0, 0, -1, obj_fadein_routine_mainmenu);
        } else {
            if (acc.pin != "") {
                input_mode = "login_pin";
                input_text = "";
                input_index = selected_index;
            } else {
                global.current_user = acc.name;
                audio_play_sound(snd_select_yes, 0, false);
                instance_create_depth(0, 0, -1, obj_fadein_routine_mainmenu);
            }
        }
    }
    var target_index_x = selected_index * spacing;
    var center_x = ((array_length(accounts) - 1) * spacing) / 2;
    target_scroll = target_index_x - center_x;
}

// Keyboard input for name or pin
if (input_mode != "none") {
    var key = keyboard_lastchar;
	caps_lock = false;

    // Backspace handling
    if (keyboard_check_pressed(vk_backspace)) {
        input_text = string_copy(input_text, 1, string_length(input_text) - 1);
    }
    // Add character if valid
    else if (key != "") {
        var code = ord(key);
        if (code >= 32 && code <= 126 && string_length(input_text) < 20) {
            input_text += (caps_lock) ? string_upper(key) : key;
        }
    }

    keyboard_lastchar = ""; // Reset input to avoid spamming

    // Handle Enter, Y/N keys
    if (keyboard_check_pressed(vk_enter)) {
        if (input_mode == "new_name") {
            if (string_length(input_text) > 0) {
                var duplicate = false;
                for (var i = 0; i < array_length(accounts); i++) {
                    if (accounts[i].name == input_text) {
                        duplicate = true;
                        break;
                    }
                }
                if (!duplicate) {
                    global.new_name = input_text;
                    input_text = "";
                    input_mode = "new_pin";
                    show_duplicate_error = false;
                } else {
                    input_text = "";
                    toast_dismiss();
					toast_create("FAILURE: You cannot create accounts with duplicate names!", 4);
                }
            }
        } else if (input_mode == "new_pin") {
		    // Accept 4-digit PIN or blank for no PIN
		    if ((string_length(input_text) == 4 && string_digits(input_text)) || string_length(input_text) == 0) {
		        var acc = {
		            name: global.new_name,
		            pin: input_text // can be empty string
		        };
		        array_insert(accounts, array_length(accounts) - 2, acc);

				
		        save_accounts();
		        input_text = "";
		        input_mode = "none";
		    }
        } else if (input_mode == "login_pin") {
            var correct_pin = accounts[input_index].pin;
	        if (input_text == correct_pin) {
	            global.current_user = accounts[input_index].name;
                audio_play_sound(snd_select_yes, 0, false);
                instance_create_depth(0, 0, -1, obj_fadein_routine_mainmenu);
	        } else {
	            input_mode = "none";
	            input_text = "";
	            input_index = -1;
				toast_dismiss();
				toast_create("FAILURE: Incorrect PIN!", 4);
	        }
        }
    }
}