// Movement
hsp = 0;
vsp = 0;
grv = 0.4;
walk_accel = 0.25;
walk_decel = 0.25;
walk_max = 7;
dust_timer = 0;

// Jump
jump_strength = -15;
double_jump = true;
was_on_ground = false;

// Homing
homing_range = 250;
homing_speed = 10;
can_homing = true;
homing_attack_active = false;

// Laser
laser_cooldown = 10;
laser_timer = 0;

// Ground check
on_ground = false;

// Collision objects list
collision_list = [
    obj_solid_block,
    obj_autoterrain,
];

global.bits = 0;
global.skps = 0;
global.myscore = 0;

global.combo = 0;
global.myhealth = 1;

global.lvlrank = "S++";