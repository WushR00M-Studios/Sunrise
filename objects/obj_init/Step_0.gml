if keyboard_check_pressed(vk_delete) {
	secret++;
	if secret > 2
		room_goto(rm_dotdotdot);
}

randomize();

exception_unhandled_handler(function(ex)
{
    // Print some messages to the output log
    show_debug_message( "--------------------------------------------------------------");
    show_debug_message( erormsg + string(ex) );
    show_debug_message( "--------------------------------------------------------------");

    // Write the exception struct to a file
    if file_exists("crash.txt") file_delete("crash.txt");
    var _f = file_text_open_write("crash.txt");
    file_text_write_string(_f, "Sunrise: CRASH LOG\n \n" + string(ex));
    file_text_close(_f);

    // Show the error message (for debug purposes only)
    show_message("PANIC!: we're hanging here!\nSunrise needs to quit due to an error.\n \n"+ex.message+"\n \n"+ex.longMessage);

    return 0;
});

