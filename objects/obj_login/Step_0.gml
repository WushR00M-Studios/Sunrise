current_scroll = lerp(current_scroll, target_scroll, 0.1);
hovered_index = -1;

var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);
var start_x = display_get_gui_width() / 2 - ((array_length(global.accounts) - 1) * spacing) / 2;

for (var i = 0; i < array_length(global.accounts); i++) {
    var tx = start_x + i * spacing - current_scroll;
    var ty = display_get_gui_height() / 2;

    if (point_in_rectangle(mx, my, tx - item_width/2, ty - item_height/2, tx + item_width/2, ty + item_height/2)) {
        hovered_index = i;
        if (mouse_check_button_pressed(mb_left)) {
            selected_index = i;
            var acc = global.accounts[i];
            if (acc.name == "Add New") {
				if array_length(global.accounts) < 3 {
					global.input_finished = false;
					scr_show_input_dialog(
						"What is your username?",
						spr_dialog_account
					);
				} else {
					toast_dismiss();
				toast_create("NOTICE: You've reached the maximum number of accounts!", 3);
				}
			} else {
				global.current_user = acc.name;
				audio_play_sound(snd_select_yes, 0, false);
				instance_create_depth(0, 0, -1, obj_fadein_routine_mainmenu);
			}
        }
		
		if (mouse_check_button_pressed(mb_right)) {
	        selected_index = i;
            var acc = global.accounts[i];
			
			if acc.name == "Guest" {
				toast_dismiss();
				toast_create("FAILURE: You cannot delete this account!", 4);
			} else if acc.name == "Add New" {
				toast_dismiss();
				toast_create("FAILURE: That isn't an account!", 4);
			} else {
				var btns = [
					{label:"Yes, delete it!", action: dummyscript()},
					{label:"Nevermind that!!",  action: dummyscript()},
				];

				scr_show_dialog("Are you sure you want to remove this?", spr_dialog_warning, btns);
			}
		}
    }
}

// Gamepad Support
var pad = 0;
if (gamepad_is_connected(pad)) {
    if (gamepad_button_check_pressed(pad, gp_padr)) {
        selected_index = clamp(selected_index + 1, 0, array_length(global.accounts) - 1);
    }
    if (gamepad_button_check_pressed(pad, gp_padl)) {
        selected_index = clamp(selected_index - 1, 0, array_length(global.accounts) - 1);
    }
    if (gamepad_button_check_pressed(pad, gp_face1)) {
        var acc = global.accounts[selected_index];
        if (acc.name == "Add New") {
            global.input_finished = false;
			scr_show_input_dialog(
				"What is your username?",
				spr_dialog_account
			);
        } else {
            global.current_user = acc.name;
            audio_play_sound(snd_select_yes, 0, false);
            instance_create_depth(0, 0, -1, obj_fadein_routine_mainmenu);
        }
    }
    var target_index_x = selected_index * spacing;
    var center_x = ((array_length(global.accounts) - 1) * spacing) / 2;
    target_scroll = target_index_x - center_x;
}

if global.input_finished == true {
	global.input_finished = false;
	if (global.input_result != "") {
		show_debug_message("User typed: " + global.input_result);
		var acc = {
			name: global.input_result,
			pin: ""
		};
				
		keyboard_virtual_hide();
		array_insert(global.accounts, array_length(global.accounts) - 2, acc);
				
		save_accounts();
		global.input_result = "";
	} else {
		toast_create("FAILURE: The name entered was invalid!", 4);	
	}
}