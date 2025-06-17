// Dialog content
dialog_text = "Testing Dialogs :3";
button1_text = "Yes";
button2_text = "No";
show_buttons = true;
button2_enabled = true;

// Layout config
box_width = 350;
box_height = 150;
box_padding = 16;
button_width = 100;
button_height = 32;

// Position
box_x = display_get_width() / 2 - box_width / 2;
box_y = display_get_height() / 2 - box_height / 2;

// Result
dialog_result = "";

// Animation state
anim_state = "in"; // "in", "idle", "out", "hidden"
anim_timer = 0;
anim_speed = 0.1;

// Final position
box_target_y = display_get_height() / 2 - box_height / 2;
box_y = -box_height; // Start offscreen at top

btn1_scale = 1.0;
btn2_scale = 1.0;
hover_scale = 1.1;
normal_scale = 1.0;
scale_speed = 0.2;

selected_button = 0; // 0 = button1, 1 = button2

spr_button = spr_ns_button;
spr_window = spr_ns_window;

global.button1_callback = noone; // no callback assigned by default
global.button2_callback = noone;