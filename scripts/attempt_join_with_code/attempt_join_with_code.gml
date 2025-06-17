function attempt_join_with_code(_code) {
    // For LAN, ignore actual code and try connecting to known IP
    var ip = "192.168.1.100"; // Replace with your host PC's LAN IP
    var port = 6510;

    global.client_socket = network_create_socket(network_socket_tcp);
    var result = network_connect(global.client_socket, ip, port);

    if (!result) {
        show_debug_message("Failed to connect to host.");
        connect_result = "Could not connect. Check if host is running.";
        return false;
    }

    show_debug_message("Attempting connection to " + ip + ":" + string(port));

    // Send your name to the host
    var buffer = buffer_create(256, buffer_grow, 1);
    buffer_write(buffer, buffer_u8, 1); // msg type: join
    buffer_write(buffer, buffer_string, global.current_user);
    network_send_raw(global.client_socket, buffer, buffer_tell(buffer));
    buffer_delete(buffer);

    return true;
}
