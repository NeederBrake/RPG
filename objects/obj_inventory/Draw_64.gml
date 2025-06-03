



//---INVENTORY MODE
//GUI = GAME USER INTERFACE
if(inventory_mode)
{
	//---GENERAL VARS
	var _spr = spr_gui_box;
	var _offset = 48 ;
	var _cs = sprite_get_width(spr_gui_cells);
	var _border = 12;
	
	//-- INVENTORY VARS
	var _cx = inventory.inv_x;
	var _cy = inventory.inv_y;
	
	var _iw = (2 * _offset ) + ( _cx  * ( _cs + _border )) - _border ;
	var _ih = (2 * _offset ) + ( _cy  * ( _cs + _border )) - _border ;
	
	
	var _ix= display_get_gui_width() /2 - _iw/2;
	var _iy= display_get_gui_height() /2 - _ih/2;


	



}
//---FIN INVENTORY MODE

