var start_x = display_get_gui_width() / 2 - ((array_length(global.accounts) - 1) * spacing) / 2;

for (var i = 0; i < array_length(global.accounts); i++) {
    var tx = start_x + i * spacing - current_scroll;
    var ty = display_get_gui_height() / 2;
    var acc = global.accounts[i];

	if gamepad_is_connected(0)
		var scale = (i == selected_index) ? 1.2 : 1;
	else
		var scale = 1;
	
	if gamepad_is_connected(0)
		var img_alpha = (i == selected_index || i == hovered_index) ? 1 : 0.7;
	else
		var img_alpha = (i == hovered_index) ? 1 : 0.7;

	if acc.name == "Add New"
		draw_sprite_ext(spr_accounts_add_icon, 0, tx, ty, scale, scale, 0, c_white, img_alpha);
    else
		draw_sprite_ext(spr_default_profile_picture, 0, tx, ty, scale, scale, 0, c_white, img_alpha);

	draw_set_halign(fa_center);
    draw_set_valign(fa_top);
	draw_set_font(Font7_big);
    draw_text(tx, ty + item_height / 2 * scale + 10, acc.name);
}