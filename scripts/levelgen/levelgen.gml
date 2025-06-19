function scr_generate_level(argument0) {
	/// scr_generate_level(chunk_count)

	var chunk_count = argument0;
	var chunk_width = 10;
	var tile_size = 32;

	instance_destroy(obj_autoterrain_metal);
	instance_destroy(obj_spawner);
	instance_destroy(obj_plr_platformer);
	
	show_debug_message("Objects removed.");

	var level_data = [];
	var tiles_high = room_height div tile_size;

	// Generate chunks
	for (var i = 0; i < chunk_count; i++) {
	    var chunk = choose(global.chunk_list);
	    level_data[i] = chunk;

	    for (var ty = 0; ty < array_length(chunk); ty++) {
	        for (var tx = 0; tx < chunk_width; tx++) {
	            var val = chunk[ty][tx];
	            var xx = (i * chunk_width + tx) * tile_size;
	            var yy = ty * tile_size;

	            switch (val) {
	                case 1:
	                    instance_create_layer(xx, yy, "Tiles", obj_autoterrain_metal);
						show_debug_message("Tile generated.");
	                    break;
	                case 2:
	                    instance_create_layer(xx, yy, "Instances", obj_spawner);
	                    break;
	            }
	        }
	    }
		show_debug_message("Chunk generated.");
	}
	show_debug_message("All chunks generated!");

	// Add boundary tiles
	var tiles_wide = chunk_count * chunk_width;

	// Top/bottom
	for (var xx = 0; xx < tiles_wide; xx++) {
	    instance_create_layer(xx * tile_size, 0, "Tiles", obj_autoterrain_metal);
	    instance_create_layer(xx * tile_size, (tiles_high - 1) * tile_size, "Tiles", obj_autoterrain_metal);
	}

	// Left/right
	for (var yy = 0; yy < tiles_high; yy++) {
	    instance_create_layer(0, yy * tile_size, "Tiles", obj_autoterrain_metal);
	    instance_create_layer((tiles_wide - 1) * tile_size, yy * tile_size, "Tiles", obj_autoterrain_metal);
	}
	
	show_debug_message("Border created.");

	// Find a safe player spawn
	var spawned = false;
	for (var i = 0; i < chunk_count && !spawned; i++) {
	    var chunk = level_data[i];
	    for (var ty = 1; ty < array_length(chunk) - 1; ty++) {
	        for (var tx = 1; tx < chunk_width - 1; tx++) {
	            if (chunk[ty][tx] == 0 && chunk[ty+1][tx] == 1) {
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
	show_debug_message("Player created.");
}

function scr_add_chunk(argument0) {
	/// scr_add_chunk(chunk_base)

	var base = argument0;
	var full_chunk = [];
	var chunk_width = array_length(base[0]);
	var chunk_height = room_height div 32;

	// Copy the given base chunk
	for (var i = 0; i < chunk_height; i++) {
	    if (i < array_length(base)) {
	        full_chunk[i] = base[i];
	    } else {
	        // Fill with empty rows
	        full_chunk[i] = array_create(chunk_width, 0);
	    }
	}

	array_push(global.chunk_list, full_chunk);
}

function scr_init_chunks() {
	/// scr_init_chunks()
	global.chunk_list = [];

	// Chunk 1: Flat platform
	scr_add_chunk([
	    [0,0,0,0,0,0,0,0,0,0],
	    [1,1,1,1,1,1,1,1,1,1]
	]);

	// Chunk 2: Gap in middle
	scr_add_chunk([
	    [1,1,1,0,0,0,1,1,1,1],
	    [1,1,1,1,1,1,1,1,1,1]
	]);

	// Chunk 3: Spawner above platform
	scr_add_chunk([
	    [0,0,0,0,2,0,0,0,0,0],
	    [1,1,1,1,1,1,1,1,1,1]
	]);
}