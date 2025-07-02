if shown == true {
	draw_set_halign(fa_right);
	draw_set_font(Font7);
	draw_set_color(c_black);
	draw_text(x + 65, y + 73, "Microphone Sensitivity: " + string(sensitivity));
	draw_set_color(c_white);
	draw_text(x + 64, y + 72, "Microphone Sensitivity: " + string(sensitivity));
	if talking == true {
	
	} else if talking == false {
	
	}
}

draw_self();