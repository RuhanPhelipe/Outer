/// @description Insert description here
// You can write your code in this editor

#macro IDLE 1
#macro WALKING 2
#macro DASHING 3
#macro JUMPING 4
#macro FALLING 5
#macro ATTACKING 6

#macro HURT 7

state = IDLE;

on_ground = true;

max_life = 1;
life = max_life;

spd_v = 0;
spd_h = 0;

spd_player = 5;
spd_dash = 80;
spd_jump = 8;

mass = 1;

attack_range = 32;
attack_pw = 1;
