if global.cm_tool == 1 {
	instance_create_layer(0, 0, "UI", obj_radial_terrain);
	instance_destroy();
} else if global.cm_tool == 2 {
	instance_create_layer(0, 0, "UI", obj_radial_object);
	instance_destroy();
}

var count = array_length(global.cm_items3);

// Mouse scroll
if (mouse_wheel_up()) {
	if global.cm_sel > 0 {
		global.cm_sel = global.cm_sel - 1;
	}
} else if (mouse_wheel_down()) {
	if global.cm_tool == 1 {
	    if global.cm_sel < 11 {
			global.cm_sel = global.cm_sel + 1;
		}
	} else if global.cm_tool == 2 {
	    if global.cm_sel < 2 {
			global.cm_sel = global.cm_sel + 1;
		}
	} else if global.cm_tool == 3 {
	  
	}
}

if global.cm_tool == 1 {
	if global.cm_sel > 1
		global.cm_sel = 1;
} else if global.cm_tool == 2 {
	if global.cm_sel > 11
		global.cm_sel = 11;
} else if global.cm_tool == 3 {
		if global.cm_sel > 0
		global.cm_sel = 0;
}

// Gamepad support
var gp = 0;
if (gamepad_is_connected(gp)) {
    if (gamepad_button_check_pressed(gp, gp_shoulderl)) {
        global.cm_sel = (global.cm_sel - 1 + count) mod count;
    } else if (gamepad_button_check_pressed(gp, gp_shoulderr)) {
        global.cm_sel = (global.cm_sel + 1) mod count;
    }
}

// Smooth scroll transition
cm_target_offset = global.cm_sel;
cm_angle_offset = lerp(cm_angle_offset, cm_target_offset, cm_lerp_speed);

// Scale tweening for display items
for (var i = 0; i < count; i++) {
    var dist = abs(i - global.cm_sel);
    if (dist > count / 2) dist = count - dist; // wrap-around
    var scale = 0.5;
    if (dist == 0) scale = 1;
    else if (dist == 1) scale = 0.75;
    else if (dist == 2) scale = 0.6;
    else scale = 0;
    cm_scales[i] = lerp(cm_scales[i], scale, 0.2);
}
