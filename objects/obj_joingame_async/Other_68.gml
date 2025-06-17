var type = async_load[? "type"];

if (type == network_type_connect) {
    var socket = async_load[? "socket"];

    if (socket == global.client_socket) {
        show_debug_message("Connected successfully!");

        // Now safe to send data:
        var buffer = buffer_create(256, buffer_grow, 1);
        buffer_write(buffer, buffer_u8, 1); // join message
        buffer_write(buffer, buffer_string, global.current_user);
        network_send_raw(global.client_socket, buffer, buffer_tell(buffer));
        buffer_delete(buffer);

        connect_result = "Connected!";
    }
}
