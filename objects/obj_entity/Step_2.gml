/// @description Insert description here
// You can write your code in this editor

var _col =  instance_place(x + spd_h, y, obj_collision);

if(_col){
	if(spd_h > 0){
		x = _col.bbox_left + (x - bbox_right);
	}
	if(spd_h < 0){
		x = _col.bbox_right + (x - bbox_left);
	}
	spd_h = 0;
}

x += spd_h;

_col =  instance_place(x, y + spd_v, obj_collision);

if(_col){
	if(spd_v > 0){
		y = _col.bbox_top + (y - bbox_bottom);
	}
	if(spd_v < 0){
		y = _col.bbox_bottom + (y - bbox_top);
	}
	spd_v = 0;
}

y += spd_v;