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

// Setting move
if(can_move){
	spd_h = (_right - _left) * spd_player;
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
			sprite_index = spr_player_fall;
			image_index = 0;
		}
		
		if(on_ground) state = "IDLE";
		if (_attack) state = "ATTACKING";
		
		break;
	#endregion
	
	#region ATTACKING
	case "ATTACKING":
	
		if(sprite_index != spr_player_attack) {
			sprite_index = spr_player_attack;
			image_index = 0;
		}
		
		var _dmg;
		
		if(can_attack && on_ground && image_index == 0){
			_dmg = instance_create_layer(x+sprite_width, y, layer, obj_dmg);
			_dmg.sprite_index = spr_dmg_melee;
			_dmg.parent = id;
			_dmg.dmg_ammount = attack_pow;
			can_attack = false;
		} else {
			if(can_attack && on_ground) {
				_dmg = instance_create_layer(x, y, layer, obj_dmg);
				_dmg.sprite_index = spr_dmg_aoe;
				_dmg.parent = id;
				_dmg.dmg_ammount = attack_pow + (mass*.25);
				can_attack = false;
			}
		}		
		
		if(image_index > image_number-1  && !can_attack) {
			state = "IDLE";
			can_attack = true;
		}
		
		break;
	#endregion
	
	#region GETTING HIT
	case "HIT":
		
		if(sprite_index != spr_player_hurt) {
			sprite_index = spr_player_hurt;
			image_index = 0;
		}
		
		global.life = life;		
		damageble = false;
		
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
	
	global.life -= attack_pow;
	
}
#endregion

#region Misc

if(keyboard_check_pressed(vk_f11)) window_set_fullscreen(!window_get_fullscreen());

#region Restart Room

if(keyboard_check_pressed(vk_backspace)) reset();

if(global.life <=  0) reset();

#endregion

if(_pause) game_end();

#endregion