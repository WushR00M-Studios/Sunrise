if (show_buttons && anim_state == "idle") {
    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);
    
    var btn_y = box_y + box_height - button_height - box_padding;
    var btn1_x = button2_enabled 
        ? box_x + box_width / 2 - button_width - box_padding / 2
        : box_x + (box_width - button_width) / 2;
        
    // Button 1
    if (point_in_rectangle(mx, my, btn1_x, btn_y, btn1_x + button_width, btn_y + button_height)) {
        dialog_result = "button1";
        anim_state = "out";
    }

    // Button 2
    if (button2_enabled) {
        var btn2_x = box_x + box_width / 2 + box_padding / 2;
        if (point_in_rectangle(mx, my, btn2_x, btn_y, btn2_x + button_width, btn_y + button_height)) {
            dialog_result = "button2";
            anim_state = "out";
        }
    }
}
