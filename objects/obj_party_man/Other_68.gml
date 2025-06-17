if (async_load[? "type"] == network_type_data) {
    var sock = async_load[? "socket"];
    var buffer = async_load[? "buffer"];
    buffer_seek(buffer, buffer_seek_start, 0);
    
    var msg_type = buffer_read(buffer, buffer_u8);
    
    if (msg_type == 1) {
        var name = buffer_read(buffer, buffer_string);

        // Resolve duplicates
        var final_name = name;
        var suffix = 2;
        while (array_contains(global.party_list, final_name)) {
            final_name = name + " #" + string(suffix);
            suffix += 1;
        }

        array_push(global.party_list, final_name);

        // Send updated party list to all clients
        send_party_list_to_all();
    }
}

if (async_load[? "type"] == network_type_data) {
    var buffer = async_load[? "buffer"];
    buffer_seek(buffer, buffer_seek_start, 0);
    
    var msg_type = buffer_read(buffer, buffer_u8);

    if (msg_type == 2) {
        var count = buffer_read(buffer, buffer_u8);
        global.party_list = [];
        for (var i = 0; i < count; i++) {
            array_push(global.party_list, buffer_read(buffer, buffer_string));
        }
    }
}
