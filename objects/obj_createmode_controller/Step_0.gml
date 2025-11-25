try {
	if !instance_exists(obj_light) && instance_exists(obj_lighting_engine)
		instance_destroy(obj_lighting_engine);
		
	if InputPressed(INPUT_VERB.ACTION) {
		global.cmselection = 0;
		
		var btns = [
			{label:"Solid Block", action: dummyscript()},
			{label:"Autoterrain", action: dummyscript()},
			{label:"Bit", action: dummyscript()},
			//{label:"Text Display", action: dummyscript()}, Disabled due to bugs
			{label:"Close Instance List", action: dummyscript()},
		];
		
		scr_show_instancelist(btns);
	}
	
	if device_mouse_y_to_gui(0) <= 32
		global.cmselection = 0;
	
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