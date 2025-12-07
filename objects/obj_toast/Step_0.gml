// Manual dismiss
if (keyboard_check_pressed(vk_backspace)) {
    state = "slide_out";
}

// Slide in
if (state == "slide_in") {
    y = lerp(y, target_y, slide_speed);
    if (abs(y - target_y) < 1) {
        y = target_y;
        state = "showing";
    }
}
// Wait
else if (state == "showing") {
    timer++;
    if (timer >= duration) {
        state = "slide_out";
    }
}
// Slide out
else if (state == "slide_out") {
    y = lerp(y, start_y, slide_speed);
    if (y >= start_y - 1) {
        instance_destroy();
    }
}

width = string_width(text) + padding;