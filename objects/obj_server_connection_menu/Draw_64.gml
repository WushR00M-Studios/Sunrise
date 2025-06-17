draw_set_color(c_white);
draw_text(100, 60, "Multiplayer is in Alpha! Expect bugs!");

if (state == "main") {
    draw_btn(join_btn, "Join Game");
    draw_btn(host_btn, "Host Game");
}

if (state == "joining") {
    draw_text(code_input_box.x, code_input_box.y - 24, "Enter Invite Code:");
    draw_rectangle(code_input_box.x, code_input_box.y, code_input_box.x + code_input_box.w, code_input_box.y + code_input_box.h, false);
    draw_set_color(c_black);
	draw_text(code_input_box.x + 4, code_input_box.y + 8, input_code);
	draw_set_color(c_white);
    draw_btn(confirm_btn, "Join");
    draw_btn(cancel_btn, "Cancel");
}

if (state == "hosting") {
    draw_text(100, 140, "Your Invite Code:");
    draw_text(100, 170, invite_code);
    draw_text(100, 220, "Waiting for players to join...");
    draw_btn(cancel_btn, "Cancel");
}

if (connect_result != "") {
    draw_set_color(c_red);
    draw_text(100, 380, connect_result);
}
