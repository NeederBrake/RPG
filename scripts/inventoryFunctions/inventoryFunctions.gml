// F1 pour la doc

//--- ITEMS STRUCTS ---//
enum ITEM_TYPES { EQUIPEMENT , CONSOMABLE ,
				  MELEE , DIST , MAGIC , HEAL , BUFF,
				  WOOD_AXE}


function item() constructor {
	name = "";
	
	icon_sprite = undefined ;
	hand_sprite = undefined ;
	
	type1 = undefined ;
	type2 = undefined ;
	type3 = undefined ;
	
	stack = true ;
}

//--- STORAGE STRUCT ---//
function storage( cellX , cellY) constructor {

	inv_x = cellX;
	inv_y = cellY;
	
	items = array_create(inv_x * inv_y,-1);

	quantity = array_create(inv_x * inv_y);
}



// --- INVENTORY FUNCTIONS
function draw_inventory( inv, posX, posY, width , height)
{
	var _inv = inv ;
	var _ix = posX ;
	var _iy = posY;
	var _iw = width ;
	var _ih = height ;
	
	
	draw_sprite_stretched(_spr,0,_ix,_iy,_iw,_ih);
	
	var _x1 = _ix + _offset;
	var _y1 = _iy + _offset;
	
	//-- FOR EACH CELLS
	for ( var i = 0; i< array_length(inventory.items); i++) {
		//-- CELLS LOCATION
		var _line = i div inventory.inv_x;
		
		
		var _xx = _x1 + i * ( _cs + _border ) - ( _line * inventory.inv_x * ( _cs + _border ));
		var _yy = _y1 + _line * ( _cs + _border ) ;
		draw_sprite(spr_gui_cells,0,_xx,_yy);
		
	}
	
	
}



