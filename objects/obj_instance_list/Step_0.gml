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
    
        if instance_exists(obj_cm_camera) {
				with obj_cm_camera {
					cancelout = true;	
				}	
			}
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
            
            if instance_exists(obj_cm_camera) {
    				with obj_cm_camera {
    					cancelout = false;	
    				}	
    			}
        break;
	}

	// Button logic only when open
	if (state == "open") {
			var btn_count = array_length(buttons);
		    var btn_w = 300;
			var btn_h = 32;
			var btn_gap = 8;
			var start_y = view_yport[0]+64;
		    var new_hover = -1;
		    for (var i=0; i<btn_count; i++) {
		        var bx = _x+_w/2 - btn_w/2;
		        var by = start_y + i*(btn_h+btn_gap);

		        if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), bx, by, bx+btn_w, by+btn_h)) {
		            new_hover = i;
		            if (mouse_check_button_pressed(mb_left)) {
		                if buttons[i].label == "Close Objects Menu" {
							global.cmselection = 0;
						} else if buttons[i].label == "Solid Block" {
							global.cmselection = 1;
						} else if buttons[i].label == "Autoterrain" {
							global.cmselection = 2;
						} else if buttons[i].label == "Text Display" {
							global.cmselection = 3;
						} else if buttons[i].label == "Bit" {
							global.cmselection = 4;
						} else {
							state = "closing";
							global.cmselection = 0;
							global.cmmode = 1;
						}
				
		                state = "closing";
						global.cmmode = 1;
		            }
					
		        } else {
					
						
				}
		    }
		    hover_index = new_hover;
		
	}

	if (visible) {
	    // Block mouse input from reaching other objects
	    mouse_clear(mb_left);
	    mouse_clear(mb_right);
	    mouse_clear(mb_middle);
	    // Optional: also block wheel
	    mouse_wheel_up();
	    mouse_wheel_down();
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