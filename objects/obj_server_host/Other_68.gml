if (async_load[? "type"] == network_type_connect) {
    var socket = async_load[? "socket"];
    array_push(global.client_sockets, socket);
    show_debug_message("Client connected: " + string(socket));
}

if (async_load[? "type"] == network_type_data) {
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
        send_party_list_to_all(); // sync to clients
    }
}
