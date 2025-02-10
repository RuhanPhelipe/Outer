/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

damageble = true;

max_life = 5;
life = max_life;

spd_move = 2;

attack_pow = .5;
attack_range = sprite_width;

vision_range = sprite_width*4;

is_patrolling = true;
patrol_range = sprite_width*10;

chasing_distance = patrol_range/2;
got_aggro = false;
target = noone;