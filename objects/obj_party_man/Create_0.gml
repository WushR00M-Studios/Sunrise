global.party_list = []; // List of all known users (strings)

function send_party_list_to_all() {
    var buffer = buffer_create(1024, buffer_grow, 1);
    buffer_write(buffer, buffer_u8, 2); // 2 = party list update
    buffer_write(buffer, buffer_u8, array_length(global.party_list));
    for (var i = 0; i < array_length(global.party_list); i++) {
        buffer_write(buffer, buffer_string, global.party_list[i]);
    }

    // Assuming you track all client sockets in a global array:
    for (var i = 0; i < array_length(global.client_sockets); i++) {
        network_send_raw(global.client_sockets[i], buffer, buffer_tell(buffer));
    }

    buffer_delete(buffer);
}
