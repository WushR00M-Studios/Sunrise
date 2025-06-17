if (state == "joining") {
    var k = keyboard_lastchar;
    if (keyboard_check_pressed(vk_backspace)) {
        input_code = string_copy(input_code, 1, max(0, string_length(input_code) - 1));
    } else if (string_length(input_code) < 16 && ord(k) >= 32) {
        input_code += string_upper(k);
    }
}
