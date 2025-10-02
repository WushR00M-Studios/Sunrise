function script_parse(text_file){
	var d0;
	var d1;
	var d2;
	var d3;
	var d4;
	var d5;
	var d6;
	var d7;
	var d8;
	var d9;
	
	var ifst = false;
	var ifsttrue = false;
	var ifnotst = false
	
	file_text_open_read(text_file);
	
	while (!file_text_eof(text_file)) {
		var line = file_text_read_string(text_file);
		file_text_readln(text_file);
		
		if ifst == true {
			if ifsttrue == true {
				
			}
		} else {
			if (string_pos("reg.d1", line) > 0) {
				line = string_replace_all(line, "reg.d1", "");
				line = string_replace_all(line, " ", "");
			
				show_debug_message("Register command!");
			
				d1 = line;
			} else if (string_pos("reg.d2" , line) > 0) {
				line = string_replace_all(line, "reg.d2", "");
				line = string_replace_all(line, " ", "");
			
				show_debug_message("Register command!");
				d2 = line;
			} else if (string_pos("reg.d3", line) > 0) {
				line = string_replace_all(line, "reg.d3", "");
				line = string_replace_all(line, " ", "");
			
				show_debug_message("Register command!");
				d3 = line;
			} else if (string_pos("reg.d4", line) > 0) {
				line = string_replace_all(line, "reg.d4", "");
				line = string_replace_all(line, " ", "");
			
				show_debug_message("Register command!");
				d4 = line;
			} else if (string_pos("reg.d5", line) > 0) {
				line = string_replace_all(line, "reg.d5", "");
				line = string_replace_all(line, " ", "");
			
				show_debug_message("Register command!");
				d5 = line;
			} else if (string_pos("reg.d6", line) > 0) {
				line = string_replace_all(line, "reg.d6", "");
				line = string_replace_all(line, " ", "");
			
				show_debug_message("Register command!");
				d6 = line;
			} else if (string_pos("reg.d7", line) > 0) {
				line = string_replace_all(line, "reg.d7", "");
				line = string_replace_all(line, " ", "");
			
				show_debug_message("Register command!");
				d7 = line;
			} else if (string_pos("reg.d8", line) > 0) {
				line = string_replace_all(line, "reg.d8", "");
				line = string_replace_all(line, " ", "");
			
				show_debug_message("Register command!");
				d8 = line;
			} else if (string_pos("reg.d9", line) > 0) {
				line = string_replace_all(line, "reg.d9", "");
				line = string_replace_all(line, " ", "");
			
				show_debug_message("Register command!");
				d9 = line;
			} else if (string_pos("reg.d0", line) > 0) {
				line = string_replace_all(line, "reg.d0", "");
				line = string_replace_all(line, " ", "");
			
				show_debug_message("Register command!");
				d0 = line;
			} else if (string_pos("addq.d1", line) > 0) {
				line = string_replace_all(line, "addq.d1", "");
				line = string_replace_all(line, " ", "");
			
				if (!is_string(d1) && (is_numeric(d1) && is_numeric(line))) {
					d1 += line;
				} else {
					file_text_close(text_file);
					throw_error("Invalid variables; they must be an integer.");
				}
			} else if (string_pos("addq.d2" , line) > 0) {
				line = string_replace_all(line, "addq.d2", "");
				line = string_replace_all(line, " ", "");
			
				show_debug_message("addqister command!");
				if (!is_string(d2) && (is_numeric(d2) && is_numeric(line))) {
					d2 += line;
				} else {
					file_text_close(text_file);
					throw_error("Invalid variables; they must be an integer.");
				}
			} else if (string_pos("addq.d3", line) > 0) {
				line = string_replace_all(line, "addq.d3", "");
				line = string_replace_all(line, " ", "");
			
				show_debug_message("addqister command!");
				if (!is_string(d3) && (is_numeric(d3) && is_numeric(line))) {
					d3 += line;
				} else {
					file_text_close(text_file);
					throw_error("Invalid variables; they must be an integer.");
				}
			} else if (string_pos("addq.d4", line) > 0) {
				line = string_replace_all(line, "addq.d4", "");
				line = string_replace_all(line, " ", "");
			
				show_debug_message("addqister command!");
				if (!is_string(d4) && (is_numeric(d4) && is_numeric(line))) {
					d4 += line;
				} else {
					file_text_close(text_file);
					throw_error("Invalid variables; they must be an integer.");
				}
			} else if (string_pos("addq.d5", line) > 0) {
				line = string_replace_all(line, "addq.d5", "");
				line = string_replace_all(line, " ", "");
			
				show_debug_message("addqister command!");
				if (!is_string(d5) && (is_numeric(d5) && is_numeric(line))) {
					d5 += line;
				} else {
					file_text_close(text_file);
					throw_error("Invalid variables; they must be an integer.");
				}
			} else if (string_pos("addq.d6", line) > 0) {
				line = string_replace_all(line, "addq.d6", "");
				line = string_replace_all(line, " ", "");
			
				show_debug_message("addqister command!");
				if (!is_string(d6) && (is_numeric(d6) && is_numeric(line))) {
					d6 += line;
				} else {
					file_text_close(text_file);
					throw_error("Invalid variables; they must be an integer.");
				}
			} else if (string_pos("addq.d7", line) > 0) {
				line = string_replace_all(line, "addq.d7", "");
				line = string_replace_all(line, " ", "");
			
				show_debug_message("addqister command!");
				if (!is_string(d7) && (is_numeric(d7) && is_numeric(line))) {
					d7 += line;
				} else {
					file_text_close(text_file);
					throw_error("Invalid variables; they must be an integer.");
				}
			} else if (string_pos("addq.d8", line) > 0) {
				line = string_replace_all(line, "addq.d8", "");
				line = string_replace_all(line, " ", "");
			
				show_debug_message("addqister command!");
				if (!is_string(d8) && (is_numeric(d8) && is_numeric(line))) {
					d8 += line;
				} else {
					file_text_close(text_file);
					throw_error("Invalid variables; they must be an integer.");
				}
			} else if (string_pos("addq.d9", line) > 0) {
				line = string_replace_all(line, "addq.d9", "");
				line = string_replace_all(line, " ", "");
			
				show_debug_message("addqister command!");
				if (!is_string(d9) && (is_numeric(d9) && is_numeric(line))) {
					d9 += line;
				} else {
					file_text_close(text_file);
					throw_error("Invalid variables; they must be an integer.");
				}
			} else if (string_pos("addq.d0", line) > 0) {
				line = string_replace_all(line, "addq.d0", "");
				line = string_replace_all(line, " ", "");
			
				show_debug_message("addqister command!");
				if (!is_string(d0) && (is_numeric(d0) && is_numeric(line))) {
					d0 += line;
				} else {
					file_text_close(text_file);
					throw_error("Invalid variables; they must be an integer.");
				}
			} else if (string_pos("subt.d1", line) > 0) {
				line = string_replace_all(line, "subt.d1", "");
				line = string_replace_all(line, " ", "");
			
				show_debug_message("subtister command!");
				if (!is_string(d1) && (is_numeric(d1) && is_numeric(line))) {
					d1 -= line;
				} else {
					file_text_close(text_file);
					throw_error("Invalid variables; they must be an integer.");
				}
			} else if (string_pos("subt.d2" , line) > 0) {
				line = string_replace_all(line, "subt.d2", "");
				line = string_replace_all(line, " ", "");
			
				show_debug_message("subtister command!");
				if (!is_string(d2) && (is_numeric(d2) && is_numeric(line))) {
					d2 -= line;
				} else {
					file_text_close(text_file);
					throw_error("Invalid variables; they must be an integer.");
				}
			} else if (string_pos("subt.d3", line) > 0) {
				line = string_replace_all(line, "subt.d3", "");
				line = string_replace_all(line, " ", "");
			
				show_debug_message("subtister command!");
				if (!is_string(d3) && (is_numeric(d3) && is_numeric(line))) {
					d3 -= line;
				} else {
					file_text_close(text_file);
					throw_error("Invalid variables; they must be an integer.");
				}
			} else if (string_pos("subt.d4", line) > 0) {
				line = string_replace_all(line, "subt.d4", "");
				line = string_replace_all(line, " ", "");
			
				show_debug_message("subtister command!");
				if (!is_string(d4) && (is_numeric(d4) && is_numeric(line))) {
					d4 -= line;
				} else {
					file_text_close(text_file);
					throw_error("Invalid variables; they must be an integer.");
				}
			} else if (string_pos("subt.d5", line) > 0) {
				line = string_replace_all(line, "subt.d5", "");
				line = string_replace_all(line, " ", "");
			
				show_debug_message("subtister command!");
				if (!is_string(d5) && (is_numeric(d5) && is_numeric(line))) {
					d5 -= line;
				} else {
					file_text_close(text_file);
					throw_error("Invalid variables; they must be an integer.");
				}
			} else if (string_pos("subt.d6", line) > 0) {
				line = string_replace_all(line, "subt.d6", "");
				line = string_replace_all(line, " ", "");
			
				show_debug_message("subtister command!");
				if (!is_string(d6) && (is_numeric(d6) && is_numeric(line))) {
					d6 -= line;
				} else {
					file_text_close(text_file);
					throw_error("Invalid variables; they must be an integer.");
				}
			} else if (string_pos("subt.d7", line) > 0) {
				line = string_replace_all(line, "subt.d7", "");
				line = string_replace_all(line, " ", "");
			
				show_debug_message("subtister command!");
				if (!is_string(d7) && (is_numeric(d7) && is_numeric(line))) {
					d7 -= line;
				} else {
					file_text_close(text_file);
					throw_error("Invalid variables; they must be an integer.");
				}
			} else if (string_pos("subt.d8", line) > 0) {
				line = string_replace_all(line, "subt.d8", "");
				line = string_replace_all(line, " ", "");
			
				show_debug_message("subtister command!");
				if (!is_string(d8) && (is_numeric(d8) && is_numeric(line))) {
					d8 -= line;
				} else {
					file_text_close(text_file);
					throw_error("Invalid variables; they must be an integer.");
				}
			} else if (string_pos("subt.d9", line) > 0) {
				line = string_replace_all(line, "subt.d9", "");
				line = string_replace_all(line, " ", "");
			
				show_debug_message("subtister command!");
				if (!is_string(d9) && (is_numeric(d9) && is_numeric(line))) {
					d9 -= line;
				} else {
					file_text_close(text_file);
					throw_error("Invalid variables; they must be an integer.");
				}
			} else if (string_pos("subt.d0", line) > 0) {
				line = string_replace_all(line, "subt.d0", "");
				line = string_replace_all(line, " ", "");
			
				show_debug_message("subtister command!");
				if (!is_string(d0) && (is_numeric(d0) && is_numeric(line))) {
					d0 -= line;
				} else {
					file_text_close(text_file);
					throw_error("Invalid variables; they must be an integer.");
				}
			} else if (string_pos("mult.d1", line) > 0) {
				line = string_replace_all(line, "mult.d1", "");
				line = string_replace_all(line, " ", "");
			
				show_debug_message("multister command!");
				if (!is_string(d1) && (is_numeric(d1) && is_numeric(line))) {
					d1 = d1 * line;
				} else {
					file_text_close(text_file);
					throw_error("Invalid variables; they must be an integer.");
				}
			} else if (string_pos("mult.d2" , line) > 0) {
				line = string_replace_all(line, "mult.d2", "");
				line = string_replace_all(line, " ", "");
			
				show_debug_message("multister command!");
				show_debug_message("multister command!");
				if (!is_string(d2) && (is_numeric(d2) && is_numeric(line))) {
					d2 = d2 * line;
				} else {
					file_text_close(text_file);
					throw_error("Invalid variables; they must be an integer.");
				}
			} else if (string_pos("mult.d3", line) > 0) {
				line = string_replace_all(line, "mult.d3", "");
				line = string_replace_all(line, " ", "");
			
				show_debug_message("multister command!");
				show_debug_message("multister command!");
				if (!is_string(d3) && (is_numeric(d3) && is_numeric(line))) {
					d3 = d3 * line;
				} else {
					file_text_close(text_file);
					throw_error("Invalid variables; they must be an integer.");
				}
			} else if (string_pos("mult.d4", line) > 0) {
				line = string_replace_all(line, "mult.d4", "");
				line = string_replace_all(line, " ", "");
			
				show_debug_message("multister command!");
				if (!is_string(d4) && (is_numeric(d4) && is_numeric(line))) {
					d4 = d4 * line;
				} else {
					file_text_close(text_file);
					throw_error("Invalid variables; they must be an integer.");
				}
			} else if (string_pos("mult.d5", line) > 0) {
				line = string_replace_all(line, "mult.d5", "");
				line = string_replace_all(line, " ", "");
			
				show_debug_message("multister command!");
				if (!is_string(d5) && (is_numeric(d5) && is_numeric(line))) {
					d5 = d5 * line;
				} else {
					file_text_close(text_file);
					throw_error("Invalid variables; they must be an integer.");
				}
			} else if (string_pos("mult.d6", line) > 0) {
				line = string_replace_all(line, "mult.d6", "");
				line = string_replace_all(line, " ", "");
			
				show_debug_message("multister command!");
				if (!is_string(d6) && (is_numeric(d6) && is_numeric(line))) {
					d6 = d6 * line;
				} else {
					file_text_close(text_file);
					throw_error("Invalid variables; they must be an integer.");
				}
			} else if (string_pos("mult.d7", line) > 0) {
				line = string_replace_all(line, "mult.d7", "");
				line = string_replace_all(line, " ", "");
			
				show_debug_message("multister command!");
				if (!is_string(d7) && (is_numeric(d7) && is_numeric(line))) {
					d7 = d7 * line;
				} else {
					file_text_close(text_file);
					throw_error("Invalid variables; they must be an integer.");
				}
			} else if (string_pos("mult.d8", line) > 0) {
				line = string_replace_all(line, "mult.d8", "");
				line = string_replace_all(line, " ", "");
			
				show_debug_message("multister command!");
				if (!is_string(d8) && (is_numeric(d8) && is_numeric(line))) {
					d8 = d8 * line;
				} else {
					file_text_close(text_file);
					throw_error("Invalid variables; they must be an integer.");
				}
			} else if (string_pos("mult.d9", line) > 0) {
				line = string_replace_all(line, "mult.d9", "");
				line = string_replace_all(line, " ", "");
			
				show_debug_message("multister command!");
				if (!is_string(d9) && (is_numeric(d9) && is_numeric(line))) {
					d9 = d9 * line;
				} else {
					file_text_close(text_file);
					throw_error("Invalid variables; they must be an integer.");
				}
			} else if (string_pos("mult.d0", line) > 0) {
				line = string_replace_all(line, "mult.d0", "");
				line = string_replace_all(line, " ", "");
			
				show_debug_message("multister command!");
				if (!is_string(d3) && (is_numeric(d0) && is_numeric(line))) {
					d0 = d0 * line;
				} else {
					file_text_close(text_file);
					throw_error("Invalid variables; they must be an integer.");
				}
			} else if (string_pos("divi.d1", line) > 0) {
				line = string_replace_all(line, "divi.d1", "");
				line = string_replace_all(line, " ", "");
			
				show_debug_message("diviister command!");
				if (!is_string(d1) && (is_numeric(d1) && is_numeric(line))) {
					if (d1 == 0) or (line == 0) {
						file_text_close(text_file);
						throw_error("Cannot divide by zero!");
					} else {
						d1 = d1 / line;	
					}
				} else {
					file_text_close(text_file);
					throw_error("Invalid variables; they must be an integer.");
				}
			} else if (string_pos("divi.d2" , line) > 0) {
				line = string_replace_all(line, "divi.d2", "");
				line = string_replace_all(line, " ", "");
			
				show_debug_message("diviister command!");
				if (!is_string(d2) && (is_numeric(d2) && is_numeric(line))) {
					if (d2 == 0) or (line == 0) {
						file_text_close(text_file);
						throw_error("Cannot divide by zero!");
					} else {
						d2 = d2 / line;	
					}
				} else {
					file_text_close(text_file);
					throw_error("Invalid variables; they must be an integer.");
				}
			} else if (string_pos("divi.d3", line) > 0) {
				line = string_replace_all(line, "divi.d3", "");
				line = string_replace_all(line, " ", "");
			
				show_debug_message("diviister command!");
				if (!is_string(d3) && (is_numeric(d3) && is_numeric(line))) {
					if (d3 == 0) or (line == 0) {
						file_text_close(text_file);
						throw_error("Cannot divide by zero!");
					} else {
						d3 = d3 / line;	
					}
				} else {
					file_text_close(text_file);
					throw_error("Invalid variables; they must be an integer.");
				}
			} else if (string_pos("divi.d4", line) > 0) {
				line = string_replace_all(line, "divi.d4", "");
				line = string_replace_all(line, " ", "");
			
				show_debug_message("diviister command!");
				if (!is_string(d4) && (is_numeric(d4) && is_numeric(line))) {
					if (d4 == 0) or (line == 0) {
						file_text_close(text_file);
						throw_error("Cannot divide by zero!");
					} else {
						d4 = d4 / line;	
					}
				} else {
					file_text_close(text_file);
					throw_error("Invalid variables; they must be an integer.");
				}
			} else if (string_pos("divi.d5", line) > 0) {
				line = string_replace_all(line, "divi.d5", "");
				line = string_replace_all(line, " ", "");
			
				show_debug_message("diviister command!");
				if (!is_string(d5) && (is_numeric(d5) && is_numeric(line))) {
					if (d5 == 0) or (line == 0) {
						file_text_close(text_file);
						throw_error("Cannot divide by zero!");
					} else {
						d5 = d5 / line;	
					}
				} else {
					file_text_close(text_file);
					throw_error("Invalid variables; they must be an integer.");
				}
			} else if (string_pos("divi.d6", line) > 0) {
				line = string_replace_all(line, "divi.d6", "");
				line = string_replace_all(line, " ", "");
			
				show_debug_message("diviister command!");
				if (!is_string(d6) && (is_numeric(d6) && is_numeric(line))) {
					if (d6 == 0) or (line == 0) {
						file_text_close(text_file);
						throw_error("Cannot divide by zero!");
					} else {
						d6 = d6 / line;	
					}
				} else {
					file_text_close(text_file);
					throw_error("Invalid variables; they must be an integer.");
				}
			} else if (string_pos("divi.d7", line) > 0) {
				line = string_replace_all(line, "divi.d7", "");
				line = string_replace_all(line, " ", "");
			
				show_debug_message("diviister command!");
				if (!is_string(d7) && (is_numeric(d7) && is_numeric(line))) {
					if (d7 == 0) or (line == 0) {
						file_text_close(text_file);
						throw_error("Cannot divide by zero!");
					} else {
						d7 = d7 / line;	
					}
				} else {
					file_text_close(text_file);
					throw_error("Invalid variables; they must be an integer.");
				}
			} else if (string_pos("divi.d8", line) > 0) {
				line = string_replace_all(line, "divi.d8", "");
				line = string_replace_all(line, " ", "");
			
				show_debug_message("diviister command!");
				if (!is_string(d1) && (is_numeric(d1) && is_numeric(line))) {
					if (d8 == 0) or (line == 0) {
						file_text_close(text_file);
						throw_error("Cannot divide by zero!");
					} else {
						d8 = d8 / line;	
					}
				} else {
					file_text_close(text_file);
					throw_error("Invalid variables; they must be an integer.");
				}
			} else if (string_pos("divi.d9", line) > 0) {
				line = string_replace_all(line, "divi.d9", "");
				line = string_replace_all(line, " ", "");
			
				show_debug_message("diviister command!");
				if (!is_string(d9) && (is_numeric(d9) && is_numeric(line))) {
					if (d9 == 0) or (line == 0) {
						file_text_close(text_file);
						throw_error("Cannot divide by zero!");
					} else {
						d9 = d9 / line;	
					}
				} else {
					file_text_close(text_file);
					throw_error("Invalid variables; they must be an integer.");
				}
			} else if (string_pos("divi.d0", line) > 0) {
				line = string_replace_all(line, "divi.d0", "");
				line = string_replace_all(line, " ", "");
			
				show_debug_message("diviister command!");
				if (!is_string(d0) && (is_numeric(d0) && is_numeric(line))) {
					if (d0 == 0) or (line == 0) {
						file_text_close(text_file);
						throw_error("Cannot divide by zero!");
					} else {
						d0 = d0 / line;	
					}
				} else {
					file_text_close(text_file);
					throw_error("Invalid variables; they must be an integer.");
				}
			} else if (string_pos("tpx", line) > 0) {
				line = string_replace_all(line, "tpx", "");
				line = string_replace_all(line, " ", "");
			
				if (line > room_width) or (line < room_width) {
					file_text_close(text_file);
					throw_error("Out of bounds.");
				} else {
					with obj_plr_platformer
						x = line;
				}
			} else if (string_pos("tpy", line) > 0) {
				line = string_replace_all(line, "tpy", "");
				line = string_replace_all(line, " ", "");
			
				if (line > room_height) or (line < room_height) {
					file_text_close(text_file);
					throw_error("Out of bounds.");
				} else {
					with obj_plr_platformer
						x = line;
				}	
			} else if (string_pos("if", line) > 0) {
				line = string_replace_all(line, "if", "");
				line = string_replace_all(line, " ", "");
			
				ifst = true;
				if (line != 0) or (line != pointer_null)
					ifsttrue = true;
			} else if (string_pos("ifnot", line) > 0) {
				line = string_replace_all(line, "ifnot", "");
				line = string_replace_all(line, " ", "");
			
				ifst = true;
				if (line == 0) or (line == pointer_null)
					ifsttrue = true;
			} else if (string_pos("endif", line) > 0) {
				line = string_replace_all(line, "endif", "");
				line = string_replace_all(line, " ", "");
			
				if ifst != false {
					ifst = false;
					ifsttrue = false;
				} else {
					file_text_close(text_file);
					throw_error("Unexpected endif Statement");
				}
			} else if (string_pos("log", line) > 0) {
				line = string_replace_all(line, "log", "");
				toast_create("MESSAGE FROM LEVEL:" + line, 1);
			} else if (string_pos("rmv", line) > 0) {
				line = string_replace_all(line, "rmv", "");
				line = string_replace_all(line, " ", "");
				
				if instance_exists(line) {
					if line == "obj_init" or line == "obj_controller" or line == "obj_cursor" or line == "obj_pause" or line == "obj_plr_platformer" or line == "obj_richpres" or line == "obj_camera" or line == "obj_cm_camera" or line == "objcreatemode_controller" or line == "obj_input_dialog" or line == "obj_toolbar" or line == "obj_volman" or line == "obj_toast" {
						file_text_close(text_file);
						throw_error("That object can't be removed.");
					} else {
						instance_destroy(line)
					}
				} else {
					file_text_close(text_file);
					throw_error("Nonexisant object!");
				}
			} else {
				file_text_close(text_file);
				throw_error("Invalid command entered; see documentation for a list of known commands");	
			}
		}
	}
	file_text_close(text_file);
}

function throw_error(reason) {
	if room == rm_create
		global.cmplay = false;
		
	toast_dismiss();
	toast_create("SCRIPT HALT: " + reason, 4);
}