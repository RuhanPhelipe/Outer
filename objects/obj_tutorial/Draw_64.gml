/// @description Insert description here
// You can write your code in this editor

if(global.show_tutorial){
	draw_rectangle_color(x, y, x+200, y+5*11+(10*10), c_dkgrey, c_dkgrey, c_dkgrey, c_dkgrey, 0);
	draw_text(x, y, "LEFT - A");
	draw_text(x, y+5*1+(10*1), "RIGHT - D");
	draw_text(x, y+5*2+(10*2), "JUMP - SPACE");
	draw_text(x, y+5*3+(10*3), "ATTACK - ENTER");
	draw_text(x, y+5*4+(10*4), "DASH - CTRL");
	draw_text(x, y+5*5+(10*5), "SELF DAMAGE - K");
	draw_text(x, y+5*6+(10*6), "RESTART - BACKSPACE");
	draw_text(x, y+5*7+(10*7), "FULLSCREEN - F11");
	draw_text(x, y+5*8+(10*8), "SHOW CONTROLS - TAB");
	draw_text(x, y+5*9+(10*9), "EXIT - ESC");
}