var _inst = instance_place( x , y , obj_depth_affect);

if ( _inst ) {
	var _list = ds_list_create();
	var _col = instance_place_list( x , y , obj_depth_affect , _list , true);
	
	
	for ( var i = 0 ; i < _col ; i ++ ) {
		
		_list[|i].depth = layer_get_depth(my_layer) + 99 - _list[|i].bbox_bottom / 10;
	}
	
	ds_list_destroy(_list);
}