//--- LIFES HEARTS

var _startX = 16 ;
var _startY = 16 ;
var _border = 4 ;


var _scale = 4 ;
var _spr = spr_life_heart ;
var _ww = sprite_get_width(_spr) * _scale;


for ( var i = 0 ; i < max_lives ; i++ ) {

	var _xx = _startX + ( i * _ww + _border ) ;
	
	
	if ( current_lives > i ) var _sub = 1 ;
	else var _sub = 0 ;
	
	
	draw_sprite_ext( _spr , _sub , _xx , _startY, 4 , 4, 0, -1 , 1 ) ;


}









