// --- GUI mouse position
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

// --- Button Y & X positions
var btn_y = box_y + box_height - button_height - box_padding;
var btn_x = box_x + box_width - button_width - box_padding;

// --- Button 1 base X position
var btn1_x = button2_enabled
    ? box_x + box_width / 2 - button_width - box_padding / 2
    : box_x + (box_width - button_width) / 2;

// --- Button 1 scaled size and position
btn1_w = button_width * btn1_scale;
btn1_h = button_height * btn1_scale;
btn1_draw_x = btn1_x + (button_width - btn1_w) / 2;
btn1_draw_y = btn_y + (button_height - btn1_h) / 2;

// --- Button 2 base X position
if (button2_enabled) {
    var btn2_x = box_x + box_width / 2 + box_padding / 2;
    btn2_w = button_width * btn2_scale;
    btn2_h = button_height * btn2_scale;
    btn2_draw_x = btn2_x + (button_width - btn2_w) / 2;
    btn2_draw_y = btn_y + (button_height - btn2_h) / 2;
}

// Dynamically center horizontally
box_x = camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0]) - box_width) / 2;

// Target vertical position (center)
box_target_y = camera_get_view_y(view_camera[0]) + (camera_get_view_height(view_camera[0]) - box_height) / 2;

switch (anim_state) {
    case "in":
        box_y = lerp(box_y, box_target_y, anim_speed);
        if (abs(box_y - box_target_y) < 1) {
            box_y = box_target_y;
            anim_state = "idle";
        }
        break;

    case "out":
        box_y = lerp(box_y, display_get_height() + 50, anim_speed);
        if (box_y > display_get_height()) {
            anim_state = "hidden";
            show_buttons = false;
        }
        break;

    case "idle":
        // Do nothing, waiting for interaction
        break;
}

var hover_btn1 = point_in_rectangle(mx, my, btn1_draw_x, btn1_draw_y, btn1_draw_x + btn1_w, btn1_draw_y + btn1_h);
btn1_scale = lerp(btn1_scale, (hover_btn1 || selected_button == 0) ? hover_scale : normal_scale, scale_speed);

if (hover_btn1) selected_button = 0;

if (button2_enabled) {
    var hover_btn2 = point_in_rectangle(mx, my, btn2_draw_x, btn2_draw_y, btn2_draw_x + btn2_w, btn2_draw_y + btn2_h);
    btn2_scale = lerp(btn2_scale, (hover_btn2 || selected_button == 1) ? hover_scale : normal_scale, scale_speed);

    if (hover_btn2) selected_button = 1;
}


if (mouse_check_button_pressed(mb_left) && anim_state == "idle" && show_buttons) {
    if (point_in_rectangle(mx, my, btn1_draw_x, btn1_draw_y, btn1_draw_x + btn1_w, btn1_draw_y + btn1_h)) {
        dialog_result = "button1";
        anim_state = "out";
		if global.button1_callback != noone {
			script_execute(global.button1_callback);	
		}
    }

    if (button2_enabled) {
        if (point_in_rectangle(mx, my, btn2_draw_x, btn2_draw_y, btn2_draw_x + btn2_w, btn2_draw_y + btn2_h)) {
            dialog_result = "button2";
            anim_state = "out";
			if global.button2_callback != noone {
				script_execute(global.button2_callback);	
			}
        }
    }
}

if anim_state == "hidden"
	instance_destroy();