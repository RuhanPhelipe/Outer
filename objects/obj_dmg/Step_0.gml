/// @description Insert description here
// You can write your code in this editor

var _entity = instance_place(x, y, obj_entity);

if (_entity && _entity.id != parent && _entity.damageble) {
	if(object_get_parent(_entity.object_index) != object_get_parent(parent.object_index)){
		_entity.state = "HIT";
		_entity.life -= dmg_ammount;
		instance_destroy();
	}
} 

if (image_index > image_number - 1) instance_destroy();