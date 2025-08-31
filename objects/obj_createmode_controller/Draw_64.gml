draw_set_font(Font8);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_bottom);

draw_set_alpha(0.5);

draw_text(view_xport[0] + 72, view_hport[0] - 8, "Switch Modes using 1-3, Open Instances List using 4, Toggle Playtest Mode using 9, Open Properties Menu using 0");

draw_set_halign(fa_left);
draw_set_valign(fa_center);
draw_set_font(Font4);

draw_set_alpha(1);

if global.cmmode == 1 {
	draw_sprite(spr_brush_tool, 0, view_xport[0] + 32, view_hport[0] - 32);
	draw_text(view_xport[0] + 72, view_hport[0] - 32, "Brush Mode");
} else if global.cmmode == 2 {
	draw_sprite(spr_eyedropper_tool, 0, view_xport[0] + 32, view_hport[0] - 32);
	draw_text(view_xport[0] + 72, view_hport[0] - 32, "Picker Mode");
} else if global.cmmode == 3 {
	draw_sprite(spr_lasso_tool, 0, view_xport[0] + 32, view_hport[0] - 32);
	draw_text(view_xport[0] + 72, view_hport[0] - 32, "Lasso & Selection Mode");
}