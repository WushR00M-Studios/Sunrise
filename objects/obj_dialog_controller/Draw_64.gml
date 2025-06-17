draw_set_font(Font7);
draw_set_color(c_white);
// Draw dialog background
draw_self(); // Optional if object has no sprite

draw_sprite_stretched(spr_ns_window, 0, box_x, box_y, box_width, box_height);

// Draw text
var text_x = box_x + box_padding;
var text_y = box_y + box_padding;
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(text_x, text_y, dialog_text);

draw_set_halign(fa_center);
draw_set_valign(fa_center);

draw_sprite_stretched(spr_button, 0, btn1_draw_x, btn1_draw_y, btn1_w, btn1_h);
draw_text(btn1_draw_x + btn1_w / 2, btn1_draw_y + btn1_h / 2, button1_text);

if (button2_enabled) {
    draw_sprite_stretched(spr_button, 0, btn2_draw_x, btn2_draw_y, btn2_w, btn2_h);
    draw_text(btn2_draw_x + btn2_w / 2, btn2_draw_y + btn2_h / 2, button2_text);
}

