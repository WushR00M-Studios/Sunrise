if !window_has_focus() or os_is_paused() {
	draw_set_alpha(0.5);
	draw_set_color(c_black);
	draw_rectangle(0, 0, room_width, room_height, false);
	draw_set_alpha(1);
	draw_set_color(c_navy);
	draw_rectangle((view_wport[0] / 2) - 128, (view_hport[0] / 2) - 32, (view_wport[0] / 2) + 128, (view_hport[0] / 2) + 32, false);
	draw_set_color(c_white);
	draw_set_font(Font4);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(view_wport[0] / 2, view_hport[0] / 2, "FOCUS LOST");
}