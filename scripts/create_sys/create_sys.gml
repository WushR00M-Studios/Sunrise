function init_var() {
	global.cmmode = 1; // create buttons, mode
		// we'll use number hotkeys 1-9
	global.cmplay = false; // playtest mode
		// true for playing, false for creating
		
	global.cmspawn_x = 0; // default player spawn coords (X)
	global.cmspawn_y = 0; // default player spawn coords (Y)
	
	global.cmname = "Untitled" // default level name
	global.cmauthor = global.current_user // default level author (current logged in user)
	
	global.cmauto = "" // autosave name, which gets filled in whenever we first save the level loaded
	
	global.cmtheme = "Plains"
	global.cmtime = "Day"
}

function save_level_as() {
	try {
		filename = get_save_filename("Sunrise Levels|*.srlvl|All Files|*.*", "Untitled.srlvl");
		if (filename != "") {
			var instances = layer_get_all_elements("Objects");
		    var count = array_length(instances);

		    ini_open(filename);

		    var layer_name = "Objects";
	        var file_name = global.cmauto;
	        ini_open(file_name);
	        var index = 0;
                                
	        with (all) {
		        if (layer_get_name(layer) == layer_name) {
			        var obj_name = object_get_name(object_index);
			        var section = "Object_" + string(index);
			        ini_write_string(section, "name", obj_name);
			        ini_write_real(section, "x", x);
					ini_write_real(section, "y", y);
			        show_debug_message("Object_" + string(index) + " saved");
					index += 1;
		        }
	        }

		    ini_write_real("meta", "count", count);
		
			ini_write_string("info", "levelname", global.cmname);
			ini_write_string("info", "levelauthor", global.cmauthor);
			ini_write_string("info", "leveltheme", global.cmtheme);
			ini_write_string("info", "leveltime", global.cmtime);
		    ini_close();
	
			toast_create("SUCCESS: Level saved successfully!", 2);
			global.cmauto = filename;
		} else {
		    toast_create("FAILURE: Level save canceled...", 4);
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

	exception_unhandled_handler(function(ex)
	{
	    show_debug_message( "--------------------------------------------------------------");
		show_debug_message( "A CRITICAL Error has occured, Sunrise will now close:" );
	    show_debug_message( string(ex.longMessage) );
	    show_debug_message( "--------------------------------------------------------------");

	    if file_exists("crash.log") file_delete("crash.log");
	    var _f = file_text_open_write("crash.log");
	    file_text_write_string(_f, "Sunrise: CRITICAL Error Report" + "\n \n" + string(ex));
	    file_text_close(_f);

	    show_message("A serious error has occured and Sunrise needs to close. We apologise for the inconvience! You can view the crash log in \"crash.txt\".");
	});
}

function save_level() {
	try {
		var instances = layer_get_all_elements("Objects");
		var count = array_length(instances);

		ini_open(global.cmauto);

		var layer_name = "Objects";
        var file_name = global.cmauto;
        ini_open(file_name);
        var index = 0;
                                
        with (all) {
	        if (layer_get_name(layer) == layer_name) {
		        var obj_name = object_get_name(object_index);
		        var section = "Object_" + string(index);
		        ini_write_string(section, "name", obj_name);
		        ini_write_real(section, "x", x);
				ini_write_real(section, "y", y);
		        show_debug_message("Object_" + string(index) + " saved");
				index += 1;
	        }
        }

		ini_write_real("meta", "count", count);
		
		ini_write_string("info", "leveltitle", global.cmname);
		ini_write_string("info", "levelauthor", global.cmauthor);
		ini_write_string("info", "leveltheme", global.cmtheme);
		ini_write_string("info", "leveltime", global.cmtime);
		ini_close();
	
		toast_create("SUCCESS: Level saved successfully!", 2);
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

	exception_unhandled_handler(function(ex)
	{
	    show_debug_message( "--------------------------------------------------------------");
		show_debug_message( "A CRITICAL Error has occured, Sunrise will now close:" );
	    show_debug_message( string(ex.longMessage) );
	    show_debug_message( "--------------------------------------------------------------");

	    if file_exists("crash.log") file_delete("crash.log");
	    var _f = file_text_open_write("crash.log");
	    file_text_write_string(_f, "Sunrise: CRITICAL Error Report" + "\n \n" + string(ex));
	    file_text_close(_f);

	    show_message("A serious error has occured and Sunrise needs to close. We apologise for the inconvience! You can view the crash log in \"crash.txt\".");
	});
}

function save_level_autosave() {
	try {
		var instances = layer_get_all_elements("Objects");
		var count = array_length(instances);

		ini_open(global.cmauto);

		var layer_name = "Objects";
        var file_name = global.cmauto;
        ini_open(file_name);
        var index = 0;
                                
        with (all) {
	        if (layer_get_name(layer) == layer_name) {
		        var obj_name = object_get_name(object_index);
		        var section = "Object_" + string(index);
		        ini_write_string(section, "name", obj_name);
		        ini_write_real(section, "x", x);
				ini_write_real(section, "y", y);
		        show_debug_message("Object_" + string(index) + " saved");
				index += 1;
	        }
        }

		ini_write_real("meta", "count", count);
		
		ini_write_string("info", "leveltitle", global.cmname);
		ini_write_string("info", "levelauthor", global.cmauthor);
		ini_write_string("info", "leveltheme", global.cmtheme);
		ini_write_string("info", "leveltime", global.cmtime);
		ini_close();
	
		toast_create("SUCCESS: Level autosaved!", 2);
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

	exception_unhandled_handler(function(ex)
	{
	    show_debug_message( "--------------------------------------------------------------");
		show_debug_message( "A CRITICAL Error has occured, Sunrise will now close:" );
	    show_debug_message( string(ex.longMessage) );
	    show_debug_message( "--------------------------------------------------------------");

	    if file_exists("crash.log") file_delete("crash.log");
	    var _f = file_text_open_write("crash.log");
	    file_text_write_string(_f, "Sunrise: CRITICAL Error Report" + "\n \n" + string(ex));
	    file_text_close(_f);

	    show_message("A serious error has occured and Sunrise needs to close. We apologise for the inconvience! You can view the crash log in \"crash.txt\".");
	});
}

function load_level() {
	try {
		filename = get_open_filename("Sunrise Levels|*.srlvl|All Files|*.*", "Untitled.srlvl");
		if (filename != "") {
			ini_open(filename);
		
			if ini_section_exists("info") {
				if ini_key_exists("info", "levelname") {
					var a = ini_read_string("info", "levelname", "Untitled");
					if ini_key_exists("info", "levelauthor") {
						var aw = ini_read_string("info", "levelauthor", "Unknown Author");
						global.cmname = a;
						global.cmauthor = aw;
						var count = ini_read_real("meta", "count", 0);
						if !ini_key_exists("info", "leveltheme")
							var porting = true;
					
						if ini_key_exists("info", "leveltime")
							var ax = ini_read_string("info", "leveltime", "Day");
						else
							var ax = "Day"
					
						layer_destroy_instances("Objects");
                                            
                        for (var index = 0; true; index += 1) {
	                        var section_name = "Object_" + string(index);
                         
	                        if (!ini_section_exists(section_name))
								break;
                                                
	                        var obj_name = ini_read_string(section_name, "name", "");
	                        var obj_x = ini_read_real(section_name, "x", 0);
	                        var obj_y = ini_read_real(section_name, "y", 0);
	                        var obj_index = asset_get_index(obj_name);
                                                
	                        if (obj_index != -1)
								instance_create_layer(obj_x, obj_y, "Objects", obj_index);
                        }
					
						ini_close();
						if porting == true
							toast_create("SUCCESS: v0.2 formatted level imported successfully!", 2);
						else
							toast_create("SUCCESS: Level loaded successfully!", 2);
					} else {
						toast_create("FAILURE: Level loading error!", 4);
					}
				} else {
					ini_close();
					toast_create("FAILURE: Level loading error!", 4);
				}
			
			
			} else {
				ini_close();
				toast_create("FAILURE: Level loading error!", 4);
			}
		} else {
			toast_create("FAILURE: Level load cancelled...", 4);
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

	exception_unhandled_handler(function(ex)
	{
	    show_debug_message( "--------------------------------------------------------------");
		show_debug_message( "A CRITICAL Error has occured, Sunrise will now close:" );
	    show_debug_message( string(ex.longMessage) );
	    show_debug_message( "--------------------------------------------------------------");

	    if file_exists("crash.log") file_delete("crash.log");
	    var _f = file_text_open_write("crash.log");
	    file_text_write_string(_f, "Sunrise: CRITICAL Error Report" + "\n \n" + string(ex));
	    file_text_close(_f);

	    show_message("A serious error has occured and Sunrise needs to close. We apologise for the inconvience! You can view the crash log in \"crash.txt\".");
	});
}

function fail_loading() {
	ini_close();
	toast_create("FAILURE: Level loading error!", 4);
}