function scr_optionsinit(){
	// Video:
	global.vid_bbars = false;		// Black Bars
	global.vid_fscr = false;		// Fullscreen
	global.vid_psmode = false;		// Photosensitve Mode (flashing lights)
	global.vid_lightqual = 3;		// Lighting Quality
		// 3: Default (On - High), 2: (On - Medium), 1: (On - Low), 0: (Off - Fullbright)
	
	// Audio:

	
	// Gameplay:
	
	
	// Personalization:
	global.per_col = 0;				// Accent Color
		// 0: Default (orange), 1: Red, 2: Yellow, 3: Green, 4: Blue, 5: Purple, 6: White
	global.per_theme = 0;			// Menu Theme
		// 0: Default, 1: Classic
	global.per_layout = 0;			// Menu Layout
		// 0: Default, 1: Classic, 2: Focused
	global.per_tpack = 0;			// Applied Texture Pack (unused for now)
	
	// Data & Online:
	global.dat_username = "Guest";	// Username
	global.dat_id = 0;				// User ID
	global.dat_pw = noone;			// Password
	global.dat_online = false;		// Online Account
	global.dat_admin = false;		// Admin Account
		// Badges:
		global.bge_wushroom = false;		// WushR00M's Badge
		global.bge_wrstudios = false;		// WRStudios Badge
		global.bge_mod = false;				// Moderator Badge
		global.bge_veri = false;			// Verified Badge
		global.bge_support = false;			// Supporter Badge
	
	// Debug:
	global.opt_debug = false;
}