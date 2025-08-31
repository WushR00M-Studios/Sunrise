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
}

function save_level_as() {
	filename = get_save_filename("Sunrise Levels|*.srlvl|All Files|*.*", "Untitled.srlvl");
	if (filename != "") {
		var instances = layer_get_all_instances("Objects");
	    var count = array_length(instances);

	    ini_open(filename);

	    for (var i = 0; i < count; i++) {
	        var inst = instances[i];
	        if (!instance_exists(inst)) continue;

	        var section = "instance_" + string(i);
	        ini_write_string(section, "object", object_get_name(inst.object_index));
	        ini_write_real(section, "x", inst.x);
	        ini_write_real(section, "y", inst.y);
	    }

	    ini_write_real("meta", "count", count);
		
		ini_write_string("info", global.cmname, "Untitled");
		ini_write_string("info", global.cmauthor, "Unknown Author");
	    ini_close();
	
		toast_create("SUCCESS: Level saved successfully!", 2);
		global.cmauto = filename;
	} else {
	    toast_create("FAILURE: Level save canceled...", 4);
	}
}

function save_level() {
	var instances = layer_get_all_instances("Objects");
	var count = array_length(instances);

	ini_open(global.cmauto);

	for (var i = 0; i < count; i++) {
	    var inst = instances[i];
	    if (!instance_exists(inst)) continue;

	    var section = "instance_" + string(i);
	    ini_write_string(section, "object", object_get_name(inst.object_index));
	    ini_write_real(section, "x", inst.x);
	    ini_write_real(section, "y", inst.y);
	}

	ini_write_real("meta", "count", count);
		
	ini_write_string("info", "leveltitle", global.cmname);
	ini_write_string("info", "levelauthor", global.cmauthor);
	ini_close();
	
	toast_create("SUCCESS: Level saved successfully!", 2);
}

function load_level() {
	filename = get_open_filename("Sunrise Levels|*.srlvl|All Files|*.*", "Untitled.srlvl");
	if (filename != "") {
		ini_open(filename);
		
		if ini_section_exists("info") {
			if ini_key_exists("info", "leveltitle") {
				var a = ini_read_string("info", "leveltitle", "Untitled");
				if ini_key_exists("levelauthor") {
					var t = ini_read_string("info", "levelauthor", "Unknown Author");
					global.cmname = a;
					global.cmauthor = t;
					
					for (var i = 0; i < count; i++) {
				        var section = "instance_" + string(i);
				        var obj_name = ini_read_string(section, "object", "");
				        var x = ini_read_real(section, "x", 0);
				        var y = ini_read_real(section, "y", 0);

				        if (obj_name != "") {
				            var obj = asset_get_index(obj_name);
				            if (obj != -1) {
				                instance_create_layer(x, y, "Objects", obj);
				            }
				        }
				    }
					
					ini_close();
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
}