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
						global.newlvl = "Unnamed Level";
						global.lvlauthor = "Unknown";
						window_set_caption("Sunrise Editor - New Level");
						room_restart();
					break;
                    case "Open Level": 
						show_debug_message("Action: Open Level"); 
						controller_active = false;
						global.controllertoolbar = false;
						active_button = -1;
						var file = get_open_filename("Sunrise Levels|*.srlvl","");
						if file != noone {
							ini_open(file);
							show_debug_message("Level file opened!");
							if ini_section_exists("info") {
								show_debug_message("Valid [1]");
								if ini_key_exists("info","name") {
									show_debug_message("Valid [2]");
									global.newlvl = ini_read_string("info","name","Unnamed Level")
									if ini_key_exists("info","author") {
										show_debug_message("Valid [3]");
										global.lvlauthor = ini_read_string("info","author","Unknown");
										
										layer_destroy_instances("Objects");
										
										ini_open(file);
										var index = 0;

										while (true) {
										    var section_name = "Object_" + string(index);
										    if (!ini_section_exists(section_name)) {
										        break; // No more entries
										    }
										    var obj_name = ini_read_string(section_name, "name", "");
										    var obj_x = ini_read_real(section_name, "x", 0);
										    var obj_y = ini_read_real(section_name, "y", 0);
											
										    var obj_index = asset_get_index(obj_name);
										    if (obj_index != -1) {
										        instance_create_layer(obj_x, obj_y, "Objects", obj_index);
											}
										    index += 1;
										}
										
										ini_close();
										show_debug_message("Level parsed successfully!");
										toast_dismiss();
										toast_create("Level successfully opened!", 2);
										window_set_caption("Sunrise Editor - " + global.newlvl);
									} else {
										ini_close();
										show_debug_message("Error: author not found");
										toast_dismiss();
										toast_create("FAILURE: We couldn't open your level file!", 4);
									}
								} else {
									ini_close();
									show_debug_message("Error: level title not found");
									toast_dismiss();
									toast_create("FAILURE: We couldn't open your level file!", 4);
								}
							} else {
								ini_close();
								show_debug_message("Error: info section not found");
								toast_dismiss();
								toast_create("FAILURE: We couldn't open your level file!", 4);
							}
						} else {
							toast_dismiss();
							toast_create("FAILURE: No or invalid level file entered!", 4);	
						}
					break;
					case "Save Level":
						show_debug_message("Action: Save Level");
						controller_active = false;
						global.controllertoolbar = false;
						active_button = -1;
						if savedyet == false {
							show_debug_message("Action: Save Level as..., because we haven't saved yet"); 
							var file = get_save_filename("Sunrise Levels|*.srlvl","");
							if file != noone {
								global.autosave_name = file;
								ini_open(file);
								show_debug_message("Saving level file...");
								show_debug_message("Saving title information...");
								ini_write_string("info","name",global.newlvl);
								show_debug_message("Saving author information...");
								ini_write_string("info","author",global.lvlauthor);

									var layer_name = "Objects"
									var file_name = file;

									ini_open(file_name);
									var index = 0;

									with (all) {
									    if (layer_get_name(layer) == layer_name) {
									        var obj_name = object_get_name(object_index);
									        var section = "Object_" + string(index);

									        ini_write_string(section, "name", obj_name);
									        ini_write_real(section, "x", x);
									        ini_write_real(section, "y", y);

											show_debug_message("Object_" + string(index) + " saved");
									        index += 1;
									    }
									}
					
								show_debug_message("Level saved!");
								ini_close();
								toast_dismiss();
								toast_create("Level successfully saved!", 2);
								window_set_caption("Sunrise Editor - " + global.newlvl);
								savedyet = true;
							} else {
								toast_dismiss();
								toast_create("FAILURE: No or invalid level file entered!", 4);		
							}
						} else {
							ini_open(global.autosave_name);
							show_debug_message("Saving level file...");
							show_debug_message("Saving title information...");
							ini_write_string("info","name",global.newlvl);
							show_debug_message("Saving author information...");
							ini_write_string("info","author",global.lvlauthor);

								var layer_name = "Objects"
								var file_name = global.autosave_name;

								ini_open(file_name);
								var index = 0;

								with (all) {
								    if (layer_get_name(layer) == layer_name) {
								        var obj_name = object_get_name(object_index);
								        var section = "Object_" + string(index);

								        ini_write_string(section, "name", obj_name);
								        ini_write_real(section, "x", x);
								        ini_write_real(section, "y", y);

										show_debug_message("Object_" + string(index) + " saved");
								        index += 1;
								    }
								}
					
							show_debug_message("Level saved!");
							ini_close();
							toast_dismiss();
							toast_create("Level successfully saved!", 2);
							window_set_caption("Sunrise Editor - " + global.newlvl);	
						}
					break;
					case "Save Level as...": 
						show_debug_message("Action: Save Level as..."); 
						controller_active = false;
						global.controllertoolbar = false;
						active_button = -1;
						var file = get_save_filename("Sunrise Levels|*.srlvl","");
						if file != noone {
							global.autosave_name = file;
							ini_open(file);
							show_debug_message("Saving level file...");
							show_debug_message("Saving title information...");
							ini_write_string("info","name",global.newlvl);
							show_debug_message("Saving author information...");
							ini_write_string("info","author",global.lvlauthor);

								var layer_name = "Objects"
								var file_name = file;

								ini_open(file_name);
								var index = 0;

								with (all) {
								    if (layer_get_name(layer) == layer_name) {
								        var obj_name = object_get_name(object_index);
								        var section = "Object_" + string(index);

								        ini_write_string(section, "name", obj_name);
								        ini_write_real(section, "x", x);
								        ini_write_real(section, "y", y);

										show_debug_message("Object_" + string(index) + " saved");
								        index += 1;
								    }
								}
					
							show_debug_message("Level saved!");
							ini_close();
							toast_dismiss();
							toast_create("Level successfully saved!", 2);
							window_set_caption("Sunrise Editor - " + global.newlvl);
							savedyet = true;
						} else {
							toast_dismiss();
							toast_create("FAILURE: No or invalid level file entered!", 4);		
						}
					break;
                    case "Import": 
						toast_dismiss();
						toast_create("This feature is coming soon. Check back later!", 1);	
						controller_active = false;
						global.controllertoolbar = false;
						active_button = -1;
						//var url = get_string("Enter a valid URL link!","");
						//download = http_get_file(url, working_directory);
					break;
                    case "Exit": 
						audio_stop_all();
						audio_play_sound(mus_mainmenu, 0, true);
						instance_create_depth(0, 0, -1, obj_fadein_routine_mainmenu);
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
						global.newlvl = "Unnamed Level";
						global.lvlauthor = "Unknown";
						window_set_caption("Sunrise Editor - New Level");
						room_restart();
					break;
                    case "Open Level": 
						show_debug_message("Action: Open Level"); 
						var file = get_open_filename("Sunrise Levels|*.srlvl","");
						if file != noone {
							ini_open(file);
							show_debug_message("Level file opened!");
							if ini_section_exists("info") {
								show_debug_message("Valid [1]");
								if ini_key_exists("info","name") {
									show_debug_message("Valid [2]");
									global.newlvl = ini_read_string("info","name","Unnamed Level")
									if ini_key_exists("info","author") {
										show_debug_message("Valid [3]");
										global.lvlauthor = ini_read_string("info","author","Unknown");
										
										layer_destroy_instances("Objects");
										
										ini_open(file);
										var index = 0;

										while (true) {
										    var section_name = "Object_" + string(index);
										    if (!ini_section_exists(section_name)) {
										        break; // No more entries
										    }
										    var obj_name = ini_read_string(section_name, "name", "");
										    var obj_x = ini_read_real(section_name, "x", 0);
										    var obj_y = ini_read_real(section_name, "y", 0);
											
										    var obj_index = asset_get_index(obj_name);
										    if (obj_index != -1) {
										        instance_create_layer(obj_x, obj_y, "Objects", obj_index);
											}
										    index += 1;
										}
										
										ini_close();
										show_debug_message("Level parsed successfully!");
										toast_dismiss();
										toast_create("Level successfully opened!", 2);
										window_set_caption("Sunrise Editor - " + global.newlvl);
									} else {
										ini_close();
										show_debug_message("Error: author not found");
										toast_dismiss();
										toast_create("FAILURE: We couldn't open your level file!", 4);
									}
								} else {
									ini_close();
									show_debug_message("Error: level title not found");
									toast_dismiss();
									toast_create("FAILURE: We couldn't open your level file!", 4);
								}
							} else {
								ini_close();
								show_debug_message("Error: info section not found");
								toast_dismiss();
								toast_create("FAILURE: We couldn't open your level file!", 4);
							}
						} else {
							toast_dismiss();
							toast_create("FAILURE: No or invalid level file entered!", 4);	
						}
					break;
					case "Save Level":
						show_debug_message("Action: Save Level");
						if savedyet == false {
							show_debug_message("Action: Save Level as..., because we haven't saved yet"); 
							var file = get_save_filename("Sunrise Levels|*.srlvl","");
							if file != noone {
								global.autosave_name = file;
								ini_open(file);
								show_debug_message("Saving level file...");
								show_debug_message("Saving title information...");
								ini_write_string("info","name",global.newlvl);
								show_debug_message("Saving author information...");
								ini_write_string("info","author",global.lvlauthor);

									var layer_name = "Objects"
									var file_name = file;

									ini_open(file_name);
									var index = 0;

									with (all) {
									    if (layer_get_name(layer) == layer_name) {
									        var obj_name = object_get_name(object_index);
									        var section = "Object_" + string(index);

									        ini_write_string(section, "name", obj_name);
									        ini_write_real(section, "x", x);
									        ini_write_real(section, "y", y);

											show_debug_message("Object_" + string(index) + " saved");
									        index += 1;
									    }
									}
					
								show_debug_message("Level saved!");
								ini_close();
								toast_dismiss();
								toast_create("Level successfully saved!", 2);
								window_set_caption("Sunrise Editor - " + global.newlvl);
								savedyet = true;
							} else {
								toast_dismiss();
								toast_create("FAILURE: No or invalid level file entered!", 4);		
							}
						} else {
							ini_open(global.autosave_name);
							show_debug_message("Saving level file...");
							show_debug_message("Saving title information...");
							ini_write_string("info","name",global.newlvl);
							show_debug_message("Saving author information...");
							ini_write_string("info","author",global.lvlauthor);

								var layer_name = "Objects"
								var file_name = global.autosave_name;

								ini_open(file_name);
								var index = 0;

								with (all) {
								    if (layer_get_name(layer) == layer_name) {
								        var obj_name = object_get_name(object_index);
								        var section = "Object_" + string(index);

								        ini_write_string(section, "name", obj_name);
								        ini_write_real(section, "x", x);
								        ini_write_real(section, "y", y);

										show_debug_message("Object_" + string(index) + " saved");
								        index += 1;
								    }
								}
					
							show_debug_message("Level saved!");
							ini_close();
							toast_dismiss();
							toast_create("Level successfully saved!", 2);
							window_set_caption("Sunrise Editor - " + global.newlvl);	
						}
					break;
					case "Save Level as...": 
						show_debug_message("Action: Save Level as..."); 
						var file = get_save_filename("Sunrise Levels|*.srlvl","");
						if file != noone {
							global.autosave_name = file;
							ini_open(file);
							show_debug_message("Saving level file...");
							show_debug_message("Saving title information...");
							ini_write_string("info","name",global.newlvl);
							show_debug_message("Saving author information...");
							ini_write_string("info","author",global.lvlauthor);

								var layer_name = "Objects"
								var file_name = file;

								ini_open(file_name);
								var index = 0;

								with (all) {
								    if (layer_get_name(layer) == layer_name) {
								        var obj_name = object_get_name(object_index);
								        var section = "Object_" + string(index);

								        ini_write_string(section, "name", obj_name);
								        ini_write_real(section, "x", x);
								        ini_write_real(section, "y", y);

										show_debug_message("Object_" + string(index) + " saved");
								        index += 1;
								    }
								}
					
							show_debug_message("Level saved!");
							ini_close();
							toast_dismiss();
							toast_create("Level successfully saved!", 2);
							window_set_caption("Sunrise Editor - " + global.newlvl);
							savedyet = true;
						} else {
							toast_dismiss();
							toast_create("FAILURE: No or invalid level file entered!", 4);		
						}
					break;
                    case "Download & Import": 
						//var url = get_string("Enter a valid URL link!","");
						//download = http_get_file(url, working_directory);
						toast_create("This feature is coming soon. Check back later!", 1);	
					break;
                    case "Exit": 
						audio_stop_all();
						audio_play_sound(mus_mainmenu, 0, true);
						instance_create_depth(0, 0, -1, obj_fadein_routine_mainmenu);
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
		ini_open(global.autosave_name);
		show_debug_message("Saving level file...");
		show_debug_message("Saving title information...");
		ini_write_string("info","name",global.newlvl);
		show_debug_message("Saving author information...");
		ini_write_string("info","author",global.lvlauthor);

			var layer_name = "Objects"
			var file_name = global.autosave_name;

			ini_open(file_name);
			var index = 0;

			with (all) {
			    if (layer_get_name(layer) == layer_name) {
			        var obj_name = object_get_name(object_index);
			        var section = "Object_" + string(index);

			        ini_write_string(section, "name", obj_name);
			        ini_write_real(section, "x", x);
			        ini_write_real(section, "y", y);

					show_debug_message("Object_" + string(index) + " saved");
			        index += 1;
			    }
			}

		show_debug_message("Level saved!");
		ini_close();
		window_set_caption("Sunrise Editor - " + global.newlvl);
		toast_dismiss();
		toast_create("Autosave complete!", 2);
		autosave_time = 7200; // 2 minutes
		do_autosave = true;
}

