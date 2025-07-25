if global.mobile {	
	if audio_is_playing(snd_highlight)
		audio_stop_sound(snd_highlight);	

	if mouse_check_button_pressed(mb_left)
		instance_create_depth(mouse_x, mouse_y, -1, obj_cursor);
}

randomize();

exception_unhandled_handler(function(ex)
{
    // Print some messages to the output log
    show_debug_message( "--------------------------------------------------------------");
    show_debug_message( string(ex) );
    show_debug_message( "--------------------------------------------------------------");

    // Write the exception struct to a file
    if file_exists("crash.txt") file_delete("crash.txt");
    var _f = file_text_open_write("crash.txt");
    file_text_write_string(_f, "Sunrise: CRASH LOG\nTime: " + string(date_current_datetime()) + "\n--------------------------------------------------------------\n" + string(ex));
    file_text_close(_f);

    // Show the error message (for debug purposes only)
    show_message("PANIC!: we're hanging here!\n \nSunrise needs to quit due to an error.\n \n"+ex.message+"\n \n"+ex.longMessage);

    return 0;
});

