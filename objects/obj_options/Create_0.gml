if !gamepad_is_connected(0) {
	layer_destroy("Instances_1");
	layer_destroy("tabs");
} else {
	instance_deactivate_layer("Instances_1");	
}


// Scroll variables
scroll_y = 0;
scroll_speed = 40;

// Fonts (replace with your actual font resource names)
font_header = Font4;
font_normal = Font7;

// Mouse tracking
hovered_item = -1;

// Options data
options = [];
item_rects = [];
description_text = "";
description = "";

selected_index = 0;           // Tracks gamepad focus
gamepad_id = 0;               // Default to gamepad 0
gamepad_cooldown = 0;         // Delay between gamepad inputs

// Visual config
line_height = 36;
header_height = 48;
padding_x = 48;
scroll_area_height = 400; // Adjust as needed
menu_top = 64;

// Build options list
array_push(options, { type: "header", name: "Video & Audio" });
array_push(options, make_toggle("Photosensitive Mode", "Disables or smooths most flashing lights", false));
array_push(options, make_toggle("Fullscreen Mode", "Enables or disables Windowed Mode", false));
array_push(options, make_slider("Master Volume", "Volume of the whole Game", 0, 100, 100));

array_push(options, { type: "header", name: "Gameplay" });
array_push(options, make_toggle("Cinematic Bars", "Cinematic Bars to make cutscenes more dramatic", false));
array_push(options, make_toggle("Camera Shake", "Recommended for normal play, is disabled if photosenstive mode is on", true));
array_push(options, make_toggle("Lighting (beta)", "Sunrise's lighting engine in beta, can be disabled at will.", false));

array_push(options, { type: "header", name: "System" });
array_push(options, make_button("Credits", "See who made this amazing game!", function() { room_goto(rm_credits); }));
array_push(options, make_button("Datapacks", "This feature is coming soon, check back later!", function() { /* No action yet */ }));

update_item_rects();
// === Load options from ini ===
ini_open("options.ini");
for (var i = 0; i < array_length(options); i++) {
    var opt = options[i];
    if (opt.type == "toggle") {
        if (ini_key_exists("options", opt.id)) {
            var val = ini_read_real("options", opt.id, opt.value ? 1 : 0);
            opt.value = (val == 1);
            options[i] = opt;
        }
    } else if (opt.type == "dropdown") {
        if (ini_key_exists("options", opt.id)) {
            var val = ini_read_real("options", opt.id, opt.selected);
            val = clamp(val, 0, array_length(opt.choices) - 1);
            opt.selected = val;
            options[i] = opt;
        }
    } else if (opt.type == "slider") {
        if (ini_key_exists("options", opt.id)) {
            var val = ini_read_real("options", opt.id, opt.value);
            val = clamp(val, opt.min, opt.max);
            opt.value = val;
            options[i] = opt;
        }
    }
}
ini_close();

// Helper functions to create option entries
function make_toggle(name, desc, default_val) {
    return {
        type: "toggle",
        name: name,
        desc: desc,
        value: default_val,
        id: string(name) + "_" + string(array_length(options))
    };
}

function make_dropdown(name, desc, choices, default_index) {
    return {
        type: "dropdown",
        name: name,
        desc: desc,
        choices: choices,
        selected: default_index,
        open: false,
        id: string(name) + "_" + string(array_length(options))
    };
}

function make_slider(name, desc, min_val, max_val, default_val) {
    return {
        type: "slider",
        name: name,
        desc: desc,
        min: min_val,
        max: max_val,
        value: default_val,
        id: string(name) + "_" + string(array_length(options))
    };
}

function make_button(name, desc, action) {
    return {
        type: "button",
        name: name,
        desc: desc,
        action: action,
        id: string(name) + "_" + string(array_length(options))
    };
}

function update_item_rects() {
    item_rects = [];
    var cur_y = menu_top - scroll_y;
    for (var i = 0; i < array_length(options); i++) {
        var item = options[i];
        var h = (item.type == "header") ? header_height : line_height;
        var rect = {
            x: padding_x,
            y: cur_y,
            w: room_width - padding_x * 2,
            h: h
        };
        array_push(item_rects, rect);
        cur_y += h;
    }
    // Recalculate max scroll height
    max_scroll = max(0, cur_y - menu_top - scroll_area_height);
}

// Special: Enforce Camera Shake disable if Photosensitive Mode ON
for (var j = 0; j < array_length(options); j++) {
    if (options[j].name == "Camera Shake") {
        var camShake = options[j];
        var photosensitive = false;
        for (var k = 0; k < array_length(options); k++) {
            if (options[k].name == "Photosensitive Mode") {
                photosensitive = options[k].value;
                break;
            }
        }
        camShake.value = !photosensitive;
        options[j] = camShake;
    }
}
