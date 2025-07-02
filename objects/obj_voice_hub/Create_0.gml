shown = false;
microphone_configured = false;
talking = false;
microphone_volume = 0;
us_old = -1;
muted = true;

sensitivity = 25;

// Begin audio recording and create buffer
if (audio_get_recorder_count() == 1) {
    microphone_configured = false;
} else {
	microphone_configured = true;
	audio_record = audio_start_recording(1);
	audio_buffer_size = 16384; // 4800 * 2
	audio_buffer = buffer_create(audio_buffer_size, buffer_fixed, 2);
}