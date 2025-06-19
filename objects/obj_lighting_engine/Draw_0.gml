for (var gx = 0; gx < grid_w; gx++) {
    for (var gy = 0; gy < grid_h; gy++) {
        var lv = light_map[gx][gy];

        // Flip light levels: 0 = brightest
        var reversed_lv = 7 - lv;

        // Clamp in case of unexpected values
        reversed_lv = clamp(reversed_lv, 0, 7);

        var spr = asset_get_index("spr_lighting_lev" + string(reversed_lv));
        if (spr != -1) {
            draw_sprite(spr, 0, gx * tile_w, gy * tile_h);
        }
    }
}
