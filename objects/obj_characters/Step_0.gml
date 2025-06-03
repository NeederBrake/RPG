if ( state = CHARACTERS_STATES.HIT ) {
	
	//---SETUP MOVE
	move_x = lengthdir_x(hit_speed,hit_direction);
	move_y = lengthdir_y(hit_speed,hit_direction);
	
	//--- CHECK COLLISIONS
	if (place_meeting(x + move_x , y , obj_collision ) ) move_x=0;
	if (place_meeting(x , y + move_y , obj_collision ) ) move_y=0;
	
	//--- MAKE MOVE
	x += move_x ;
	y += move_y ;
	
	//--- DECREMENT HIT SPEED
	hit_speed -= 0.2 ;
	
	//--- RETURN TO IDLE STATE
	if ( hit_speed <= 0 ) {
		state = CHARACTERS_STATES.IDLE;
	}
}


