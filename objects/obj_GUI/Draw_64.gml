/// @description Insert description here
// You can write your code in this editor


var _sprite_width = sprite_get_width(spr_life);
var _sprite_height = sprite_get_height(spr_life);

var _player_max_life = global.max_life;
var _player_life = global.life;
var _player_life_frac = frac(_player_life);
_player_life -= _player_life_frac;	

for(var _i = 1; _i <= _player_max_life; _i++){
	
	var _image_index = _i > _player_life;
	if(_i == _player_life+1){
		_image_index += _player_life_frac>0;
	}
	
	draw_sprite_ext(spr_life,
	_image_index,
	position + (_sprite_width*scale)*_i + 10*_i,
	position,
	scale, scale, 0, c_white, 1);
}