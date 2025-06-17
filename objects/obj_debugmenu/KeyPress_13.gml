switch(menu_index) {
    case 0:
        room_goto(rm_main_menu);
        break;
    case 1:
        game_restart();
        break;
	case 2:
		instance_create_depth(x,y,-1,obj_gotomenu_debug);
		instance_destroy();
		break;
	case 3:
		var verify = show_question("Very dangerous!! Proceed?");
		if verify = true {
			file_delete("user.ini");
			game_restart();
		} else { }
		break;
	case 4:
		game_end();
		break;
	case 5:
		show_message("not done yet");
}