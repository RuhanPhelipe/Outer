/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

target = collision_circle(x, y, vision_range, obj_player, 0,1);

if(target != noone && state != "ATTACKING" && state != "HIT") {
	image_xscale = sign(x-target.x)*-1;
	
	is_patrolling = false;
	got_aggro = true;
	
	state = "CHASING";
}

if (life <= 0) state = "DEAD";