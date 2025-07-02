global.cm_items2 = [
	    { name: "Solid Block", icon: spr_index_solidblock_32 },
	    { name: "Spawner", icon: spr_index_spawner_32},
	    { name: "Checkpoint", icon: spr_index_checkpoint_32},
	    { name: "Text Display", icon: spr_index_textdisplay_32},
		{ name: "Logic Board", icon: spr_index_placeholder_32},
	    { name: "AND Gate", icon: spr_index_placeholder_32},
	    { name: "OR Gate", icon: spr_index_placeholder_32},
	    { name: "XOR Gate", icon: spr_index_placeholder_32},
	    { name: "NOT Gate", icon: spr_index_placeholder_32},
	    { name: "Logic Battery", icon: spr_index_placeholder_32},
	    { name: "Wire Connector", icon: spr_index_placeholder_32},
	    { name: "Light Object (indev)", icon: spr_index_light_32}
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

cm_scales = array_create(array_length(global.cm_items2), 0);
