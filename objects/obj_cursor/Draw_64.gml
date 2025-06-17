if global.cursormode == 1 || global.cursormode == 0
	draw_sprite(spr_cur_default, 0, device_mouse_x_to_gui(0), device_mouse_y_to_gui(0));
else if global.cursormode == 2
	draw_sprite(spr_cur_pencil, 0, device_mouse_x_to_gui(0), device_mouse_y_to_gui(0));
else if global.cursormode == 3
	draw_sprite(spr_cur_eraser, 0, device_mouse_x_to_gui(0), device_mouse_y_to_gui(0));
else if global.cursormode == 4
	draw_sprite(spr_cur_move, 0, device_mouse_x_to_gui(0), device_mouse_y_to_gui(0));
else if global.cursormode == 5
	draw_sprite(spr_cur_pick, 0, device_mouse_x_to_gui(0), device_mouse_y_to_gui(0));
else if global.cursormode == 6
	draw_sprite(spr_cur_nope, 0, device_mouse_x_to_gui(0), device_mouse_y_to_gui(0));