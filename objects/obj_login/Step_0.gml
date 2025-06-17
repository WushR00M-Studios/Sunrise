// Smooth scroll
current_scroll = lerp(current_scroll, target_scroll, 0.1);

// Reset hovered index
hovered_index = -1;

var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

// Calculate position of first item
var start_x = display_get_gui_width() / 2 - ((array_length(accounts) - 1) * spacing) / 2;

for (var i = 0; i < array_length(accounts); i++) {
    var zx = start_x + i * spacing - current_scroll;
    var zy = display_get_gui_height() / 2;

    if (point_in_rectangle(mx, my, zx - item_width/2, zy - item_height/2, zx + item_width/2, zy + item_height/2)) {
        hovered_index = i;
        if (mouse_check_button_pressed(mb_left)) {
            selected_index = i;
            var acc = accounts[i];
            if (acc.name == "Add New") {
                audio_play_sound(snd_cancel_return_back, 0, false);
				toast_dismiss();
				toast_create("Sorry, but this feature isn't available yet! Check back soon!", 1);
            } else {
				audio_play_sound(snd_select_yes, 0, false);
                global.current_user = acc.name;
                room_goto(rm_main_menu); // Change to your main room
            }
        }
    }
}

// Gamepad support
var pad = 0; // Assume player 1 controller

if (gamepad_is_connected(pad)) {
    if (gamepad_button_check_pressed(pad, gp_padr)) {
        selected_index = clamp(selected_index + 1, 0, array_length(accounts) - 1);
		hovered_index = selected_index;
	}
    if (gamepad_button_check_pressed(pad, gp_padl)) {
        selected_index = clamp(selected_index - 1, 0, array_length(accounts) - 1);
		hovered_index = selected_index;
	}

    if (gamepad_button_check_pressed(pad, gp_face1)) {
        var acc = accounts[selected_index];
        if (acc.name == "Add New") {
            audio_play_sound(snd_select_yes, 0, false);
        } else {
			audio_play_sound(snd_select_yes, 0, false);
            global.current_user = acc.name;
            instance_create_depth(0, 0, -1, obj_fadein_routine_mainmenu);
        }
    }
	
	if gamepad_button_check_pressed(pad, gp_face2) {
		instance_create_depth(0, 0, -1, obj_fadein_routine_mainmenu);	
	}

    // Snap scroll to keep selected account centered
    var target_index_x = selected_index * spacing;
    var center_x = ((array_length(accounts) - 1) * spacing) / 2;
    target_scroll = target_index_x - center_x;
}
