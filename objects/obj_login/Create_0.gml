accounts = [];

ini_open("user.ini");
var count = ini_read_string("Meta", "AccountCount", "0");

for (var i = 0; i < real(count); i++) {
    var name = ini_read_string("Account" + string(i), "Name", "Corrupted Data");
    var pin = ini_read_string("Account" + string(i), "PIN", "");
    array_push(accounts, { name: name, sprite: spr_default_profile_picture, pin: pin });
}
ini_close();

array_push(accounts, { name: "Guest", sprite: spr_default_profile_picture, pin: "" });
array_push(accounts, { name: "Add New", sprite: spr_accounts_add_icon, pin: "" });

selected_index = 0;
target_scroll = 0;
current_scroll = 0;
spacing = 220;
item_width = 160;
item_height = 160;
hovered_index = -1;

input_mode = "none"; // none, new_name, new_pin, login_pin
input_text = "";
input_index = -1;

function string_digits(str) {
    for (var i = 1; i <= string_length(str); i++) {
        var c = string_char_at(str, i);
        if (c < "0" || c > "9") return false;
    }
    return true;
}

function save_accounts() {
    ini_open("user.ini");
    var real_count = array_length(accounts) - 2;
    ini_write_string("Meta", "AccountCount", string(real_count));

    for (var i = 0; i < real_count; i++) {
        ini_write_string("Account" + string(i), "Name", accounts[i].name);
        ini_write_string("Account" + string(i), "PIN", accounts[i].pin);
    }

    ini_close();
}

function is_duplicate_username(name) {
    for (var i = 0; i < array_length(accounts); i++) {
        if (accounts[i].name == name) {
            return true;
        }
    }
    return false;
}