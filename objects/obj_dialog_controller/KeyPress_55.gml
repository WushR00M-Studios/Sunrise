var test = get_string("Dialog Name", "");
var test2 = show_question("Yes for 1 Button, No for 2 Buttons");

if test2 == true {
	show_dialog(test, "Ok", "", false);	
} else if test2 == false {
	show_dialog(test, "Yes", "No", true);	
}