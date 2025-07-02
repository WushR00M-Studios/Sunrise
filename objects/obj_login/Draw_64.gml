var start_x = display_get_gui_width() / 2 - ((array_length(accounts) - 1) * spacing) / 2;

for (var i = 0; i < array_length(accounts); i++) {
    var tx = start_x + i * spacing - current_scroll;
    var ty = display_get_gui_height() / 2;
    var acc = accounts[i];

	if gamepad_is_connected(0)
		var scale = (i == selected_index) ? 1.2 : 1;
	else
		var scale = 1;
	
	if gamepad_is_connected(0)
		var img_alpha = (i == selected_index || i == hovered_index) ? 1 : 0.7;
	else
		var img_alpha = (i == hovered_index) ? 1 : 0.7;

	if array_contains(accounts, "Add New")
		draw_sprite_ext(spr_accounts_add_icon, 0, tx, ty, scale, scale, 0, c_white, img_alpha);
    else
		draw_sprite_ext(spr_default_profile_picture, 0, tx, ty, scale, scale, 0, c_white, img_alpha);

	draw_set_halign(fa_center);
    draw_set_valign(fa_top);
	draw_set_font(Font7_big);
    draw_text(tx, ty + item_height / 2 * scale + 10, acc.name);
}

if (input_mode == "new_name") {
	draw_set_font(Font7);
    draw_text(display_get_gui_width()/2, 80, "Enter a username:");
	draw_set_font(Font7_big);
    draw_text(display_get_gui_width()/2, 120, input_text + "|");
} else if (input_mode == "new_pin") {
	draw_set_font(Font7);
    draw_text(display_get_gui_width()/2, 80, "Enter a 4-digit PIN (leave blank for no PIN):");
	draw_set_font(Font7_big);
    draw_text(display_get_gui_width()/2, 120, string_repeat("*", string_length(input_text)) + "|");
} else if (input_mode == "login_pin") {
	draw_set_font(Font7);
    draw_text(display_get_gui_width()/2, 80, "Enter your PIN:");
	draw_set_font(Font7_big);
    draw_text(display_get_gui_width()/2, 120, string_repeat("*", string_length(input_text)) + "|");
}
