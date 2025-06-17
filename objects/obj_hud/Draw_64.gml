// obj_hud - Draw GUI Event

var pad = 32;
var scrw = view_hport[0];
var scrh = view_hport[0];

// ========== FONTS & COLORS ==========
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_alpha(1);
draw_set_font(Font4);

// ========== TOP LEFT: Bits, Skill Points, Score ==========
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_set_color(c_white);

var icon_size = 28;
var icon_spacing = 3;
var line_spacing = 12;
var icon_x = pad + icon_size div 2;
var icon_y = pad + icon_size div 2;

// Row 1: Bits
draw_sprite(spr_hud_icon_bits, 0, icon_x, icon_y);
draw_text(icon_x + icon_size + icon_spacing, icon_y, string(global.bits));

// Row 2: Skill Points
icon_y += icon_size + line_spacing;
draw_sprite(spr_hud_icon_skillpoints, 0, icon_x, icon_y);
draw_text(icon_x + icon_size + icon_spacing, icon_y, string(global.skps));

// Row 3: Score
icon_y += icon_size + line_spacing;
draw_sprite(spr_hud_icon_score, 0, icon_x, icon_y);
draw_text(icon_x + icon_size + icon_spacing, icon_y, string(global.myscore));


// ========== TOP RIGHT: Combo ==========
draw_set_halign(fa_right);
draw_set_font(Font4);
var txt_top_right = "Combo: " + string(global.combo);
draw_text(scrw - pad, pad, txt_top_right);

// ========== BOTTOM LEFT: Item Slots + Health Bar ==========
draw_set_halign(fa_left);
draw_set_valign(fa_bottom);
draw_set_font(Font7);

// Draw health bar (below item slots)
var health_bar_w = 25 * 5;
var health_bar_h = 16;
var myhealth = clamp(global.myhealth, 0, 1); // Expected to be 0.0 to 1.0
var bar_x1 = pad;
var bar_y1 = scrh - pad - health_bar_h;
var bar_x2 = bar_x1 + health_bar_w;

// Interpolated health color from blue to dark gray
var col_health = merge_color(c_dkgray, c_blue, myhealth);
draw_set_color(c_black);
draw_rectangle(bar_x1, bar_y1, bar_x2, bar_y1 + health_bar_h, false); // border
draw_set_color(col_health);
draw_rectangle(bar_x1 + 1, bar_y1 + 1, bar_x1 + (health_bar_w - 2) * myhealth, bar_y1 + health_bar_h - 1, false);

// ========== BOTTOM RIGHT: Level Rank ==========
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);
draw_set_font(Font4_big);

draw_set_color(c_white);
draw_text(scrw - pad, scrh - pad, string(global.lvlrank));
