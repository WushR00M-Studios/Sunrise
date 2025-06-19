/// Step Event

if (generation_done) exit;

if (chunk_index < chunk_count) {
    var i = chunk_index;
    var chunk = choose(global.chunk_list);
    level_data[i] = chunk;

    for (var ty = 0; ty < chunk_height; ty++) {
        var row = (ty < array_length(chunk)) ? chunk[ty] : [];

        for (var tx = 0; tx < chunk_width; tx++) {
            var val = (tx < array_length(row)) ? row[tx] : 0;

            var xx = (i * chunk_width + tx) * tile_size;
            var yy = ty * tile_size;

            switch (val) {
                case 1:
                    instance_create_layer(xx, yy, "Tiles", obj_autoterrain_metal);
                    break;
                case 2:
                    instance_create_layer(xx, yy, "Instances", obj_spawner);
                    break;
            }
        }
    }

    chunk_index += 1;
}
else {
    // Place player after all chunks
    var spawned = false;
    for (var i = 0; i < chunk_count && !spawned; i++) {
        var chunk = level_data[i];
        for (var ty = 1; ty < chunk_height - 1; ty++) {
            var row = (ty < array_length(chunk)) ? chunk[ty] : [];
            var row_below = (ty + 1 < array_length(chunk)) ? chunk[ty + 1] : [];

            for (var tx = 1; tx < chunk_width - 1; tx++) {
                var here = (tx < array_length(row)) ? row[tx] : -1;
                var below = (tx < array_length(row_below)) ? row_below[tx] : -1;

                if (here == 0 && below == 1) {
                    var xx = (i * chunk_width + tx) * tile_size;
                    var yy = ty * tile_size - sprite_get_height(spr_dash_colmask);
                    instance_create_layer(xx, yy, "Instances", obj_plr_platformer);
                    spawned = true;
                    break;
                }
            }
            if (spawned) break;
        }
    }
	show_debug_message("Generation Complete");

    generation_done = true;
}
