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
spd_h = _dash ? (_right - _left) * spd_dash : (_right - _left) * spd_player;


#region State Machine

switch(state){
	
	case IDLE:
		sprite_index = spr_player_idle;
		
		if (_right || _left){
			state = WALKING;
		} else if (_dash) {
			state = DASHING;
		} else if (_jump || spd_v != 0) {
			state = JUMPING;
			spd_v = -spd_jump;
		}
		
		if (_attack) {
			state = ATTACKING;
		}
		
		image_index = 0;
		break;
	
	case WALKING:
		sprite_index = spr_player_walk;
		
		if (abs(spd_h) < .1){
			state = IDLE;
		} else if (_dash) {
			state = DASHING;
		} else if (_jump || spd_v != 0) {
			state = JUMPING;
			spd_v = -spd_jump;
		}
		
		if (_attack) {
			state = ATTACKING;
		}
		
		image_index = 0
		break;
	
	case DASHING:
		sprite_index = spr_player_dash;
		
		if(image_index > image_number - 1) {
			state = WALKING
		}
		
		break;
	
	case JUMPING:
		
		if(spd_v < 0){
			sprite_index = spr_player_jump;
			image_index = 0;
		}else {
			sprite_index = spr_player_fall;
		}
		
		if(on_ground){
			state = IDLE;
		}
		
		if (_attack) {
			state = ATTACKING;
		}
		break;
	
	
	case ATTACKING:
		sprite_index = spr_player_attack;
		
		if(image_index > image_number-1 && on_ground){
			state = IDLE;
		}else if (image_index > image_number-1){
			state = JUMPING;
		}
		break;
	
}

#endregion
	
#region Attack system
if(_attack){
	sprite_index = spr_player_attack;
	
	instance_create_layer(x+sprite_width, y, layer, obj_dmg);
	
	
	if((global.life - attack_pw) > 0){
		global.life -= attack_pw;
	} else{ 
		
	}
	
}
	
#endregion

#region Restart Room

if(keyboard_check_pressed(vk_backspace)){
	global.life = global.max_life;
	room_restart();		
}
#endregion

if(keyboard_check_pressed(vk_f11)){
	window_set_fullscreen(!window_get_fullscreen());
}

if(_pause){
	game_end();
}


