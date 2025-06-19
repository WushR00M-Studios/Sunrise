if (global.cm_tool == 1 or global.cm_tool == 2) && global.playtest == false {	
	if gamepad_is_connected(0) {
		if global.controllertoolbar == false {
			if gamepad_button_check_pressed(0, gp_padu)
				y -= 32;
		
			if gamepad_button_check_pressed(0, gp_padd)
				y += 32;
		
			if gamepad_button_check_pressed(0, gp_padl)
				x -= 32;
		
			if gamepad_button_check_pressed(0, gp_padr)
				x += 32;
			
			if gamepad_axis_value(0, gp_axislh) >= 0.8 {
				if stick_cooldown == 0 {
					x += 32;
					stick_cooldown = 7;
				} else {
					stick_cooldown -= 1;
				}
			}
				
			if gamepad_axis_value(0, gp_axislh) <= -0.8 {
				if stick_cooldown == 0 {
					x -= 32;
					stick_cooldown = 7;
				} else {
					stick_cooldown -= 1;
				}
			}
				
			if gamepad_axis_value(0, gp_axislv) >= 0.8 {
				if stick_cooldown == 0 {
					y += 32;
					stick_cooldown = 7;
				} else {
					stick_cooldown -= 1;
				}
			}

			if gamepad_axis_value(0, gp_axislv) <= -0.8 {
				if stick_cooldown == 0 {
					y -= 32;
					stick_cooldown = 7;
				} else {
					stick_cooldown -= 1;
				}		
			}
			
			if gamepad_button_check_pressed(0, gp_shoulderl) {
				if global.cm_tool == 1 or global.cm_tool == 2 {
					if item_index == 1
						item_index = 1;
					else
						item_index -= 1;
				}
			}
	
			if gamepad_button_check_pressed(0, gp_shoulderr) {
				if global.cm_tool == 1 {
					if item_index >= 2
						item_index = 2;
					else
						item_index += 1;
				} else if global.cm_tool == 2 {
					if item_index >= 3
						item_index = 3;
					else
						item_index += 1;
				}
			}
	
			if gamepad_button_check(0, gp_shoulderlb) {
				if global.cm_tool == 1 {
					if item_index == 1 {
						instance_create_layer(x, y, "Objects", obj_autoterrain_grass);	
					} else if item_index == 2 {
						instance_create_layer(x, y, "Objects", obj_autoterrain_metal);	
					}
				} else if global.cm_tool == 2 {
					if item_index == 1 {
						instance_create_layer(x, y, "Objects", obj_solid_cm);	
					} else if item_index == 2 {
						instance_create_layer(x, y, "Objects", obj_light_cm);
					} else if item_index == 3 {
						global.txtthing = get_string("Enter text to display! Use your keyboard.","");
						instance_create_layer(x, y, "Objects", obj_txt_cm);	
					}
				}
			}
			
		}
	} else {
		x = mouse_x;
		y = mouse_y;
	
		move_snap(32, 32);
	
		if keyboard_check_pressed(vk_left) {
			if global.cm_tool == 1 {
				if item_index == 1
					item_index = 1;
				else
					item_index -= 1;
			}
		}
	
		if keyboard_check_pressed(vk_right) {
			if global.cm_tool == 1 {
				if item_index > 2
					item_index = 2;
				else
					item_index += 1;
			} else if global.cm_tool == 2 {
				if item_index > 3
					item_index = 3;
				else
					item_index += 1;
			}
		}
	
		if mouse_check_button(mb_right) {
			if global.cm_tool == 1 {
				if item_index == 1 {
					instance_create_layer(x, y, "Objects", obj_autoterrain_grass);	
				} else if item_index == 2 {
					instance_create_layer(x, y, "Objects", obj_autoterrain_metal);	
				}
			} else if global.cm_tool == 2 {
				if item_index == 1 {
					instance_create_layer(x, y, "Objects", obj_solid_cm);	
				} else if item_index == 2 {
					instance_create_layer(x, y, "Objects", obj_light_cm);
				} else if item_index == 3 {
					global.txtthing = get_string("Enter text to display! Use your keyboard.","");
					instance_create_layer(x, y, "Objects", obj_txt_cm);	
				}
			}
		}
	}
}

if global.cm_tool == 1 {
	image_alpha = 0.5;
	
	if item_index == 1
		sprite_index = spr_autoter_grass;
	else if item_index == 2
		sprite_index = spr_autoter_metal_top_alone;
} else if global.cm_tool == 2 {
	image_alpha = 0.5;
	
	if item_index == 1
		sprite_index = spr_solid_placeholder;
	else if item_index == 2
		sprite_index = spr_light_notest;
	else if item_index == 3
		sprite_index = spr_textdisplay_notest;
} else if global.cm_tool == 3 or global.playtest == true {
	image_alpha = 0;	
}

if global.cm_tool == 1 {
	if item_index >= 2
		item_index = 2;
} else if global.cm_tool == 2 {
	if item_index >= 3
		item_index = 3;
} else {
	item_index = 1;	
}