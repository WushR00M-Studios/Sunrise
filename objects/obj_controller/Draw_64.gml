var zy = 688;
draw_set_font(Font7);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
if global.exiting == false {
	if global.controllertype == 1 {
		if face1_enabled {
			draw_sprite_ext(spr_xbox_face1, 0, 32, zy, 1, 1, 0, c_white, 1);
			draw_text(64 + 8, zy + 8, face1_prompt);
			zy -= 32;
		}

		if face2_enabled {
			draw_sprite_ext(spr_xbox_face2, 0, 32, zy, 1, 1, 0, c_white, 1);
			draw_text(64 + 8, zy + 8, face2_prompt);
			zy -= 32;
		}

		if face4_enabled {
			draw_sprite_ext(spr_xbox_face3, 0, 32, zy, 1, 1, 0, c_white, 1);
			draw_text(64 + 8, zy + 8, face3_prompt);
			zy -= 32;
		}

		if face3_enabled {
			draw_sprite_ext(spr_xbox_face4, 0, 32, zy, 1, 1, 0, c_white, 1);
			draw_text(64 + 8, zy + 8, face4_prompt);
			zy -= 32;
		}
	
		if start_enabled {
			draw_sprite_ext(spr_xbox_start, 0, 32, zy, 1, 1, 0, c_white, 1);
			draw_text(64 + 8, zy + 8, start_prompt);
			zy -= 32;
		}
	
		if lb_enabled {
			draw_sprite_ext(spr_xbox_lb, 0, 32, zy, 1, 1, 0, c_white, 1);
			draw_text(64 + 8, zy + 8, lb_prompt);
			zy -= 32;
		}
	
		if rb_enabled {
			draw_sprite_ext(spr_xbox_rb, 0, 32, zy, 1, 1, 0, c_white, 1);
			draw_text(64 + 8, zy + 8, rb_prompt);
			zy -= 32;
		}
	
		if lt_enabled {
			draw_sprite_ext(spr_xbox_lt, 0, 32, zy, 1, 1, 0, c_white, 1);
			draw_text(64 + 8, zy + 8, lt_prompt);
			zy -= 32;
		}
	
		if rt_enabled {
			draw_sprite_ext(spr_xbox_rt, 0, 32, zy, 1, 1, 0, c_white, 1);
			draw_text(64 + 8, zy + 8, rt_prompt);
			zy -= 32;
		}
	} else if global.controllertype == 2 {
		if face1_enabled {
			draw_sprite_ext(spr_switch_face1, 0, 32, zy, 1, 1, 0, c_white, 1);
			draw_text(64 + 8, zy + 8, face1_prompt);
			zy -= 32;
		}

		if face2_enabled {
			draw_sprite_ext(spr_switch_face2, 0, 32, zy, 1, 1, 0, c_white, 1);
			draw_text(64 + 8, zy + 8, face2_prompt);
			zy -= 32;
		}

		if face3_enabled {
			draw_sprite_ext(spr_switch_face4, 0, 32, zy, 1, 1, 0, c_white, 1);
			draw_text(64 + 8, zy + 8, face4_prompt);
			zy -= 32;
		}

		if face4_enabled {
			draw_sprite_ext(spr_switch_face3, 0, 32, zy, 1, 1, 0, c_white, 1);
			draw_text(64 + 8, zy + 8, face3_prompt);
			zy -= 32;
		}
	
		if start_enabled {
			draw_sprite_ext(spr_switch_start, 0, 32, zy, 1, 1, 0, c_white, 1);
			draw_text(64 + 8, zy + 8, start_prompt);
			zy -= 32;
		}
	
		if lb_enabled {
			draw_sprite_ext(spr_switch_lb, 0, 32, zy, 1, 1, 0, c_white, 1);
			draw_text(64 + 8, zy + 8, lb_prompt);
			zy -= 32;
		}
	
		if rb_enabled {
			draw_sprite_ext(spr_switch_rb, 0, 32, zy, 1, 1, 0, c_white, 1);
			draw_text(64 + 8, zy + 8, rb_prompt);
			zy -= 32;
		}
	
		if lt_enabled {
			draw_sprite_ext(spr_switch_lt, 0, 32, zy, 1, 1, 0, c_white, 1);
			draw_text(64 + 8, zy + 8, lt_prompt);
			zy -= 32;
		}
	
		if rt_enabled {
			draw_sprite_ext(spr_switch_rt, 0, 32, zy, 1, 1, 0, c_white, 1);
			draw_text(64 + 8, zy + 8, rt_prompt);
			zy -= 32;
		}
	} else if global.controllertype == 3 {
		if face1_enabled {
			draw_sprite_ext(spr_playstation_face1, 0, 32, zy, 1, 1, 0, c_white, 1);
			draw_text(64 + 8, zy + 8, face1_prompt);
			zy -= 32;
		}

		if face2_enabled {
			draw_sprite_ext(spr_playstation_face2, 0, 32, zy, 1, 1, 0, c_white, 1);
			draw_text(64 + 8, zy + 8, face2_prompt);
			zy -= 32;
		}

		if face3_enabled {
			draw_sprite_ext(spr_playstation_face4, 0, 32, zy, 1, 1, 0, c_white, 1);
			draw_text(64 + 8, zy + 8, face4_prompt);
			zy -= 32;
		}

		if face4_enabled {
			draw_sprite_ext(spr_playstation_face3, 0, 32, zy, 1, 1, 0, c_white, 1);
			draw_text(64 + 8, zy + 8, face3_prompt);
			zy -= 32;
		}
	
		if start_enabled {
			draw_sprite_ext(spr_playstation_start, 0, 32, zy, 1, 1, 0, c_white, 1);
			draw_text(64 + 8, zy + 8, start_prompt);
			zy -= 32;
		}
	
		if lb_enabled {
			draw_sprite_ext(spr_playstation_lb, 0, 32, zy, 1, 1, 0, c_white, 1);
			draw_text(64 + 8, zy + 8, lb_prompt);
			zy -= 32;
		}
	
		if rb_enabled {
			draw_sprite_ext(spr_playstation_rb, 0, 32, zy, 1, 1, 0, c_white, 1);
			draw_text(64 + 8, zy + 8, rb_prompt);
			zy -= 32;
		}
	
		if lt_enabled {
			draw_sprite_ext(spr_playstation_lt, 0, 32, zy, 1, 1, 0, c_white, 1);
			draw_text(64 + 8, zy + 8, lt_prompt);
			zy -= 32;
		}
	
		if rt_enabled {
			draw_sprite_ext(spr_playstation_rt, 0, 32, zy, 1, 1, 0, c_white, 1);
			draw_text(64 + 8, zy + 8, rt_prompt);
			zy -= 32;
		}
	} else {
		if face1_enabled {
			draw_sprite_ext(spr_xbox_face1, 0, 32, zy, 1, 1, 0, c_white, 1);
			draw_text(64 + 8, zy + 8, face1_prompt);
			zy -= 32;
		}

		if face2_enabled {
			draw_sprite_ext(spr_xbox_face2, 0, 32, zy, 1, 1, 0, c_white, 1);
			draw_text(64 + 8, zy + 8, face2_prompt);
			zy -= 32;
		}

		if face3_enabled {
			draw_sprite_ext(spr_xbox_face4, 0, 32, zy, 1, 1, 0, c_white, 1);
			draw_text(64 + 8, zy + 8, face4_prompt);
			zy -= 32;
		}

		if face4_enabled {
			draw_sprite_ext(spr_xbox_face3, 0, 32, zy, 1, 1, 0, c_white, 1);
			draw_text(64 + 8, zy + 8, face3_prompt);
			zy -= 32;
		}
	
		if start_enabled {
			draw_sprite_ext(spr_xbox_start, 0, 32, zy, 1, 1, 0, c_white, 1);
			draw_text(64 + 8, zy + 8, start_prompt);
			zy -= 32;
		}
	
		if lb_enabled {
			draw_sprite_ext(spr_xbox_lb, 0, 32, zy, 1, 1, 0, c_white, 1);
			draw_text(64 + 8, zy + 8, lb_prompt);
			zy -= 32;
		}
	
		if rb_enabled {
			draw_sprite_ext(spr_xbox_rb, 0, 32, zy, 1, 1, 0, c_white, 1);
			draw_text(64 + 8, zy + 8, rb_prompt);
			zy -= 32;
		}
	
		if lt_enabled {
			draw_sprite_ext(spr_xbox_lt, 0, 32, zy, 1, 1, 0, c_white, 1);
			draw_text(64 + 8, zy + 8, lt_prompt);
			zy -= 32;
		}
	
		if rt_enabled {
			draw_sprite_ext(spr_xbox_rt, 0, 32, zy, 1, 1, 0, c_white, 1);
			draw_text(64 + 8, zy + 8, rt_prompt);
			zy -= 32;
		}
	}
}