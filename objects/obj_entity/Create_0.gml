/// @description Insert description here
// You can write your code in this editor

state = "IDLE";
show_state = true;
state_text = "";

spawn = [x, y];

damageble = false;
on_ground = true;
can_attack = true;
can_move = true;

max_life = 1;
life = max_life;

spd_v = 0;
spd_h = 0;

spd_move = 5;
spd_dash = 10;
spd_jump = 8;

mass = 1;

attack_range = sprite_width;
attack_pow = 1;
attack_type = "";

delay = 0;

///@method attack
///@arg {Asset.GMSprite} _sprite_index The attack sprite
///@arg {Real} _image_index_min The moment the damage will be instanced
///@arg {Real} _image_index_max The moment the damage will be destroyed
///@arg {Real} _x_origin The x position the object will be created at
///@arg {Real} _y_origin The y position the object will be created at
///@arg {Real} _attack_pow The damage ammount the attack will deal
///@arg {Real} _mass The entity mass
function attack(_sprite_index, _image_index_min, _image_index_max, _x_origin = attack_range, _y_origin = 0, _attack_pow = attack_pow, _mass = mass){
	if(sprite_index != _sprite_index) {
		sprite_index = _sprite_index;
		image_index = 0;
	}
	
	if (can_attack) {
		var _dmg;
	    switch(attack_type){
			case "MELLE":
				if(image_index > _image_index_min && image_index < _image_index_max){
					_dmg = instance_create_layer(x+(_x_origin*sign(image_xscale)), y + _y_origin, layer, obj_dmg);
					_dmg.sprite_index = spr_dmg;
					_dmg.parent = id;
					_dmg.image_xscale = sprite_width/64;
					_dmg.image_yscale = sprite_height/64;
					_dmg.dmg_ammount = _attack_pow;
					can_attack = false;
				}
			break;
			
			case "AOE":
				if(spd_v != 0){
					if(on_ground) {
						_dmg = instance_create_layer(x, y, layer, obj_dmg);
						_dmg.sprite_index = spr_dmg;
						_dmg.parent = id;
						_dmg.image_xscale = 2.5;
						_dmg.image_yscale = .2;
						_dmg.dmg_ammount = _attack_pow + (mass*.25);
						can_attack = false;
					}
				}
				break;
		}
	}
		
	if(image_index > image_number-1  && !can_attack) {
		state = "IDLE";
		attack_type = "";
		can_attack = true;
	}
}