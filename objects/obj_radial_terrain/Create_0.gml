global.cm_items = [
	   { name: "Grass Terrain", icon: spr_index_grass_32 },
	   { name: "Metal Terrain", icon: spr_index_metal_32 }
];

global.cm_sel = 0;

cm_display_count = 5;
cm_radius = 128;
cm_angle_range = pi; // Half-circle (180°)
cm_center_x = view_wport[0];
cm_center_y = view_hport[0] / 2;

cm_angle_offset = 0;
cm_target_offset = 0;
cm_lerp_speed = 0.15;

cm_scales = array_create(array_length(global.cm_items), 0);
