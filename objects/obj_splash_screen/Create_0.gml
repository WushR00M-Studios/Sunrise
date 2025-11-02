hasplayed = false;

ini_open("options.ini");
enable = ini_read_real("options", global.opt_videopb, 0);
ini_close();

audio_play_sound(snd_logobump, 0, false, 0);