draw_set_halign(fa_left);
draw_set_valign(fa_middle);

draw_set_color(c_white);

var draw_y = menu_top - scroll_y;
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

for (var i = 0; i < array_length(options); i++) {
    var item = options[i];
    var rect = item_rects[i];
    var var_x = padding_x;
    var center_y = rect.y + rect.h / 2;

    if (item.type == "header") {
        draw_set_font(Font4);
        draw_set_color(c_white);
        draw_text(var_x, center_y, item.name);
        draw_set_color(c_gray);
        draw_line(var_x, rect.y + rect.h - 8, room_width - padding_x, rect.y + rect.h - 8);
    } else {
        // Highlight hovered
        if (hovered_item == i) {
			draw_set_alpha(0.5);
            draw_set_color(make_color_hsv(200, 30, 90));
            draw_rectangle(rect.x, rect.y, rect.x + rect.w, rect.y + rect.h, false);
			draw_set_alpha(1);
        }
        draw_set_font(Font7);
        draw_set_color(c_white);

        // Draw item name
        draw_text(var_x, center_y, item.name);

        if (item.type == "toggle") {
            var box_x = var_x + 200;
            var box_y = rect.y + rect.h / 2 - 10;
            draw_roundrect(box_x, box_y, box_x + 20, box_y + 20, false);
            if (item.value) {
				draw_set_color(c_blue);
                draw_roundrect(box_x + 2, box_y + 2, box_x + 18, box_y + 18, false);
            }
        }
        else if (item.type == "slider") {
            var slider_x = var_x + 200;
            var slider_y = rect.y + rect.h / 2 - 8;
            var slider_w = 180;
            var slider_h = 16;

            // Slider background bar
            draw_set_color(c_gray);
            draw_rectangle(slider_x, slider_y, slider_x + slider_w, slider_y + slider_h, false);

            // Slider fill
            var fill_w = ((item.value - item.min) / (item.max - item.min)) * slider_w;
            draw_set_color(c_white);
            draw_rectangle(slider_x, slider_y, slider_x + fill_w, slider_y + slider_h, false);

            // Slider knob
            var knob_x = slider_x + fill_w;
            draw_set_color(c_white);
            draw_circle(knob_x, slider_y + slider_h / 2, 8, false);

            // Percentage text right aligned
            draw_set_halign(fa_right);
			draw_set_color(c_blue);
            draw_text(slider_x + slider_w - 4, center_y, string(floor(item.value)) + "%");
            draw_set_halign(fa_left);
        }
        else if (item.type == "dropdown") {
            var dd_x = var_x + 200;
            var dd_y = rect.y + rect.h / 2;
            var selected_text = item.choices[item.selected];
            draw_set_color(c_white);
            draw_text(dd_x, dd_y, selected_text);

            // Draw dropdown arrow
            var arrow_x = dd_x + 160;
            var arrow_y = dd_y;
            draw_triangle(arrow_x - 6, arrow_y - 4, arrow_x + 6, arrow_y - 4, arrow_x, arrow_y + 4, false);

            // If open, draw dropdown list
            if (item.open) {
                var dd_w = 180;
                var dd_h = line_height;
                draw_set_color(c_black);
                draw_rectangle(dd_x, rect.y + rect.h, dd_x + dd_w, rect.y + rect.h + dd_h * array_length(item.choices), false);

                for (var k = 0; k < array_length(item.choices); k++) {
                    var choice_y = rect.y + rect.h + dd_h * k + dd_h / 2;
                    if (mx > dd_x && mx < dd_x + dd_w && my > rect.y + rect.h + dd_h * k && my < rect.y + rect.h + dd_h * (k + 1)) {
                        draw_set_color(c_blue);
                        draw_rectangle(dd_x, rect.y + rect.h + dd_h * k, dd_x + dd_w, rect.y + rect.h + dd_h * (k + 1), false);
                        draw_set_color(c_white);
                    } else {
                        draw_set_color(c_white);
                    }
                    draw_text(dd_x + 8, choice_y, item.choices[k]);
                }
            }
        }
        else if (item.type == "button") {
            var btn_x = var_x + 200;
            var btn_y = rect.y + rect.h / 2 - 14;
            var btn_w = 180;
            var btn_h = 28;
            draw_set_color(c_black);
            draw_rectangle(btn_x, btn_y, btn_x + btn_w, btn_y + btn_h, false);
            if (hovered_item == i) {
                draw_set_color(c_navy);
                draw_rectangle(btn_x, btn_y, btn_x + btn_w, btn_y + btn_h, false);
            }
            draw_set_color(c_white);
            draw_set_font(Font7);
            draw_text(btn_x + btn_w / 2, btn_y + btn_h / 2, item.name);
        }
    }
    draw_y += (item.type == "header") ? header_height : line_height;
}

// Draw description box bottom center
draw_set_halign(fa_center);
var desc_x = room_width / 2;
var desc_y = room_height - 32;
draw_set_font(Font7);
draw_set_color(c_white);
draw_text(desc_x, desc_y, description_text);
