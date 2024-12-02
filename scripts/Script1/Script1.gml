// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

#macro GRAVITY .5

global.max_life = 3;

if(ev_game_start){
	global.life = global.max_life;
}