var start_x = display_get_gui_width() / 2 - ((array_length(accounts) - 1) * spacing) / 2;

for (var i = 0; i < array_length(accounts); i++) {
    var zx = start_x + i * spacing - current_scroll;
    var zy = display_get_gui_height() / 2;
    var acc = accounts[i];

	if gamepad_is_connected(0)
		var img_alpha = (i == selected_index) ? 1 : 0.7;
	else
		var img_alpha = (i == hovered_index) ? 1 : 0.7;

    draw_sprite_ext(acc.sprite, 0, zx, zy, 1, 1, 0, c_white, img_alpha);
    draw_set_halign(fa_center);
    draw_set_valign(fa_top);
	draw_set_font(Font7_big);
    draw_text(zx, zy + item_height / 2 + 10, acc.name);
}
