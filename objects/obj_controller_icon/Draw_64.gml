draw_self();
draw_set_halign(fa_center);
draw_set_font(Font4_big);
if global.controllertype == 1
	draw_text(672, 576, "Xbox Series Controller");
else if global.controllertype == 2
	draw_text(672, 576, "Nintendo Switch (2) Pro Controller");
else if global.controllertype == 3
	draw_text(672, 576, "Dualshock / Dualsense Controller");
else
	draw_text(672, 576, "Unknown Controller");