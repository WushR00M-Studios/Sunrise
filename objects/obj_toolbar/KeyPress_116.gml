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