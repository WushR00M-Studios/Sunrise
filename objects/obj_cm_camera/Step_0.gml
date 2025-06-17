//panning
//when the mouse button is pressed, it captures the values of the mouse's X and Y position.
//Because the view is going to be moved, we want the position of the mouse in relation to
// the window, not the view.
if mouse_check_button_pressed(mb_middle)
{
mouse_xstart = window_views_mouse_get_x();
mouse_ystart = window_views_mouse_get_y();
global.cursormode = 4;
}

//so long as the mouse button is held down, the X and Y coordinate of the view will change to
// be the difference between the mouse's current position and the position it was when we started.
if mouse_check_button(mb_middle)
{
view_xview += mouse_xstart - window_views_mouse_get_x();
view_yview += mouse_ystart - window_views_mouse_get_y();
}

if mouse_check_button_released(mb_middle)
	global.cursormode = 1;

if gamepad_axis_value(0, gp_axisrh) >= 0.5
	view_xview += 16;

if gamepad_axis_value(0, gp_axisrh) <= -0.5
	view_xview -= 16;
	
if gamepad_axis_value(0, gp_axisrv) >= 0.5
	view_yview += 16;
	
if gamepad_axis_value(0, gp_axisrv) <= -0.5
	view_yview -= 16;

if view_xview <= 0 
	view_xview = 0;
	
if view_yview <= 0	
	view_yview = 0;
	
if view_xview >= room_width
	view_xview = 0;
	
if view_yview >= room_height
	view_yview = 0;
	
camera_set_view_pos(camera,view_xview,view_yview)

x = mouse_x;
y = mouse_y;