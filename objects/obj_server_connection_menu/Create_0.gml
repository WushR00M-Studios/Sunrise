// UI State
state = "main"; // "main", "joining", "hosting"
input_code = "";
invite_code = "";
connect_result = "";

// UI Button Data
join_btn = { x: 100, y: 140, w: 300, h: 40 };
host_btn = { x: 100, y: 200, w: 300, h: 40 };
code_input_box = { x: 100, y: 260, w: 300, h: 32 };
confirm_btn = { x: 100, y: 310, w: 140, h: 40 };
cancel_btn = { x: 260, y: 310, w: 140, h: 40 };

function draw_btn(btn, text) {
    draw_set_color(c_black);
    draw_rectangle(btn.x, btn.y, btn.x + btn.w, btn.y + btn.h, false);
    draw_set_color(c_white);
    draw_text(btn.x + 16, btn.y + 12, text);
}

function generate_invite_code() {
    var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    var code = "";
    for (var i = 0; i < 4; i++) code += string_char_at(chars, irandom_range(1, string_length(chars)));
    code += "-";
    for (var i = 0; i < 4; i++) code += string_char_at(chars, irandom_range(1, string_length(chars)));
    return code;
}

function start_host_server() {
    global.server_socket = network_create_server(network_socket_tcp, 6510, 32);
    global.client_sockets = [];

    // This is critical:
    global.party_list = [];

    var base_name = global.current_user;
    var name = base_name + " (HOST)";

    global.party_list[0] = name;

    show_debug_message("Host name added to party: " + name);
}

function attempt_join_with_code(code) {
    var ip = "192.168.1.100"; // replace with host IP or LAN-discovery result
    global.client_socket = network_create_socket(network_socket_tcp);
    var result = network_connect(global.client_socket, ip, 6510);

    if (!result) {
        connect_result = "Connection failed.";
        return;
    }

    connect_result = "Connecting...";

    // DO NOT send data immediately.
    // Wait for network_async to confirm the connection.
}


function send_party_list_to_all() {
    var buffer = buffer_create(1024, buffer_grow, 1);
    buffer_write(buffer, buffer_u8, 2);
    buffer_write(buffer, buffer_u8, array_length(global.party_list));
    for (var i = 0; i < array_length(global.party_list); i++) {
        buffer_write(buffer, buffer_string, global.party_list[i]);
    }
    for (var i = 0; i < array_length(global.client_sockets); i++) {
        network_send_raw(global.client_sockets[i], buffer, buffer_tell(buffer));
    }
    buffer_delete(buffer);
}

function shutdown_host() {
    // Close each client connection
    if (variable_global_exists("client_sockets")) {
        for (var i = 0; i < array_length(global.client_sockets); i++) {
            network_destroy(global.client_sockets[i]);
        }
        global.client_sockets = [];
    }

    // Close the server socket
    if (variable_global_exists("server_socket")) {
        network_destroy(0);
        global.server_socket = -1;
    }

    // Clear party list
    global.party_list = [];

    // Optionally remove HUD
    if (instance_exists(obj_party_hud)) {
        instance_destroy(obj_party_hud);
    }

    show_debug_message("Server shut down.");
}