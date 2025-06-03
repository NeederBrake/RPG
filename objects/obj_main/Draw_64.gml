var _offset = 16;
var _spr = spr_coin_gui;
var _scale = 4 ;
var _ww = sprite_get_width (_spr) * _scale;
var _hh = sprite_get_height(_spr) * _scale;

var _startX = display_get_gui_width() - _offset -  _ww;
var _startY = _offset;

draw_sprite_ext( _spr , 0 , _startX , _startY , _scale , _scale , 0 , -1 ,1 );


var _border = 12 ;
var _xx = _startX - _border;
var _yy = _startY + _hh / 2;

draw_set_halign(fa_right);
draw_set_valign(fa_middle);
draw_set_font( fnt_coin_gui );
draw_set_color( c_white );




draw_text( _xx , _yy , coins ) ;