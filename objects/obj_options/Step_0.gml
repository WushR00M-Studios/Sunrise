// Calculate total content height
var content_height = 0;
for (var i = 0; i < array_length(options); i++) {
    if (options[i].type == "header") {
        content_height += header_height;
    } else {
        content_height += line_height;
    }
}

// Reset hover and description
hovered_item = -1;
description_text = "";

// Step Event for Options Menu

var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

var pos_y = menu_top - scroll_y;  // renamed from y
hovered_item = -1;
description_text = "Manage Sunrise's various Settings here!";

for (var i = 0; i < array_length(options); i++) {
    var item = options[i];
    var rect = item_rects[i];
	
	if !gamepad_is_connected(0) {
	    // Check mouse hover over item rectangle
	    if (my > rect.y && my < rect.y + rect.h && mx > rect.x && mx < rect.x + rect.w) {
	        hovered_item = i;
			if item.name == "Photosensitive Mode"
				description_text = "Disables or smoothes most flashing lights";
			else if item.name == "Fullscreen Mode"
				description_text = "Enables or disables Windowed Mode";
			else if item.name == "Typing Sounds"
				description_text = "Whenver a key is struck, a small tick sound will play if enabled";
			else if item.name == "Voice Chat"
				description_text = "Enables or disables Online Voice Chat";
			else if item.name == "Credits"
				description_text = "See who made this amazing game!";
			else if item.name == "Datapacks"
				description_text = "This feature is coming soon, check back later!";
			else if item.name == "Discord Rich Presence"
				description_text = "Enables the rich presence display on your Discord profile if Discord is detected open on your desktop";
			else if item.name == "Autosaving"
				description_text = "Tick this off to disable autosaving story progress and create mode levels, but beware in the case of an unexpected shutdown!";
			else if item.name == "Reset Everything"
				description_text = "Resets all game data and starts from the inital setup. THIS ACTION CAN NOT BE UNDONE, BACKUP YOUR CONTENT!!";
			else if item.name == "Datapack Scripts"
				description_text = "Disable this to disable all datapack scripts.";
			else if item.name == "Reset Profile"
				description_text = "Resets only the current user's game data.";
			else if item.name == "Developer Mode"
				description_text = "Enables in-game datapack development UI";
			else if item.name == "Debug Mode"
				description_text = "Debug Mode, remove before production and sharing";
			else if item.name == "Allow Level Rating"
				description_text = "Allows or disallows rating levels and user content";
			else if item.name == "Allow Online Access"
				description_text = "Allows or disallows connecting to Sunrise Online";
			else if item.name == "Allow Text Chat"
				description_text = "Allows or disallows sending and recieving messages in text";
			else if item.name == "Restricted Mode"
				description_text = "Hides and censors things like foul language, beware when disabling!";
			else
				description_text = "Manage Sunrise's various Settings here!";
			
	        break;
		}
    }
    pos_y += (item.type == "header") ? header_height : line_height;
}

// --- Gamepad Navigation ---
if (gamepad_is_connected(0)) {
    if (gamepad_cooldown > 0) gamepad_cooldown--;

    // Navigate Up
    if (gamepad_button_check_pressed(gamepad_id, gp_padu) && gamepad_cooldown <= 0) {
        repeat (1) {
            selected_index = (selected_index - 1 + array_length(options)) mod array_length(options);
            if (options[selected_index].type != "header") break;
        }
        gamepad_cooldown = 6;
    }

    // Navigate Down
    if (gamepad_button_check_pressed(gamepad_id, gp_padd) && gamepad_cooldown <= 0) {
        repeat (1) {
            selected_index = (selected_index + 1) mod array_length(options);
            if (options[selected_index].type != "header") break;
        }
        gamepad_cooldown = 6;
    }

    // Select with Face Button (A)
    if (gamepad_button_check_pressed(gamepad_id, gp_face1)) {
        audio_play_sound(snd_select_yes, 0, false);
	    var item = options[selected_index];

	    if (item.type == "toggle") {
	        item.value = !item.value;
	        save_options();

	        // Special rules for dependent toggles:
	        if (item.name == "Photosensitive Mode" && item.value) {
	            // Disable Camera Shake if Photosensitive Mode ON
	            for (var j = 0; j < array_length(options); j++) {
	                if (options[j].name == "Camera Shake") {
	                    options[j].value = false;
	                    break;
	                }
	            }
	            save_options();
	        }
			
			if (item.name == "Fullscreen Mode" && item.value) {
				window_set_fullscreen(true);
				save_options();
			} else if (item.name == "Fullscreen Mode" && !item.value) {
				window_set_fullscreen(false);
				save_options();
			}
	    } else if (item.type == "slider") {
	        dragging_slider = hovered_item;
	    } else if (item.type == "dropdown") {
	        // Toggle dropdown open/close
	        for (var k = 0; k < array_length(options); k++) {
	            if (options[k].type == "dropdown") {
	                options[k].open = (k == hovered_item) ? !options[k].open : false;
	            }
	        }
	    } else if (item.type == "button") {
	        if (item.name == "Credits") {
	            room_goto(rm_credits);
	        }
	    }
    }

    // Sync hovered_item with gamepad
    hovered_item = selected_index;
    if (hovered_item >= 0 && hovered_item < array_length(options)) {
        var item = options[hovered_item];
        if item.name == "Photosensitive Mode"
				description_text = "Disables or smoothes most flashing lights";
			else if item.name == "Fullscreen Mode"
				description_text = "Enables or disables Windowed Mode";
			else if item.name == "Typing Sounds"
				description_text = "Whenver a key is struck, a small tick sound will play if enabled";
			else if item.name == "Voice Chat"
				description_text = "Enables or disables Online Voice Chat";
			else if item.name == "Credits"
				description_text = "See who made this amazing game!";
			else if item.name == "Datapacks"
				description_text = "This feature is coming soon, check back later!";
			else if item.name == "Discord Rich Presence"
				description_text = "Enables the rich presence display on your Discord profile if Discord is detected open on your desktop";
			else if item.name == "Autosaving"
				description_text = "Tick this off to disable autosaving story progress and create mode levels, but beware in the case of an unexpected shutdown!";
			else if item.name == "Reset Everything"
				description_text = "Resets all game data and starts from the inital setup. THIS ACTION CAN NOT BE UNDONE, BACKUP YOUR CONTENT!!";
			else if item.name == "Datapack Scripts"
				description_text = "Disable this to disable all datapack scripts.";
			else if item.name == "Reset Profile"
				description_text = "Resets only the current user's game data.";
			else if item.name == "Developer Mode"
				description_text = "Enables in-game datapack development UI";
			else if item.name == "Debug Mode"
				description_text = "Debug Mode, remove before production and sharing";
			else if item.name == "Allow Level Rating"
				description_text = "Allows or disallows rating levels and user content";
			else if item.name == "Allow Online Access"
				description_text = "Allows or disallows connecting to Sunrise Online";
			else if item.name == "Allow Text Chat"
				description_text = "Allows or disallows sending and recieving messages in text";
			else if item.name == "Restricted Mode"
				description_text = "Hides and censors things like foul language, beware when disabling!";
			else
				description_text = "Manage Sunrise's various Settings here!";
    }
}

