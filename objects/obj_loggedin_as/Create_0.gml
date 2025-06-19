toast_create("Logged in as: " + string(global.current_user));

slideback = false;
start_slideback = false;

if global.languageopt == 1 {
	image_index = 4;	
} else {
	image_index = 0;	
}

if global.connected == false {
	if os_is_network_connected() {
		var _map_headers = ds_map_create();
		request_id = http_request("http://www.wushroomstudios.com", "GET", _map_headers, "");
		connecting = true;
	} else {
		connecting = false;
		image_index = 2;
		start_slideback = true;
		global.connected = false;
	}
} else {
		
}