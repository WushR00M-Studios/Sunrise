// Draw GUI Event
draw_set_color(c_white);
draw_set_font(Font7);
draw_text(8, 8, "Party Members:");
for (var i = 0; i < array_length(global.party_list); i++) {
    draw_text(12, 32 + i * 20, "- " + global.party_list[i]);
}
