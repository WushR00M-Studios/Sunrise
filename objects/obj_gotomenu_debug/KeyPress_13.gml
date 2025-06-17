switch(menu_index) {
    case 0:
        room_goto(rm_main_menu);
    case 1:
		room_goto(rm_settings);
	case 2:
		// not done
		break;
	case 3:
		// not done
		break;
	case 4:
		// not done
		break;
	case 5:
		instance_create_depth(x,y,-1,obj_debugmenu);
		instance_destroy();
}