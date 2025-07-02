var items = global.cm_items3;
var count = array_length(items);
var mid_index = floor(cm_display_count / 2);
var angle_step = cm_angle_range / (cm_display_count - 1);

draw_set_color(make_color_rgb(207, 160, 21));
draw_circle(view_wport[0], view_hport[0] / 2, 128, false);

draw_set_color(c_white);

for (var i = 0; i < count; i++) {
    var relative_index = i - cm_angle_offset;

    // Wrap around for proper order
    if (relative_index > count / 2) relative_index -= count;
    if (relative_index < -count / 2) relative_index += count;

    // Only show nearby entries
    if (abs(relative_index) > mid_index) continue;

    var angle = pi + angle_step * relative_index;
    var zx = cm_center_x + lengthdir_x(cm_radius, radtodeg(angle));
    var zy = cm_center_y + lengthdir_y(cm_radius, radtodeg(angle));

    var scale = cm_scales[i];
    if (scale <= 0.01) continue;

    // Draw icon
    var icon = items[i].icon;
    if (sprite_exists(icon)) {
        draw_sprite_ext(icon, 0, zx - (string_length(string(items[i].name)) * 8) - 32, zy, scale, scale, 0, c_white, scale);
    }

    // Draw text below icon
    draw_set_halign(fa_center);
    draw_set_valign(fa_top);
    draw_set_alpha(scale);
    draw_set_color(c_white);
	draw_set_font(Font7_big);
    draw_text_transformed(zx, zy, string(items[i].name), scale, scale, 0);
}

draw_set_alpha(1);