// Smooth Mouse Wheel Scrolling
if (mouse_wheel_up()) {
    scroll_target -= 36;
}
if (mouse_wheel_down()) {
    scroll_target += 36;
}
scroll_target = clamp(scroll_target, 0, max_scroll);
scroll_y = lerp(scroll_y, scroll_target, 0.25);

// Handle mouse click on option items
	if (mouse_check_button_pressed(mb_left) && hovered_item != -1) {
		audio_play_sound(snd_select_yes, 0, false);
	    var item = options[hovered_item];

	    if (item.type == "toggle") {
	        item.value = !item.value;
	        save_options();

	        // Special rules for dependent toggles:
	        if (item.name == "Photosensitive Mode" && item.value) {
	            // Disable Camera Shake if Photosensitive Mode ON
	            for (var j = 0; j < array_length(options); j++) {
	                if (options[j].name == "Camera Shake") {
	                    options[j].value = false;
	                    break;
	                }
	            }
	            save_options();
	        }
			
			if (item.name == "Fullscreen Mode" && item.value) {
				window_set_fullscreen(true);
				global.op_fullscreen = true;
			} else if (item.name == "Fullscreen Mode" && !item.value) {
				window_set_fullscreen(false);
				global.op_fullscreen = false;
			}
			
			if (item.name == "Typing Sounds" && item.value)
				global.op_typesound = true;
			else if (item.name == "Typing Sounds" && !item.value)
				global.op_typesound = false;
		
	    } else if (item.type == "slider") {
	        dragging_slider = hovered_item;
	    } else if (item.type == "dropdown") {
	        // Toggle dropdown open/close
	        for (var k = 0; k < array_length(options); k++) {
	            if (options[k].type == "dropdown") {
	                options[k].open = (k == hovered_item) ? !options[k].open : false;
	            }
	        }
	    } else if (item.type == "button") {
	        if (item.name == "Credits") {
	            instance_create_depth(0, 0, -1, obj_fadein_routine)
	        }
	    }
	}

// Dragging slider: update slider value while dragging
if (mouse_check_button(mb_left) && dragging_slider != -1) {
    var slider_item = options[dragging_slider];
    var slider_x = padding_x + 200;
    var slider_w = 180;

    var new_val = clamp(((mx - slider_x) / slider_w) * (slider_item.max - slider_item.min) + slider_item.min, slider_item.min, slider_item.max);
    slider_item.value = new_val;
    save_options();
} else {
    dragging_slider = -1;
}

// Handle clicking on dropdown choices if dropdown is open
if (mouse_check_button_pressed(mb_left)) {
    for (var i = 0; i < array_length(options); i++) {
        var item = options[i];
        if (item.type == "dropdown" && item.open) {
            var dd_x = padding_x + 200;
            var dd_y = item_rects[i].y + item_rects[i].h;
            var dd_w = 180;
            var dd_h = line_height;
            for (var c = 0; c < array_length(item.choices); c++) {
                var choice_y_start = dd_y + dd_h * c;
                var choice_y_end = dd_y + dd_h * (c + 1);
                if (mx > dd_x && mx < dd_x + dd_w && my > choice_y_start && my < choice_y_end) {
                    item.selected = c;
                    item.value = c; // keep value synced if needed
                    item.open = false;
                    save_options();
                    break;
                }
            }
        }
    }
}


// --- Save function for options ---
function save_options() {
    ini_open("options.ini");
    for (var i = 0; i < array_length(options); i++) {
        var opt = options[i];
        if (opt.type == "toggle") {
            ini_write_real("options", opt.id, opt.value ? 1 : 0);
        } else if (opt.type == "dropdown") {
            ini_write_real("options", opt.id, opt.selected);
        } else if (opt.type == "slider") {
            ini_write_real("options", opt.id, opt.value);
        }
    }
    ini_close();
}
