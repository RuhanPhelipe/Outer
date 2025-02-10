// Inherit the parent event
event_inherited();

// Setting the keys
var _left = keyboard_check(inputs.left);
var _right = keyboard_check(inputs.right);
var _up = keyboard_check(inputs.right);
var _down = keyboard_check(inputs.down);
var _jump = keyboard_check_pressed(inputs.jump);
var _attack = keyboard_check_pressed(inputs.attack);
var _dash = keyboard_check_pressed(inputs.dash);
var _pause = keyboard_check_pressed(inputs.pause);

global.life = life;

// Setting move
if(can_move){
	spd_h = (_right - _left) * spd_move;
}

#region State Machine
switch(state){
	
	#region IDLE
	case "IDLE":
	
		if(sprite_index != spr_player_idle) {
			sprite_index = spr_player_idle;
			image_index = 0;
		}
		
		if (_right || _left) state = "WALKING";
		else if (_jump || spd_v != 0) {
			state = "JUMPING";
			spd_v = (-spd_jump*_jump);
		}
		if (_attack) state = "ATTACKING";
		
		break;
	#endregion
	
	#region WALKING
	case "WALKING":
	
		if(sprite_index != spr_player_walk) {
			sprite_index = spr_player_walk;
			image_index = 0;
		}
		
		if (abs(spd_h) < .1) state = "IDLE";
		else if (_dash) state = "DASHING";
		else if (_jump || spd_v != 0) {
			state = "JUMPING";
			spd_v = (-spd_jump*_jump);
		}
		if (_attack) state = "ATTACKING";
		
		break;
	#endregion
	
	#region DASHING
	case "DASHING":
	
		if(sprite_index != spr_player_dash) {
			sprite_index = spr_player_dash;
			image_index = 0;
		}
		
		spd_h = sign(image_xscale) * spd_dash;
		
		if(image_index > image_number - 1) state = "WALKING";
		
		if (_jump || spd_v > 0) {
			state = "JUMPING";
			spd_v = (-spd_jump*_jump);
		}
		
		break;
	#endregion
	
	#region JUMPING
	case "JUMPING":
		
		if(spd_v < 0){
			sprite_index = spr_player_jump;
			image_index = 0;
		}else {
			//sprite_index = spr_player_fall;
			image_index = 3;
		}
		
		if(on_ground) state = "IDLE";
		if (_attack) state = "ATTACKING";
		
		break;
	#endregion
	
	#region ATTACKING
	case "ATTACKING":
	
		if (attack_type == "") {
		    if(on_ground) attack_type = "MELLE";
			else attack_type = "AOE";
		}
		
		attack(spr_player_attack, 1, 3);
	
		
		break;
	#endregion
	
	#region GETTING HIT
	case "HIT":
		
		if(sprite_index != spr_player_hurt) {
			sprite_index = spr_player_hurt;
			damageble = false;
			image_index = 0;
		}
		
		global.life = life;
		
		if (image_index > image_number-1) {
			damageble = true;
			state = "IDLE";
		}
		
		break;
	#endregion
	
}
#endregion

#region Auto-Damage System
if(keyboard_check_pressed(ord("K"))){
	
	life -= attack_pow;
	
}

if(place_meeting(x, y, obj_enemy) && damageble && state != "DASHING"){
	state = "HIT";
	life -= 0.5;
}
#endregion

#region Misc

if(keyboard_check_pressed(vk_f11)) window_set_fullscreen(!window_get_fullscreen());

if(keyboard_check_pressed(vk_tab)) global.show_tutorial = !global.show_tutorial;

#region Restart Room

if(keyboard_check_pressed(vk_backspace)) reset();

if(life <=  0) reset();

#endregion

if(_pause) game_end();

#endregion