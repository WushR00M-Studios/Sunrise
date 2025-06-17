// Send your name to the server
var buffer = buffer_create(256, buffer_grow, 1);
buffer_write(buffer, buffer_u8, 1); // 1 = user join message
buffer_write(buffer, buffer_string, global.current_user);
network_send_raw(socket, buffer, buffer_tell(buffer));
buffer_delete(buffer);