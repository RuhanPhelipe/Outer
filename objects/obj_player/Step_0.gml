// Setting the keys
var _left = keyboard_check(inputs.left);
var _right = keyboard_check(inputs.right);
var _up = keyboard_check(inputs.right);
var _down = keyboard_check(inputs.down);
var _jump = keyboard_check_pressed(inputs.jump);
var _attack = keyboard_check_pressed(inputs.attack);
var _dash = keyboard_check_pressed(inputs.dash);
var _pause = keyboard_check_pressed(inputs.pause);

// Setting move
spd_h = _dash ? (_right - _left) * spd_dash : (_right - _left) * spd_player;

#region Jump System

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

#endregion

// Inverting the Sprite direction
if(spd_h != 0){
	image_xscale = sign(spd_h);
}

#region Attack system
if(_attack){
	sprite_index = spr_player_attack;
	var _direc = image_xscale*attack_range;
	if(place_meeting(x+(_direc), y, obj_enemies)){
		obj_enemies.sprite_index = spr_enemies_hurt;
	}
	
	if((global.life - attack_pw) > 0){
		global.life -= attack_pw;
	} else{ 
		global.life = global.max_life;
		room_restart();		
	}
	
}

#endregion

if(keyboard_check_pressed(vk_f11)){
	window_set_fullscreen(!window_get_fullscreen());
}

if(_pause){
	game_end();
}
