var zy = 688;
draw_set_font(Font7);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
if global.exiting == false {
	if face1_enabled {
		draw_sprite_ext(spr_generic_face1, 0, 32, zy, 1, 1, 0, c_white, 1);
		draw_text(64 + 8, zy + 8, face1_prompt);
		zy -= 32	
	}
	
	if face2_enabled {
		draw_sprite_ext(spr_generic_face2, 0, 32, zy, 1, 1, 0, c_white, 1);
		draw_text(64 + 8, zy + 8, face2_prompt);
		zy -= 32	
	}
	if face3_enabled {
		draw_sprite_ext(spr_generic_face3, 0, 32, zy, 1, 1, 0, c_white, 1);
		draw_text(64 + 8, zy + 8, face3_prompt);
		zy -= 32	
	}
	if face4_enabled {
		draw_sprite_ext(spr_generic_face4, 0, 32, zy, 1, 1, 0, c_white, 1);
		draw_text(64 + 8, zy + 8, face4_prompt);
		zy -= 32	
	}
	if lb_enabled {
		draw_sprite_ext(spr_generic_L1, 0, 32, zy, 1, 1, 0, c_white, 1);
		draw_text(64 + 8, zy + 8, lb_prompt);
		zy -= 32	
	}
	if lt_enabled {
		draw_sprite_ext(spr_generic_L2, 0, 32, zy, 1, 1, 0, c_white, 1);
		draw_text(64 + 8, zy + 8, lt_prompt);
		zy -= 32	
	}
	if rb_enabled {
		draw_sprite_ext(spr_generic_R1, 0, 32, zy, 1, 1, 0, c_white, 1);
		draw_text(64 + 8, zy + 8, rb_prompt);
		zy -= 32	
	}
	if rt_enabled {
		draw_sprite_ext(spr_generic_R2, 0, 32, zy, 1, 1, 0, c_white, 1);
		draw_text(64 + 8, zy + 8, rt_prompt);
		zy -= 32;
	}
	if start_enabled {
		draw_sprite_ext(spr_generic_start, 0, 32, zy, 1, 1, 0, c_white, 1);
		draw_text(64 + 8, zy + 8, start_prompt);
		zy -= 32	
	}
}