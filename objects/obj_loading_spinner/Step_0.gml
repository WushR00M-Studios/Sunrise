image_angle += 4;

if fade == true {
	if image_alpha != 0
		image_alpha -= 0.1;
	else
		instance_destroy();
}