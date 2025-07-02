if microphone_configured == true {
	if shown == true {
		x = lerp(x, view_wport[0] - 86, 0.05);
		
		if keyboard_check(vk_up) {
			sensitivity += 1;
		}
		
		if keyboard_check(vk_down) {
			if sensitivity != 0
				sensitivity -= 1;
		}
	} else if shown == false {
		x = lerp(x, view_wport[0] + 128, 0.05);
	}
	
	if muted == false {
		if microphone_volume > sensitivity {
			talking = true;
			sprite_index = spr_voice_unmuted_true;
		} else if microphone_volume < sensitivity {
			talking = false;
			sprite_index = spr_voice_unmuted_false;
		}
	} else if muted == true {
		sprite_index = spr_voice_muted;
	}
} else {
	sprite_index = spr_voice_disconnected;	
}