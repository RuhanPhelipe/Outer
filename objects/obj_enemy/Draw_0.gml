/// @description Insert description here
// You can write your code in this editor

event_inherited();

//state_text = string_join("/", life, max_life);

state_text = state;

var _dir;

if(sign(image_xscale) < 0) _dir = 1;
else _dir = 0;

draw_healthbar(x - (sprite_width*0.45), y - (sprite_height*1.5), x + (sprite_width*0.45), y - (sprite_height*1.5)+5, (life/max_life)*100, c_black, c_red, c_green, _dir, 0, 0);
