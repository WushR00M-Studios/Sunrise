draw_set_font(Font8);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_bottom);

draw_set_alpha(0.5);

if global.inputtype
	draw_text(view_xport[0] + 72, view_hport[0] - 8, "Open Instances Menu using ENTER, Toggle Playtest Mode using SHIFT");
else
	draw_text(view_xport[0] + 72, view_hport[0] - 8, "Open Instances Menu using ACTION, Toggle Playtest Mode using SPECIAL");

draw_set_halign(fa_left);
draw_set_valign(fa_center);
draw_set_font(Font4);

draw_set_alpha(1);

draw_sprite(spr_brush_tool, 0, view_xport[0] + 32, view_hport[0] - 32);
draw_text(view_xport[0] + 72, view_hport[0] - 32, "Brush Mode");