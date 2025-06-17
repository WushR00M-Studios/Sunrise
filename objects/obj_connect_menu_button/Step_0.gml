x = lerp(x, room_width - 326, 0.05);
y = lerp(y, 472, 0.05);

if hover == true {
	image_xscale = lerp(image_xscale, 1.1, 0.05);
	image_yscale = lerp(image_yscale, 1.1, 0.05);	
} else {
	image_xscale = lerp(image_xscale, 1, 0.05);
	image_yscale = lerp(image_yscale, 1, 0.05);
}

if global.languageopt == 1 {
	image_index = 1;	
} else {
	image_index = 0;	
}

if gamepad_is_connected(0) {
	if global.contindex = 2 {
		sprite_index = spr_connect_button;
		hover = true;
	} else {
		sprite_index = spr_connect_button_un;
		hover = false;
	}
}