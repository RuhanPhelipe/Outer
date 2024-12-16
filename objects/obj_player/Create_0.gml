/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

cam = instance_create_layer(x, y, layer, obj_camera);
cam.target = id;

show_state = true;

damageble = true;

max_life = global.max_life;
life = global.life;

//attack_pow = 6;

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