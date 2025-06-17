/// show_dialog(text, btn1, btn2, two_buttons)
function show_dialog(_text, _btn1, _btn2, _two_buttons) {
	instance_create_depth(0,0,0,obj_dialog_controller);
    obj_dialog_controller.dialog_text = string_wrap(_text, (obj_dialog_controller.box_width - obj_dialog_controller.box_padding));
    obj_dialog_controller.button1_text = _btn1;
    obj_dialog_controller.button2_text = _btn2;
    obj_dialog_controller.button2_enabled = _two_buttons;
    obj_dialog_controller.show_buttons = true;
    obj_dialog_controller.dialog_result = "";

}