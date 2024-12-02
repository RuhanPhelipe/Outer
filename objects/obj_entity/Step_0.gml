/// @description Insert description here
// You can write your code in this editor

// Setting flags
on_ground = place_meeting(x, y + 1, obj_collision);

// Setting Gravity
if(!on_ground) {
	spd_v += GRAVITY * mass;
}