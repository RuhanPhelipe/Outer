// Setting the keys
var _left = keyboard_check(inputs.left);
var _right = keyboard_check(inputs.right);
var _up = keyboard_check(inputs.right);
var _down = keyboard_check(inputs.down);
var _jump = keyboard_check_pressed(inputs.jump);
var _attack = keyboard_check_pressed(inputs.attack);
var _dash = keyboard_check_pressed(inputs.dash);

// Setting move
if(_dash){
	spd_h = (_right - _left) * spd_dash;
} else {
	spd_h = (_right - _left) * spd_player;
}

// Jump System
var _on_ground = place_meeting(x, y + 1, obj_collision);

if(_on_ground){
	sprite_index = spr_player_idle;
	if(_jump){
		spd_v = -spd_jump;
	}
}else{
	sprite_index = spr_player_jump;
	spd_v += grav;
}

// Inverting the Sprite direction
if(spd_h != 0){
	image_xscale = sign(spd_h);
}

// Attack system - Conflicts with the other sprites
if(_attack){
	sprite_index = spr_player_attack;
	var _direc = image_xscale*attack_range;
	if(place_meeting(x+(_direc), y, obj_enemies)){
		obj_enemies.sprite_index = spr_enemies_hurt;
	}
}