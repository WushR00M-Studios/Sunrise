if muted == false {
	buffer_delete(audio_buffer);
	audio_stop_recording(audio_record);
}