// good lord this options code is so fucking messy i cannot wait to clean this up

var content_height = 0;
for (var i = 0; i < array_length(options); i++) {
    if (options[i].type == "header") {
        content_height += header_height;
    } else {
        content_height += line_height;
    }
}

hovered_item = -1;
description_text = "";
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
			if item.name == "Haptics"
				description_text = "Certain actions in-game will vibrate your controller at different levels, disable this to avoid that.";
			else if item.name == "Swap Action and Cancel Buttons"
				description_text = "The confirm and cancel button will be swapped similar to older PlayStation controller mappings in Japan";
			else if item.name == "In-Game Button Guide"
				description_text = "Displays a guide at the lower left corner of the screen showcasing which button does what";
			else if item.name == "Custom Light Bar Color"
				description_text = "Various events in-game will change your DUALSHOCK 4 / DualSense light bar color to match";
			else if item.name == "Touchpad Controls"
				description_text = "Enables a sudo-cursor on screen whenever input from the DUALSHOCK 4 / DualSense touchpad is detected";
			else if item.name == "Automatic Controller Detection"
				description_text = "If playing on Android with a wireless controller, the game will automatically detect if said wireless controller was connected or disconnected";
			else if item.name == "DualSense Adaptive Triggers"
				description_text = "Certain actions in-game will change the amount of pressure needed to fully press down the adaptive triggers on the DualSense controller";
			else if item.name == "DualSense HD Haptics"
				description_text = "Standard haptics will be replaced with the DualSense controller's advanced HD haptics";
			else if item.name == "Calibrate Controller"
				description_text = "This will automatically optimize the deadzone on your controller to avoid minor stick-drift only";
			else if item.name == "Edit Deadzones"
				description_text = "Manually optimize the left and right axis deadzones on your controller to avoid any sort of stick drift";
			else
				description_text = "Edit your controller settings here!";
			
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
		audio_play_sound(snd_highlight, 0, false);
        repeat (1) {
            selected_index = (selected_index - 1 + array_length(options)) mod array_length(options);
            if (options[selected_index].type != "header") break;
        }
        gamepad_cooldown = 6;
    }

    // Navigate Down
    if (gamepad_button_check_pressed(gamepad_id, gp_padd) && gamepad_cooldown <= 0) {
		audio_play_sound(snd_highlight, 0, false);
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
	        
	    }
    }

	// i think we can optimize this by removing the duplicate and instead just sharing the other list above this one
    // Sync hovered_item with gamepad
    hovered_item = selected_index;
    if (hovered_item >= 0 && hovered_item < array_length(options)) {
        var item = options[hovered_item];
			if item.name == "Haptics"
				description_text = "Certain actions in-game will vibrate your controller at different levels, disable this to avoid that.";
			else if item.name == "Swap Action and Cancel Buttons"
				description_text = "The confirm and cancel button will be swapped similar to older PlayStation controller mappings in Japan";
			else if item.name == "In-Game Button Guide"
				description_text = "Displays a guide at the lower left corner of the screen showcasing which button does what";
			else if item.name == "Custom Light Bar Color"
				description_text = "Various events in-game will change your DUALSHOCK 4 / DualSense light bar color to match";
			else if item.name == "Touchpad Controls"
				description_text = "Enables a sudo-cursor on screen whenever input from the DUALSHOCK 4 / DualSense touchpad is detected";
			else if item.name == "Automatic Controller Detection"
				description_text = "If playing on Android with a wireless controller, the game will automatically detect if said wireless controller was connected or disconnected";
			else if item.name == "DualSense Adaptive Triggers"
				description_text = "Certain actions in-game will change the amount of pressure needed to fully press down the adaptive triggers on the DualSense controller";
			else if item.name == "DualSense HD Haptics"
				description_text = "Standard haptics will be replaced with the DualSense controller's advanced HD haptics";
			else if item.name == "Calibrate Controller"
				description_text = "This will automatically optimize the deadzone on your controller to avoid minor stick-drift only";
			else if item.name == "Edit Deadzones"
				description_text = "Manually optimize the left and right axis deadzones on your controller to avoid any sort of stick drift";
			else
				description_text = "Edit your controller settings here!";
    }
}

// this mouse scrolling code doesn't even work
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
            var dd_x = room_width - 72;
            var dd_y = rect.y + rect.h / 2 - 14;
            var dd_w = (256);
            var dd_h = 28;
            for (var c = 0; c < array_length(item.choices); c++) {
                var choice_y_start = dd_y + dd_h * c;
                var choice_y_end = dd_y + dd_h * (c + 1);
                if (mx > dd_x && mx < dd_x - dd_w && my > choice_y_start && my < choice_y_end) {
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
    ini_open("controller.ini");
    for (var i = 0; i < array_length(options); i++) {
        var opt = options[i];
        if (opt.type == "toggle") {
            ini_write_real("options", opt.name, opt.value ? 1 : 0);
        } else if (opt.type == "dropdown") {
            ini_write_real("options", opt.name, opt.selected);
        } else if (opt.type == "slider") {
            ini_write_real("options", opt.name, opt.value);
        }
    }
    ini_close();
}
