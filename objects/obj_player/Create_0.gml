/// @description Insert description here
// You can write your code in this editor

spd_v = 0;
spd_h = 0;

spd_player = 5;
spd_dash = 80;
spd_jump = 8;
grav = .5;

attack_range = 30;
attack_pw = 1;


inputs = {
	left: ord("A"),
	right: ord("D"),
	up: ord("W"),
	down: ord("S"),
	jump: vk_space,
	attack: vk_enter,
	dash: vk_control,
	pause: vk_escape,
}