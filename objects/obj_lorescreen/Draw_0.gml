// Fill screen with black
draw_set_color(c_black);
draw_rectangle(0, 0, display_get_width(), display_get_height(), false);

// Set text style
draw_set_color(c_white);
draw_set_font(Font3);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// Draw typed text
var full_text = text_pages[current_page];
var shown_text = string_copy(full_text, 1, text_index);

draw_text(8, 8, shown_text);
