if global.ssenabled == "true" {
	x = lerp(x, global.screensavx, 0.05);
	y = lerp(y, global.screensavy, 0.05);
} else {
	x = x
	y = y
}