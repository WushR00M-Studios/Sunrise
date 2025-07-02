draw_set_halign(fa_left);
draw_set_font(Font7);
draw_set_color(c_black);
draw_text(17,17,"Sunrise v0.3.0: Laser");
draw_text(17,49,"(C) WushR00M Studios 2025");
draw_set_color(c_white);
draw_text(16,16,"Sunrise v0.3.0: Laser");
draw_text(16,48,"(C) WushR00M Studios 2025");

// unused routine im keeping to show a flashing press any button prompt

// if show == true && !gamepad_is_connected(0) {
// 	draw_set_font(Font7_big);
// 	draw_set_halign(fa_center);
// 	draw_set_color(c_black);
// 	draw_text((room_width / 2) + 1, (room_height - 127),"PRESS ANY BUTTON TO BEGIN");
// 	draw_set_color(c_white);
// 	draw_text(room_width / 2,room_height - 128,"PRESS ANY BUTTON TO BEGIN");
// }