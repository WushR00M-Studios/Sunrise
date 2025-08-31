if global.cmtheme == "Plains" {
	if place_meeting(x, y - 32, obj_autoterrain_grass) {
		if sprite_index == spr_autoter_grass
			sprite_index = spr_autoter_dirt;
	}
} else if global.cmtheme == "Metropolis" {
	if place_meeting(x, y - 32, obj_autoterrain_metal) {
		sprite_index = spr_autoter_metal_bottom;
	}

	if sprite_index != spr_autoter_metal_bottom {
		if place_meeting(x + 32, y, obj_autoterrain_metal) {
			sprite_index = spr_autoter_metal_top_left;
		} else if place_meeting(x - 32, y, obj_autoterrain_metal) {
			sprite_index = spr_autoter_metal_top_right;
		}

		if place_meeting(x + 32, y, obj_autoterrain_metal) && place_meeting(x - 32, y, obj_autoterrain_metal) {
			sprite_index = spr_autoter_metal_top_middle;
		}
	}
}