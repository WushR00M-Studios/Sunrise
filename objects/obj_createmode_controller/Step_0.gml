try {
	
	if !instance_exists(obj_light) && instance_exists(obj_lighting_engine)
		instance_destroy(obj_lighting_engine);

	if global.inputtype {
		if keyboard_check_pressed(ord("1"))
			global.cmmode = 1;
		else if keyboard_check_pressed(ord("2")) 
			global.cmmode = 2;
		else keyboard_check_pressed(ord("3")) 
			global.cmmode = 3;
	} else {
		if InputPressed(INPUT_VERB.L1)
			global.cmmode -= 1;
		else InputPressed(INPUT_VERB.R1)
			global.cmmode += 1;
			
		if global.cmmode < 1
			global.cmmode = 1;
		
		if global.cmmode > 3
			global.cmmode = 3;
	}
		
	if InputPressed(INPUT_VERB.SPECIAL)
		global.cmplay = !global.cmplay;
		
	if InputPressed(INPUT_VERB.ACTION) {
		var btns = [
			{label:"Solid Block", action: dummyscript()},
			{label:"Autoterrain", action: dummyscript()},
			{label:"Bit", action: dummyscript()},
			{label:"Text Display", action: dummyscript()},
		];
		
		scr_show_instancelist(btns);
	}
	
} catch(ex) {
	if global.op_errorep
		toast_create("FAILURE: An internal error has occured and has been reported to WushR00M Studios.", 4);
	else
		toast_create("FAILURE: An internal error has occured. Error data has been dumped to a debug file.", 4);
		
	if file_exists("error_rep.log") file_delete("error_rep.log");
	var _f = file_text_open_write("error_rep.log");
	file_text_write_string(_f, "Sunrise: Error Report\n \n" + ex.longMessage);
	file_text_close(_f);
	
	show_debug_message( "--------------------------------------------------------------");
	show_debug_message( "An error has occured:" );
    show_debug_message( string(ex.longMessage) );
    show_debug_message( "--------------------------------------------------------------");
}