ready = false;
global.discord_active = false;

alarm[0] = room_speed * 5;

if (!np_initdiscord("1285814729398554634", true, np_steam_app_id_empty))
{
	show_error("We couldn't initialize Discord Rich Presence (NekoPresence)!", true);
}

state = "";
details = "";