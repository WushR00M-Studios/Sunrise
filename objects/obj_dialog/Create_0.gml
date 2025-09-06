message_text   = "";
icon_sprite    = -1;
buttons        = [];
visible        = false;

// Sounds (assign in code or inspector)
snd_open       = snd_warning_msg;
snd_hover      = snd_highlight;
snd_select     = snd_select_yes;

hover_index    = -1;

bgfade		   = 0;

// Slide animation
target_x = -1;  // where we want it to go
draw_x   = -1;  // current X position (for animation)
state    = "idle"; // can be "idle", "opening", "open", "closing"
