var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);
var mouse_click = mouse_check_button_pressed(mb_left);

if (state == "main") {
    if (mouse_click && point_in_rectangle(mx, my, join_btn.x, join_btn.y, join_btn.x + join_btn.w, join_btn.y + join_btn.h)) {
        state = "joining";
        input_code = "";
    }
    if (mouse_click && point_in_rectangle(mx, my, host_btn.x, host_btn.y, host_btn.x + host_btn.w, host_btn.y + host_btn.h)) {
        state = "hosting";
        invite_code = generate_invite_code();
        start_host_server();
        if (!instance_exists(obj_party_hud)) {
            instance_create_depth(0, 0, -50, obj_party_hud);
        }
    }
}

if (state == "joining") {
    if (mouse_click && point_in_rectangle(mx, my, confirm_btn.x, confirm_btn.y, confirm_btn.x + confirm_btn.w, confirm_btn.y + confirm_btn.h)) {
        attempt_join_with_code(input_code);
		if !instance_exists(obj_joingame_async)
			instance_create_depth(0, 0, -1, obj_joingame_async);
		
		if !instance_exists(obj_server_host)
			instance_create_depth(0, 0, -1, obj_party_man);
		
        if (!instance_exists(obj_party_hud)) {
            instance_create_depth(0, 0, -50, obj_party_hud);
        }
    }
    if (mouse_click && point_in_rectangle(mx, my, cancel_btn.x, cancel_btn.y, cancel_btn.x + cancel_btn.w, cancel_btn.y + cancel_btn.h)) {
        state = "main";
    }
}

if (state == "hosting") {
	if !instance_exists(obj_server_host)
		instance_create_depth(0, 0, -1, obj_server_host);
		
    if (mouse_click && point_in_rectangle(mx, my, cancel_btn.x, cancel_btn.y, cancel_btn.x + cancel_btn.w, cancel_btn.y + cancel_btn.h)) {
        shutdown_host(); // optional if you made a shutdown_host script
        state = "main";
    }
}
