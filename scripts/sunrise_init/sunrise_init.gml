function sunrise_init(){
	global.gameLoaded = false;
	var browserm = false;
	
	// OPERATING SYSTEM SPECIFIC MEASURES
	if os_type == os_linux {
		// Prevent the game from running in SUDO mode as this can cause serious security risks!!
		
	}
	
	if os_browser == browser_not_a_browser {
		browserm = false;
	} else { 
		browserm = true; 
	// Check which browser is being used!
		var browsertype = os_browser;
		if browsertype == browser_ie {
			show_message("Sorry! Internet Explorer is no longer supported for Sunrise! The game will not continue.");
			game_end();
		}
		
		if !webgl_enabled {
			room_goto(rm_webglerr);
		}
	}
	
	// FOR DEVELOPMENT PURPOSES ONLY. USUALLY COMMENTED OUT UNLESS BETA TESTING
	var devmode = true;
	
	// LOAD AUDIO GROUPS AND ASSETS
	audio_group_load(audiogroup_default);
	audio_master_gain(0.5);
	
	// LOAD DEBUG UTILITES & TEXT IF DEBUG OPTIONS ARE ENABLED
	if (devmode == true ) {
		global.vertext = true;
		global.debugmenu = true;
		global.debugcur = true;
	} else { 
		global.vertext = false;
		global.debugmenu = false;
		global.debugcur = false;
	}
	
	if file_exists("menuconfig.ini") {
		ini_open("menuconfig.ini");
	} else {
		ini_open("menuconfig.ini");
		ini_write_real("mainmenu","playbuttonx",1120)
		ini_write_real("mainmenu","playbuttony",216)
		ini_write_real("mainmenu","createbuttonx",960)
		ini_write_real("mainmenu","createbuttony",680)
		ini_write_real("mainmenu","connectbuttonx",1040)
		ini_write_real("mainmenu","connectbuttony",472)
		ini_write_real("mainmenu","screensaverx",0)
		ini_write_real("mainmenu","screensavery",0)
		ini_write_string("mainmenu","screensaverenabled","true")
	}
	
	global.playbx = ini_read_real("mainmenu","playbuttonx",1120)
	global.playby = ini_read_real("mainmenu","playbuttony",216)
	global.createbx = ini_read_real("mainmenu","createbuttonx",960)
	global.createby = ini_read_real("mainmenu","createbuttony",680)
	global.connectbx = ini_read_real("mainmenu","connectbuttonx",1040)
	global.connectby = ini_read_real("mainmenu","connectbuttony",472)
	global.screensavx = ini_read_real("mainmenu","screensaverx",0)
	global.screensavy = ini_read_real("mainmenu","screensavery",0)
	global.ssenabled = ini_read_string("mainmenu","screensaverenabled","true")
	
	ini_close()
	
	// INIT OPTIONS
	
	global.loadinglvl = false;
	
	global.gameLoaded = true;
}