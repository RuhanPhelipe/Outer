/// @description Insert description here
// You can write your code in this editor

var _left = keyboard_check(inputs.left);
var _right = keyboard_check(inputs.right);
var _up = keyboard_check(inputs.right);
var _down = keyboard_check(inputs.down);
var _jump = keyboard_check_pressed(inputs.jump);
var _attack = mouse_check_button_pressed(inputs.attack);

spd_h = (_right - _left) * spd_player;

var _on_ground = place_meeting(x, y + 1, obj_collision);

if(_on_ground){
	if(_jump){
		spd_v = -spd_jump;
	}
}else{
	spd_v += grav;
}


if(spd_h != 0){
	image_xscale = sign(spd_h);
}

if(_attack){
	sprite_index = spr_player_attack;
	var _direc = image_xscale*attack_range;
	show_debug_message(_direc);
	if(place_meeting(x+(_direc), y, obj_enemies)){
		obj_enemies.sprite_index = spr_enemies_hurt;
	}
}else{
	sprite_index = spr_player;
}