if keyboard_check(vk_control) && keyboard_check_pressed(ord("S")) {
	show_debug_message("Action: Save Level");
	controller_active = false;
	global.controllertoolbar = false;
	active_button = -1;
	if savedyet == false {
		show_debug_message("Action: Save Level as..., because we haven't saved yet"); 
		var file = get_save_filename("Sunrise Levels|*.srlvl","");
		if file != noone {
			global.autosave_name = file;
			ini_open(file);
			show_debug_message("Saving level file...");
			show_debug_message("Saving title information...");
			ini_write_string("info","name",global.newlvl);
			show_debug_message("Saving author information...");
			ini_write_string("info","author",global.lvlauthor);

				var layer_name = "Objects"
				var file_name = file;

				ini_open(file_name);
				var index = 0;

				with (all) {
				    if (layer_get_name(layer) == layer_name) {
				        var obj_name = object_get_name(object_index);
				        var section = "Object_" + string(index);

				        ini_write_string(section, "name", obj_name);
				        ini_write_real(section, "x", x);
				        ini_write_real(section, "y", y);

						show_debug_message("Object_" + string(index) + " saved");
				        index += 1;
				    }
				}

			show_debug_message("Level saved!");
			ini_close();
			toast_dismiss();
			toast_create("Level successfully saved!", 2);
			window_set_caption("Sunrise Editor - " + global.newlvl);
			savedyet = true;
		} else {
			toast_dismiss();
			toast_create("FAILURE: No or invalid level file entered!", 4);		
		}	
	}
}