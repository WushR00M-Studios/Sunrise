// Tile size
tile_w = 64;
tile_h = 64;

// Grid size
grid_w = room_width div tile_w;
grid_h = room_height div tile_h;

// Create 2D array for light levels
light_map = array_create(grid_w);
for (var gx = 0; gx < grid_w; gx++) {
    light_map[gx] = array_create(grid_h, 0);
}

function update_lighting(tile_w, tile_h, grid_w, grid_h, light_map_ref) {
    // Reset light map
    for (var gx = 0; gx < grid_w; gx++) {
        for (var gy = 0; gy < grid_h; gy++) {
            light_map_ref[gx][gy] = 0;
        }
    }

    var queue = ds_queue_create();

    // Enqueue all light sources
    with (obj_light) {
        var light_x = x div tile_w;
        var light_y = y div tile_h;
        ds_queue_enqueue(queue, [light_x, light_y, light_radius]);
    }
	
	with (obj_light_cm) {
        var light_x = x div tile_w;
        var light_y = y div tile_h;
        ds_queue_enqueue(queue, [light_x, light_y, light_radius]);
    }

    while (ds_queue_size(queue) > 0) {
        var data = ds_queue_dequeue(queue);
        var gx = data[0];
        var gy = data[1];
        var level = data[2];

        if (gx < 0 || gy < 0 || gx >= grid_w || gy >= grid_h) continue;
        if (light_map_ref[gx][gy] >= level) continue;

        light_map_ref[gx][gy] = level;

        if (level > 0) {
            ds_queue_enqueue(queue, [gx+1, gy, level-1]);
            ds_queue_enqueue(queue, [gx-1, gy, level-1]);
            ds_queue_enqueue(queue, [gx, gy+1, level-1]);
            ds_queue_enqueue(queue, [gx, gy-1, level-1]);
        }
    }

    ds_queue_destroy(queue);
}


