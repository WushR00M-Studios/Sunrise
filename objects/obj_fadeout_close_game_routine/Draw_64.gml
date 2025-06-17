draw_self();
draw_set_halign(fa_center);
draw_set_font(Font7);
	if voice == 1
		draw_text(room_width / 2, room_height - 64, "Woohoo, goodbye I guess or something- I don't know, bye");
	else if voice == 2
		draw_text(room_width / 2, room_height - 64, "BAI BAI :3");
	else if voice == 3
		draw_text(room_width / 2, room_height - 64, "Awhh man...");
	else if voice == 4
		draw_text(room_width / 2, room_height - 64, "If anyone is listening, please send help. Wushy has me- oh you're not getting away that easy H4.");
	else if voice == 5
		draw_text(room_width / 2, room_height - 64, "DAAAYYYUUUUUMMM");
	else if voice == 6
		draw_text(room_width / 2, room_height - 64, "*totally epic music*");
	else if voice == 7
		draw_text(room_width / 2, room_height - 64, "Didj' I eva tell you about tha time Keith tried to deep fry a turkay? 3rd degree burns over 90% of his body, he-OOAOAAAAAA");
	else if voice == 8
		draw_sprite(spr_getaloadofthisdingus, 0, room_width / 2, room_height - 64);