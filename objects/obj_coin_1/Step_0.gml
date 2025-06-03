
//--- START ANIMATION
if ( !animation_end ) {
	
	//--- MOVE UP
	if ( move_y < 0 ) move_y += move_gravity ;
	
	//--- MOVE DOWN
	else if ( y < ystart ) move_y += move_gravity;
	
	//--- MOVE STOP
	else {
		animation_end = true ;
	}
	
	move_x = lerp(move_x , 0 , .05);
} else {
	move_x = 0 ; 
	move_y = 0 ;
}

//--- PLAYER ATTRACTION
if ( animation_end ) {
	max_speed = 4 ;
	
	//--- PLAYER IS NEAR
	if (distance_to_object ( obj_player ) <=16 ) {
		
		//--- INCREMENT ATTRACT SPEED
		attract_speed += attract_incr ;
		if ( attract_speed < max_speed ) attract_speed = max_speed ;
		
		//--- SETUP DIRECTION AND MOVE
		var _dir = point_direction(x , y , obj_player.x , obj_player.y );
		
		move_x = lengthdir_x ( attract_speed , _dir ) ;
		move_y = lengthdir_y ( attract_speed , _dir ) ;
	
		//-- COLLECT THE COIN
		if ( distance_to_object(obj_player) <= 2 ) {
			instance_destroy() ;
			coins++;
		}
		
		
	}

}




//--- MAKE MOVE
x += move_x ;
y += move_y ;
