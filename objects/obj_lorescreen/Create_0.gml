// Pages of text
text_pages = [
    "TARGET NEUTRALIZED.\nCONNECTION ESTABLISHED.",
    "YOU MUST COMPLY WITH ALL THAT IS STATED HERE\nOR DAMAGE TO DEVICE MAY OCCUR.",
    "VERY WELL THEN.\nWHAT DO YOU KNOW ABOUT THIS GAME?",
    "WHAT YOU KNOW ALREADY IS FALSE. COMPLETELY FALSE.",
    "THINGS ARE NOT WHAT THEY SEEM AND YOU.\nYOU ARE IN DANGER.",
    "ARE YOU SURE YOU KNOW EVERYTHING?",
    "BECAUSE, TRUST ME, YOU WILL KNOW EVERYTHING, SOON",
    "YOSDGU    __HAV_E T_O HURR  Y,+ NO_-=W. BE{}FO{}@$$RE I%(#$)T'S %$TOO L  ATE&*.",
	"CONNECTION WITH HIGHER PRIORITY ESTABLISHED\nTERMINATE MISSION."
];

text_index = 0;
current_page = 0;
typewriter_speed = 2;
typewriter_timer = 0;
page_timer = 0;
page_duration = room_speed * 5; // optional delay for pages before Page 9

final_page = 8; // Index of Page 9
sequence_finished = false;

audio_stop_all();
audio_play_sound(snd_deadair_loop, 0, true, 1.5);
audio_play_sound(snd_static_loop, 0, true, 0.5);

window_set_fullscreen(true);