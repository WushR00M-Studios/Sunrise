if connecting == true {
	if (async_load[? "id"] != request_id) exit;

	var _status = async_load[? "status"];
	if (_status < 0)
	{
		if global.languageopt == 1 {
			image_index = 6;	
		} else {
			image_index = 3;
		}
		start_slideback = true;
		global.connected = false;
	    exit;
	}

	if (_status == 1)
	{
	    // Downloading
	
	    exit;
	}

	if (_status == 0)
	{
	    // Request completed!
	    if (async_load[? "http_status"] == 200)
	    {
			// Fully connected!
	        if global.languageopt == 1 {
				image_index = 5;	
			} else {
				image_index = 1;
			}
			global.connected = true;
			start_slideback = true;
	    }
}	
}