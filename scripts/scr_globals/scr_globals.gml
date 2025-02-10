// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

#macro GRAVITY .5

global.max_life = 3;


function draw_state(_state_text) {
	if(show_state){
		draw_flush();
		draw_self();

		draw_set_valign(fa_middle);
		draw_set_halign(fa_center);
		
		draw_text(x, y - (sprite_height*1.15), _state_text);


		draw_set_valign(-1);
		draw_set_halign(-1);
	}
}

function reset(){
	room_restart();
	global.life = global.max_life;
}


if(ev_game_start){
	global.life = global.max_life;
	global.show_tutorial = true;
}



