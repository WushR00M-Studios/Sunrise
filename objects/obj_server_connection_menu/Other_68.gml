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
