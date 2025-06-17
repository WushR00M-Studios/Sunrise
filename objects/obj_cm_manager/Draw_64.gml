// Border

if global.cm_tool == 1
	draw_set_color(make_color_rgb(18, 51, 181));
else if global.cm_tool == 2
	draw_set_color(make_color_rgb(181, 18, 83));
else if global.cm_tool == 3
	draw_set_color(make_color_rgb(207, 160, 21));

draw_rectangle(1358, 24, 1366, 768, false);

draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_halign(fa_top)
draw_set_font(Font7);

if global.cm_tool == 1 {
	draw_sprite_ext(spr_index_terrain, 0, 16, 720, 2, 2, 0, c_white, 1);
	draw_text(64, 726, "Terrain Editor")	
} else if global.cm_tool == 2 {
	draw_sprite_ext(spr_index_solidblock, 0, 16, 720, 2, 2, 0, c_white, 1);
	draw_text(64, 726, "Object Editor")	
} else if global.cm_tool == 3 {
	draw_sprite_ext(spr_index_levelprop, 0, 16, 720, 2, 2, 0, c_white, 1);
	draw_text(64, 726, "Level Properties")	
}