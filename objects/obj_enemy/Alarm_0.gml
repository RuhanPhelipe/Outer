/// @description Insert description here
// You can write your code in this editor

next_angle = irandom_range(0, 359);
next_time = game_get_speed(gamespeed_fps) * random_range(1, 9);

alarm_set(0, next_time);