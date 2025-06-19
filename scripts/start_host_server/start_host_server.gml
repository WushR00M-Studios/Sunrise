function start_host_server() {
    if (global.server_socket != undefined) return;

    global.server_socket = network_create_server(network_socket_tcp, 6510, 32);
    if (global.server_socket < 0) {
        show_debug_message("Failed to start server.");
        global.server_socket = undefined;
        return false;
    }

    global.client_sockets = []; // connected players
    global.party_list = [global.current_user]; // start party with self

    show_debug_message("Server started on port 6510.");
    return true;
}
