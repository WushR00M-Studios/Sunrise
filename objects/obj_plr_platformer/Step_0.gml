if !gamepad_is_connected(0) {
	// === HORIZONTAL MOVEMENT ===
	if (keyboard_check(vk_right)) {
	    hsp = min(hsp + walk_accel, walk_max);
	} else if (keyboard_check(vk_left)) {
	    hsp = max(hsp - walk_accel, -walk_max);
	} else {
	    if (abs(hsp) < walk_decel) {
	        hsp = 0;
	    } else {
	        hsp -= sign(hsp) * walk_decel;
	    }
	}

	if (dust_timer > 0) dust_timer--;

	if (on_ground && abs(hsp) > 1 && dust_timer <= 0) {
	    instance_create_depth(x, y, -1, obj_dust);
	    dust_timer = 15; // frames between each dust puff
	}

	// === JUMPING ===
	if (on_ground && keyboard_check_pressed(ord("A"))) {
	    vsp = jump_strength;
	    on_ground = false;
	    double_jump = true;
	} else if (!on_ground && double_jump && keyboard_check_pressed(ord("A"))) {
	    vsp = jump_strength;
	    double_jump = false;
	}

	// === HOMING ATTACK ===
	if (!on_ground && keyboard_check_pressed(ord("A")) && can_homing) {
	    var nearest = noone;
	    var best_dist = homing_range;

	    with (obj_enemy) {
	        var dist = point_distance(other.x, other.y, x, y);
	        if (dist < best_dist) {
	            best_dist = dist;
	            nearest = id;
	        }
	    }

	    if (nearest != noone) {
	        var dir = point_direction(x, y, nearest.x, nearest.y);
	        hsp = lengthdir_x(homing_speed, dir);
	        vsp = lengthdir_y(homing_speed, dir);
	        with (nearest) instance_destroy();
	        can_homing = false;
	    }
	}

	// === MELEE ===
	if (!on_ground && keyboard_check_pressed(ord("S")) && can_homing) {
	    var nearest = noone;
	    var best_dist = homing_range;
		homing_attack_active = true;

	    with (obj_enemy) {
	        var dist = point_distance(other.x, other.y, x, y);
	        if (dist < best_dist) {
	            best_dist = dist;
	            nearest = id;
	        }
	    }

	    if (nearest != noone) {
	        var dir = point_direction(x, y, nearest.x, nearest.y);
	        hsp = lengthdir_x(homing_speed, dir);
	        vsp = lengthdir_y(homing_speed, dir);
	        with (nearest) instance_destroy();
	        can_homing = false;
			homing_attack_active = false;
	    }
		homing_attack_active = false;
	}

	// === GRAVITY ===
	vsp += grv;

	var move_x = round(hsp);
	var sign_x = sign(move_x);

	while (move_x != 0) {
	    if (!collision_at(x + sign_x, y)) {
	        x += sign_x;
	        move_x -= sign_x;
	    } else {
	        hsp = 0;
	        break;
	    }
	}

	vsp += grv;
	var move_y = round(vsp);
	var sign_y = sign(move_y);
	on_ground = false;

	while (move_y != 0) {
	    if (!collision_at(x, y + sign_y)) {
	        y += sign_y;
	        move_y -= sign_y;
	    } else {
	        if (sign_y > 0) {
	            on_ground = true;
	            can_homing = true;
	        }
	        vsp = 0;
	        break;
	    }
	}

	// === ANIMATION STATE MANAGEMENT ===
	if (!on_ground) {
	    if (!double_jump && vsp < 0) {
	        sprite_index = spr_dash_roll; // Double jump
	    } else if (vsp < 0) {
	        sprite_index = spr_dash_jumping;
	    } else if (vsp > 0) {
	        sprite_index = spr_dash_slamdown;
	    }
	} else if (abs(hsp) > 5) {
	    sprite_index = spr_dash_running;
	} else if (abs(hsp) < 5) && (abs(hsp) > 0.5) {
		sprite_index = spr_dash_walking;	
	} else {
	    sprite_index = spr_dash_idle;
	}

	if (hsp != 0) {
	    image_xscale = sign(hsp);
	}

} else {
		// === HORIZONTAL MOVEMENT ===
	if gamepad_button_check(0, gp_padr) {
	    hsp = min(hsp + walk_accel, walk_max);
	} else if gamepad_button_check(0, gp_padl) {
	    hsp = max(hsp - walk_accel, -walk_max);
	} else {
	    if (abs(hsp) < walk_decel) {
	        hsp = 0;
	    } else {
	        hsp -= sign(hsp) * walk_decel;
	    }
	}

	if (dust_timer > 0) dust_timer--;

	if (on_ground && abs(hsp) > 1 && dust_timer <= 0) {
	    instance_create_depth(x, y, -1, obj_dust);
	    dust_timer = 15; // frames between each dust puff
	}

	// === JUMPING ===
	if (on_ground && gamepad_button_check_pressed(0, gp_face1)) {
	    vsp = jump_strength;
	    on_ground = false;
	    double_jump = true;
	} else if (!on_ground && double_jump && gamepad_button_check_pressed(0, gp_face1)) {
	    vsp = jump_strength;
	    double_jump = false;
	}

	// === HOMING ATTACK ===
	if (!on_ground && gamepad_button_check_pressed(0, gp_face1) && can_homing) {
	    var nearest = noone;
	    var best_dist = homing_range;

	    with (obj_enemy) {
	        var dist = point_distance(other.x, other.y, x, y);
	        if (dist < best_dist) {
	            best_dist = dist;
	            nearest = id;
	        }
	    }

	    if (nearest != noone) {
	        var dir = point_direction(x, y, nearest.x, nearest.y);
	        hsp = lengthdir_x(homing_speed, dir);
	        vsp = lengthdir_y(homing_speed, dir);
	        with (nearest) instance_destroy();
	        can_homing = false;
	    }
	}

	// === MELEE ===
	if (!on_ground && gamepad_button_check_pressed(0, gp_face3) && can_homing) {
	    var nearest = noone;
	    var best_dist = homing_range;
		homing_attack_active = true;

	    with (obj_enemy) {
	        var dist = point_distance(other.x, other.y, x, y);
	        if (dist < best_dist) {
	            best_dist = dist;
	            nearest = id;
	        }
	    }

	    if (nearest != noone) {
	        var dir = point_direction(x, y, nearest.x, nearest.y);
	        hsp = lengthdir_x(homing_speed, dir);
	        vsp = lengthdir_y(homing_speed, dir);
	        with (nearest) instance_destroy();
	        can_homing = false;
			homing_attack_active = false;
	    }
		homing_attack_active = false;
	}

	// === GRAVITY ===
	vsp += grv;

	var move_x = round(hsp);
	var sign_x = sign(move_x);

	while (move_x != 0) {
	    if (!collision_at(x + sign_x, y)) {
	        x += sign_x;
	        move_x -= sign_x;
	    } else {
	        hsp = 0;
	        break;
	    }
	}

	vsp += grv;
	var move_y = round(vsp);
	var sign_y = sign(move_y);
	on_ground = false;

	while (move_y != 0) {
	    if (!collision_at(x, y + sign_y)) {
	        y += sign_y;
	        move_y -= sign_y;
	    } else {
	        if (sign_y > 0) {
	            on_ground = true;
	            can_homing = true;
	        }
	        vsp = 0;
	        break;
	    }
	}

	// === ANIMATION STATE MANAGEMENT ===
	if (!on_ground) {
	    if (!double_jump && vsp < 0) {
	        sprite_index = spr_dash_roll; // Double jump
	    } else if (vsp < 0) {
	        sprite_index = spr_dash_jumping;
	    } else if (vsp > 0) {
	        sprite_index = spr_dash_slamdown;
	    }
	} else if (abs(hsp) > 5) {
	    sprite_index = spr_dash_running;
	} else if (abs(hsp) < 5) && (abs(hsp) > 0.5) {
		sprite_index = spr_dash_walking;	
	} else {
	    sprite_index = spr_dash_idle;
	}

	if (hsp != 0) {
	    image_xscale = sign(hsp);
	}
}

if room == rm_create {
	if global.playtest == false {
		instance_change(obj_spawnlocation,true);
		view_visible[1] = false;
		view_visible[0] = true;
	}
	
	if keyboard_check_pressed(vk_control) {
		instance_destroy(obj_camera);
		instance_destroy(obj_hud);
		instance_create_depth(0, 0, -1, obj_cm_manager);
		instance_create_depth(0, 0, -1, obj_toolbar);
		global.playtestfin = true;
		global.playtest = false;
	}
	
	if gamepad_button_check_pressed(0, gp_start) {
		instance_destroy(obj_camera);
		instance_destroy(obj_hud);
		instance_create_depth(0, 0, -1, obj_cm_manager);
		instance_create_depth(0, 0, -1, obj_toolbar);
		global.playtestfin = true;
		global.playtest = false;
	}
}

function collision_at(_x, _y) {
	for (var i = 0; i < array_length(collision_list); i++) {
		if (instance_place(_x, _y, collision_list[i]) != noone) {
			return true;
		}
	}
	return false;
}