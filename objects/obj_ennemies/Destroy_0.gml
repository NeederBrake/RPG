
//--- CREATE FX SMOKE
var _smoke = instance_create_depth( x ,y , depth , obj_smoke_1 );


//--- DROP COINS
if ( !is_undefined(my_coins_drop)) {
	repeat (my_coins_drop ) {
		var _xx = random_range ( -4, 4 ) ;
		var _yy = random_range ( -4 , 4 ) ;
		
		instance_create_layer (x +_xx, y + _yy , "i_main" , obj_coin_1 ) ;
		
		
	}
}
