if global.languageopt == 1 {
	image_index = 1;	
} else {
	if os_android != true {
		image_index = 0;
	} else {
		image_index = 2;	
	}
}

x = room_width / 2;
y = room_height / 2;