if global.languageopt == 1 {
	image_index = 1;	
} else {
	image_index = 0;	
}

if InputPressed(INPUT_VERB.CANCEL)
	instance_create_depth(0, 0, -1, obj_fadein_routine_mainmenu)