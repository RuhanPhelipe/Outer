/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

//if(is_patrolling) patrol();

#region State Machine

switch(state) {
	
	#region IDLE
	case "IDLE":
		
		if(sprite_index != spr_woods_troll_idle){
			sprite_index = spr_woods_troll_idle;		
			image_index = 0;
		}
		
		
		//state = choose("IDLE", "WALKING");
		
		break;
	#endregion
	
	#region WALKING
	case "WALKING":
		
		if(spd_h == 0) state = "IDLE";
		
		break;
	#endregion
	
	#region JUMPING
	case "JUMPING":
		break;
	#endregion
	
	#region CHASING
	case "CHASING":
		
		if(sprite_index != spr_woods_troll_chasing){
			sprite_index = spr_woods_troll_chasing;
			image_index = 0;
			image_xscale = sign(x-target.x)*-1;
			is_patrolling = false;
			got_aggro = true;
		}
	
		if(got_aggro){
			spd_h = image_xscale * spd_move;
			if(target == noone){
				spd_h = 0;
				is_patrolling = true;
				got_aggro = false;
	
				state = "IDLE";
			}else if(point_distance(x, y, target.x, target.y) < attack_range){
				spd_h = 0;
				state = "ATTACKING";
			}
			
		}
		break;
	#endregion
	
	#region ATTACKING
	case "ATTACKING":
	
		if(attack_type == ""){
			attack_type = choose("MELLE", "MELLE", "MELLE", "AOE");
			if(attack_type == "AOE") {
				spd_v = -spd_jump;
				if(!on_ground) attack(spr_woods_troll_melle_attack, 5, 7);
				break;
			}
		}
		
		attack(spr_woods_troll_melle_attack, 5, 7);

		
		break;
	#endregion

	#region GETTING HIT
	case "HIT":
	
		delay = game_get_speed(gamespeed_fps) * 2;
		
		spd_h = 0;
	
		if(sprite_index != spr_woods_troll_hurt) {
			sprite_index = spr_woods_troll_hurt;
			damageble = false;
			image_index = 0;
		}
		
		
		if (image_index > image_number-1) {
			damageble = true;
			state = "IDLE";
		}
		
		break;
	#endregion
	
	#region DEAD
	case "DEAD":
		instance_destroy();
		break;
	#endregion
}

#endregion

if(delay > 0) delay--;