x = lerp(x, view_wport[0] - 246, 0.05);
y = lerp(y, 216, 0.05);

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
