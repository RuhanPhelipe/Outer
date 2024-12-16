/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

var _player = collision_circle(x, y, vison_range*1.5, obj_player, 0,1);

if (_player && state == "IDLE" || state = "WALKING"){
	image_xscale = sign(x-_player.x)*-1;
}

function _attack_player() {
	var _player = collision_rectangle(x, y - (sprite_height/4.5), x + (vison_range*sign(image_xscale)), y - (sprite_height/1.25), obj_player, 0, 1);
	
	if(_player){
		state = "ATTACKING";
	}
}
/*
#region State Machine


switch(state) {
	
	#region IDLE
	case "IDLE":
		
		if(sprite_index != spr_enemy_idle){
			sprite_index = spr_enemy_idle;		
			image_index = 0;
		}		
		
		_attack_player()
		
		break;
	#endregion
	
	#region WALKING
	case "WALKING":
		break;
	#endregion
	
	#region JUMPING
	case "JUMPING":
		break;
	#endregion
	
	#region ATTACKING
	case "ATTACKING":
		
		if(sprite_index != spr_enemy_attack) {
			sprite_index = spr_enemy_attack;
			image_index = 0;
		}
		
		if(can_attack){
			var _dmg = instance_create_layer(x+sprite_width, y, layer, obj_dmg);
			_dmg.sprite_index = spr_dmg_melee;
			_dmg.parent = id;
			_dmg.dmg_ammount = attack_pow;
			can_attack = false;
		}
		
		if(image_index > image_number - 1) {
			state = "IDLE";
			can_attack = true
		}
		
		break;
	#endregion

	#region GETTING HIT
	case "HIT":
		sprite_index = spr_enemy_hurt;
		
		damageble = false;
		
		if (life <= 0) instance_destroy();
		
		if (image_index > image_number-1) {
			damageble = true;
			state = "IDLE";
		}
		
		break;
	#endregion
}

#endregion*/