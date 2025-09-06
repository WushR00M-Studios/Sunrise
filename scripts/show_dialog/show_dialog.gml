function scr_show_dialog(_msg, _icon, _buttons) {
	with (obj_dialog) {
	    message_text = argument0;
	    icon_sprite  = argument1;
	    buttons      = argument2;

	    hover_index  = -1;

	    var _w = 500;
	    target_x = 0;                     // snap target to 0 (left edge)
	    draw_x   = -_w;                   // start off-screen left
	    state    = "opening";
	    visible  = true;
	}
}