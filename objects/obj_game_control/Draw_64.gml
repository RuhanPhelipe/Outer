/// @description Insert description here
// You can write your code in this editor


var _sprite_width = sprite_get_width(spr_life);

for(var _i = 0; _i < global.life; _i++){
	draw_life(position + (_sprite_width*scale)*_i + 10*_i, position);
}