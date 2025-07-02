var len = async_load[? "data_len"];

if (len > 0) {
    buffer_seek(audio_buffer, buffer_seek_start, 0);
    buffer_copy(async_load[? "buffer_id"], 0, len, audio_buffer, 0);

    var alpha = 0.001;

    for (var i = 0; i < len / 16; i++) {
        var us = abs(buffer_read(audio_buffer, buffer_s16));

        // Lowpass filter
		us = alpha * us + (1.0 - alpha) *  us_old;
        us_old = us;

		if muted == false
			microphone_volume = us;
		else
			microphone_volume = 0;
    }
}