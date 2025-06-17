x = lerp(x, room_width, 0.1);

if (start_slideback == true)
{
	start_slideback = false;
	alarm_set(0,300);
}

if slideback == true {
	x = lerp(x, room_width + 1000, 0.1);
}