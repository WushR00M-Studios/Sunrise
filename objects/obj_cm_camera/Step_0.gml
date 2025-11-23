//panning
if global.inputtype {
	if mouse_check_button_pressed(mb_middle) {
		mouse_xstart = window_views_mouse_get_x();
		mouse_ystart = window_views_mouse_get_y();
		global.cursormode = 4;
	}

	if mouse_check_button(mb_middle) {
		view_xport[0] += mouse_xstart - window_views_mouse_get_x();
		view_yport[0] += mouse_ystart - window_views_mouse_get_y();
	}

	if mouse_check_button_released(mb_middle)
		global.cursormode = 1;
} else {
	if InputCheck(INPUT_VERB.RJOY_LEFT)
		view_xport[0] -= 16;
	if InputCheck(INPUT_VERB.RJOY_RIGHT)
		view_xport[0] += 16;
	if InputCheck(INPUT_VERB.RJOY_DOWN)
		view_yport[0] += 16;
	if InputCheck(INPUT_VERB.RJOY_UP)
		view_yport[0] -= 16;

	if view_xport[0] < 0 
		view_xport[0] = 0;
	if view_yport[0] < 0	
		view_yport[0] = 0;
	if view_xport[0] > (room_width - view_wport[0])
		view_xport[0] = (room_width - view_wport[0]);
	if view_yport[0] > (room_width - view_hport[0])
		view_yport[0] = (room_width - view_hport[0]);
}