if !gamepad_is_connected(0) {
	layer_destroy("Instances_1");
	layer_destroy("tabs");
} else {
	instance_deactivate_layer("Instances_1");	
}


// Scroll variables
scroll_target = 0;
scroll_y = 0;

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

if global.mobile {
	array_push(options, { type: "header", name: "Preferences" });
	array_push(options, make_toggle("Photosensitive Mode", "Disables or smooths most flashing lights", false));
	array_push(options, make_toggle("Haptics", "Certain actions vibrate your controller for short or long moments", false));
	array_push(options, make_toggle("Voice Chat", "Enables or disables Voice Chat", true));

	// array_push(options, { type: "header", name: "Online & Parental" });
	// array_push(options, make_toggle("Allow Online Access", "Allows or disallows connecting to Sunrise Online", true));
	// array_push(options, make_toggle("Allow Level Rating", "Allows or disallows the rating of user made content", true));
	// array_push(options, make_toggle("Allow Text Chat", "Allows or disallows sending and recieving text chat alongside voice chat", true));
	// array_push(options, make_toggle("Restricted Mode", "Hides and censors things like foul language, beware when disabling!", true));

	array_push(options, { type: "header", name: "System" });
	array_push(options, make_toggle("Autosaving", "Tick this off to disable autosaving story progress and create mode levels, but beware in the case of an unexpected shutdown!", true));
	array_push(options, make_button("Credits", "See who made this amazing game!", function() { }));
	array_push(options, make_button("Statistics", "See your statistics and information about the game!", function() { }));
	array_push(options, make_toggle("Telemetry", "Sends data about the specifications of your device for the sake of compatibility and optimization, no private data is collected!", false));
	array_push(options, make_toggle("Error Reporting", "Tick this off to disable sending error report data to WushR00M Studios", true));
} else {
	array_push(options, { type: "header", name: "Preferences" });
	array_push(options, make_toggle("Photosensitive Mode", "Disables or smooths most flashing lights", false));
	array_push(options, make_toggle("Fullscreen Mode", "Enables or disables Windowed Mode", false));
	array_push(options, make_toggle("Borderless Fullscreen", "Allows for fullscreen without needing to re-render anything", false));
	array_push(options, make_toggle("Typing Sounds", "Whenver a key is striked, a small tick sound will play if enabled", true));
	array_push(options, make_toggle("Haptics", "Certain actions vibrate your controller for short or long moments", false));
	array_push(options, make_toggle("Voice Chat", "Enables or disables Voice Chat", true));

	// array_push(options, { type: "header", name: "Online & Parental" });
	// array_push(options, make_toggle("Allow Online Access", "Allows or disallows connecting to Sunrise Online", true));
	// array_push(options, make_toggle("Allow Level Rating", "Allows or disallows the rating of user made content", true));
	// array_push(options, make_toggle("Allow Text Chat", "Allows or disallows sending and recieving text chat alongside voice chat", true));
	// array_push(options, make_toggle("Restricted Mode", "Hides and censors things like foul language, beware when disabling!", true));

	array_push(options, { type: "header", name: "System" });
	array_push(options, make_toggle("Autosaving", "Tick this off to disable autosaving story progress and create mode levels, but beware in the case of an unexpected shutdown!", true));
	array_push(options, make_toggle("Discord Rich Presence", "Enables the rich presence display on your Discord profile if Discord is detected open on your desktop", true));
	array_push(options, make_button("Credits", "See who made this amazing game!", function() { }));
	array_push(options, make_button("Statistics", "See your statistics and information about the game!", function() { }));
	array_push(options, make_button("Reset User Data", "Resets all game data and starts from the inital setup.", function() { }));
	array_push(options, make_toggle("Telemetry", "Sends data about the specifications of your device for the sake of compatibility and optimization, no private data is collected!", false));
	array_push(options, make_toggle("Error Reporting", "Tick this off to disable sending error report data to WushR00M Studios", true));
}
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
