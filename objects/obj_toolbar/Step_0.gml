var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

// Reset hover states
mouse_over_button = -1;
mouse_over_item = -1;

// Controller input toggle
if (gamepad_button_check_pressed(controller_gamepad, gp_start)) {
    controller_active = true;
	global.controllertoolbar = true;
    active_button = 0; // Start with File
    controller_button_index = 0;
    controller_item_index = 0;
    dropdown_target_height = array_length(buttons[0].items) * button_height;
}

// Exit toolbar control
if (controller_active && gamepad_button_check_pressed(controller_gamepad, gp_face2)) {
    controller_active = false;
	global.controllertoolbar = false;
    active_button = -1;
}

// Controller navigation
if (controller_active) {
    // Left/right to switch categories
    if (gamepad_button_check_pressed(controller_gamepad, gp_padl)) {
        controller_button_index = max(0, controller_button_index - 1);
        active_button = controller_button_index;
        controller_item_index = 0;
    }
    if (gamepad_button_check_pressed(controller_gamepad, gp_padr)) {
        controller_button_index = min(array_length(buttons) - 1, controller_button_index + 1);
        active_button = controller_button_index;
        controller_item_index = 0;
    }

    // Up/down to navigate dropdown
    if (active_button >= 0 && active_button < array_length(buttons)) {
        var item_count = array_length(buttons[active_button].items);
        if (gamepad_button_check_pressed(controller_gamepad, gp_padu)) {
            controller_item_index = max(0, controller_item_index - 1);
			mouse_over_button = controller_item_index;
        }
        if (gamepad_button_check_pressed(controller_gamepad, gp_padd)) {
            controller_item_index = min(item_count - 1, controller_item_index + 1);
			mouse_over_button = controller_item_index;
        }

        // Select with A (face1)
        if (gamepad_button_check_pressed(controller_gamepad, gp_face1)) {
            var item_name = buttons[active_button].items[controller_item_index];

            switch (buttons[active_button].name) {
            case "File":
                switch (item_name) {
                    case "New Level":
						show_debug_message("Action: New Level");
						window_set_caption("Sunrise Editor - New Level");
						if global.cmauto != "" {
							room_restart();
						} else if global.cmauto = "" {
							var btns = [
							    {label:"Yes, save my changes!", action: dummyscript()},
							    {label:"Forget all of my progress!",  action: dummyscript()},
							    {label:"Oops, continue editing!", action: dummyscript()}
							];

							scr_show_dialog("You have unsaved changes! Save?", spr_dialog_warning, btns);	
						}
					break;
                    case "Open Level": 
						show_debug_message("Action: Open Level"); 
						load_level();
					break;
					case "Save Level":
						show_debug_message("Action: Save Level");
						if global.cmauto != ""
							save_level();
						else
							save_level_as();
					break;
					case "Save Level as...": 
						show_debug_message("Action: Save Level as..."); 
						save_level_as();
					break;
                    case "Exit": 
						var btns = [
							{label:"Yes, save my changes!", action: dummyscript()},
							{label:"Forget my progress!",  action: dummyscript()},
							{label:"Oops, continue editing!", action: dummyscript()}
						];

						scr_show_dialog("Do you want to save before exiting?", spr_dialog_filesave, btns);	
					break;
                }
			break;

            case "Edit":
                switch (item_name) {
                    case "Undo": show_debug_message("Action: Undo"); break;
                    case "Redo": show_debug_message("Action: Redo"); break;
                    case "Cut": show_debug_message("Action: Cut"); break;
                    case "Copy": show_debug_message("Action: Copy"); break;
                    case "Paste": show_debug_message("Action: Paste"); break;
                }
			break;
			
			case "Level Options":
                switch (item_name) {
                    case "Set Name":
						global.newlvl = get_string_async("Enter a new level name:","");
					break; 
					
					case "Playtest Level":
						global.playtest = true;
						instance_destroy();
					break;
					
					case "Publish Level":
						toast_create("This feature is coming soon. Check back later!", 1);	
					break;
                }
			break;
        }

            controller_active = false;
            active_button = -1;
        }
    }
}


// Check hover on toolbar buttons
for (var i = 0; i < array_length(buttons); i++) {
    var bx = i * button_width;
    var by = 0;

    if (mx >= bx && mx < bx + button_width && my >= by && my < by + button_height) {
        mouse_over_button = i;
        break;
    }
}

// Check hover on dropdown items if dropdown open and mouse not over toolbar buttons
if (active_button >= 0 && mouse_over_button == -1) {
    var bx = active_button * button_width;
    var by = button_height;
    var item_h = button_height;

    if (mx >= bx && mx < bx + button_width && my >= by && my < by + dropdown_height) {
        var relative_y = my - by;
        var idx = floor(relative_y / item_h);
        if (idx < array_length(buttons[active_button].items)) {
            mouse_over_item = idx;
        }
    }
}

