/// @description Insert description here
// You can write your code in this editor

scale = 3;
position = 48;

draw_life = function(_x, _y, _image_index) {
	draw_sprite_ext(spr_life, _image_index, _x, _y, scale, scale, 0, c_white, 1);
}