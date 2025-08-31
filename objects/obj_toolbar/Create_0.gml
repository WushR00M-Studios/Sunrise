window_set_caption("Sunrise Editor - New Level");

// Toolbar button labels and dropdown items
buttons = [
    {name:"File", items:["New Level", "Open Level", "Save Level", "Save Level as...", "Import", "Exit"]},
    {name:"Edit", items:["Undo", "Redo", "Cut", "Copy", "Paste"]},
    {name:"Level Options", items:["Set Name", "Playtest Level", "Publish Level"]},
];

// Button size and position
if os_type == os_windows
	button_width = 164;
else if os_type == os_android
	button_width = 148;
	
button_height = 24;
toolbar_height = 24;

// Dropdown state
active_button = -1; // no active dropdown
dropdown_height = 0; // current dropdown height (animated)
dropdown_target_height = 0; // target height (full height of dropdown)

// Animation speed in pixels per frame
anim_speed = 10;

button_color = make_color_rgb(15, 15, 15);
hover_color = make_color_rgb(30, 30, 30);
dropdown_color = make_color_rgb(40, 40, 40);

// Mouse state
mouse_over_button = -1;
mouse_over_item = -1;
mouse_left_prev = false;

controller_active = false;
controller_button_index = 0;
controller_item_index = 0;
controller_gamepad = 0; // gamepad 0 by default

global.controllertoolbar = false;

global.autosave_name = noone;
autosave_time = 7200; // 2 minutes
do_autosave = false;

download = noone;

savedyet = false;