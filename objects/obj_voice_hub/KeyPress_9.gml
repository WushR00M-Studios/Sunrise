if microphone_configured == true
	shown = !shown;
else
	toast_create("FAILURE: Your microphone isn't being detected by Sunrise! Is it configured or connected properly?", 4);