x = room_width / 2;
y = room_height / 2;

if instance_exists(obj_loading_spinner) {
	if obj_loading_spinner.fulload == true
		fade = true;	
}
	
if fade == true {
	if image_alpha != 1
		image_alpha += 0.1;
		
	if image_alpha == 0.9
		alarm_set(0,300);
} else {
	image_alpha = 0;	
}