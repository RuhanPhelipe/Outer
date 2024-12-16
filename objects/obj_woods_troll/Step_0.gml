/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

#region State Machine

switch(state) {
	
	#region IDLE
	case "IDLE":
		
		if(sprite_index != spr_woods_troll_idle){
			sprite_index = spr_woods_troll_idle;		
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
		
		if(can_attack && image_index > 5 && image_index < 7){
			var _dmg = instance_create_layer(x + (attack_range*sign(image_xscale)), y, layer, obj_dmg);
			_dmg.sprite_index = spr_dmg_melee;
			_dmg.parent = id;
			_dmg.dmg_ammount = attack_pow;
			can_attack = false;
		}
		
		if(image_index > image_number - 1) {
			state = "IDLE";
			can_attack = true;
		}
		
		break;
	#endregion

	#region GETTING HIT
	case "HIT":
	
		if(sprite_index != spr_enemy_hurt) {
			sprite_index = spr_enemy_hurt;
			image_index = 0;
		}
		
		damageble = false;
		
		if (life <= 0) instance_destroy();
		
		if (image_index > image_number-1) {
			damageble = true;
			state = "IDLE";
		}
		
		break;
	#endregion
}

#endregion