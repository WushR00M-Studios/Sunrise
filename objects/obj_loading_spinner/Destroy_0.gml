draw_set_alpha(1);
var _perm_vibrate = "android.permission.VIBRATE";
if !(os_check_permission(_perm_vibrate))
    os_request_permission(_perm_vibrate);