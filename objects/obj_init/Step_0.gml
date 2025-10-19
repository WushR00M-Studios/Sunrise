try {
	if global.mobile {	
		if audio_is_playing(snd_highlight)
			audio_stop_sound(snd_highlight);	

		if mouse_check_button_pressed(mb_left)
			instance_create_depth(mouse_x, mouse_y, -1, obj_cursor);
	}

	randomize();
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