// --- Mouse click detection ---

var mouse_left = mouse_check_button(mb_left);
var mouse_clicked = (mouse_left && !mouse_left_prev);
mouse_left_prev = mouse_left;

if (mouse_clicked) {
    // Clicked on toolbar buttons?
    var clicked_button = -1;
    for (var i = 0; i < array_length(buttons); i++) {
        var bx = i * button_width;
        var by = 0;

        if (mx >= bx && mx < bx + button_width && my >= by && my < by + button_height) {
            clicked_button = i;
            break;
        }
    }

    if (clicked_button != -1) {
        // Toggle dropdown for clicked button
        if (active_button == clicked_button) {
            active_button = -1;
        } else {
            active_button = clicked_button;
        }
    } else if (active_button >= 0) {
        // Click outside dropdown closes it
        var bx = active_button * button_width;
        var by = button_height;
        var full_height = array_length(buttons[active_button].items) * button_height;

        if (!(mx >= bx && mx < bx + button_width && my >= by && my < by + full_height)) {
            active_button = -1;
        }
    }

    // Check if clicked a dropdown item
    if (active_button >= 0 && mouse_over_item >= 0) {
        var item_name = buttons[active_button].items[mouse_over_item];
        show_debug_message("Clicked: " + buttons[active_button].name + " -> " + item_name);

        // Run actions depending on button and item
        switch (buttons[active_button].name) {
            case "File":
                switch (item_name) {
                    case "New Level":
						show_debug_message("Action: New Level");
						window_set_caption("Sunrise Editor - New Level");
						if global.cmauto != "" {
							room_restart();
						} else if global.cmauto = "" {
							var btns = [
							    {label:"Yes, save my changes!", action: dummyscript()},
							    {label:"Forget all of my progress!",  action: dummyscript()},
							    {label:"Oops, continue editing!", action: dummyscript()}
							];

							scr_show_dialog("You have unsaved changes! Save?", spr_dialog_warning, btns);	
						}
					break;
                    case "Open Level": 
						show_debug_message("Action: Open Level"); 
						load_level();
					break;
					case "Save Level":
						show_debug_message("Action: Save Level");
						if global.cmauto != ""
							save_level();
						else
							save_level_as();
					break;
					case "Save Level as...": 
						show_debug_message("Action: Save Level as..."); 
						save_level_as();
					break;
                    case "Exit": 
						var btns = [
							{label:"Yes, save my changes!", action: dummyscript()},
							{label:"Forget my progress!",  action: dummyscript()},
							{label:"Oops, continue editing!", action: dummyscript()}
						];

						scr_show_dialog("Do you want to save before exiting?", spr_dialog_filesave, btns);	
					break;
                }
			break;

            case "Edit":
                switch (item_name) {
                    case "Undo": show_debug_message("Action: Undo"); break;
                    case "Redo": show_debug_message("Action: Redo"); break;
                    case "Cut": show_debug_message("Action: Cut"); break;
                    case "Copy": show_debug_message("Action: Copy"); break;
                    case "Paste": show_debug_message("Action: Paste"); break;
                }
			break;
			
			case "Level Options":
                switch (item_name) {
                    case "Set Name":
						global.newlvl = get_string("Enter a new level name:","");
						if global.newlvl == "" or global.newlvl == noone
							global.newlvl = "Unnamed Level"	

						window_set_caption("Sunrise Editor - " + global.newlvl);
					break;
                    case "Set Author": 
						global.lvlauthor = get_string("Enter your name, this will automatically grab your account name later in development!","");
					break;
					
					case "Playtest Level":
						global.playtest = true;
						instance_destroy();
					break;
					
					case "Publish Level":
						toast_create("This feature is coming soon. Check back later!", 1);	
					break;
                }
			break;
        }

        // Close dropdown after selection
        active_button = -1;
    }
}

// --- Animate dropdown open/close with lerp ---

var lerp_speed = 0.5;

if (active_button >= 0 && active_button < array_length(buttons)) {
    dropdown_target_height = array_length(buttons[active_button].items) * button_height;
} else {
    dropdown_target_height = 0;
}

dropdown_height = lerp(dropdown_height, dropdown_target_height, lerp_speed);

if (abs(dropdown_height - dropdown_target_height) < 0.5) {
    dropdown_height = dropdown_target_height;
}

if autosave_time != 0 && do_autosave == true {
	autosave_time--;	
} else if do_autosave == true {
	save_level_autosave();
	autosave_time = 7200; // 2 minutes
	do_autosave = true;
}

if keyboard_check(vk_control) && keyboard_check_pressed(ord("S")) {
	show_debug_message("Action: Save Level");
	if global.cmauto != ""
		save_level();
	else
		save_level_as();
}