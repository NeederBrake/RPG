event_inherited();
if ( is_undefined(my_current_hp)) my_current_hp = my_max_hp;


//--- WALK STATE
if ( state == CHARACTERS_STATES.WALK ) {
	//--- SETUP VARIABLES
	move_x = lengthdir_x(walk_speed, walk_direction);
	move_y = lengthdir_y(walk_speed, walk_direction);
	 
	//--- CHECK COLLISIONS
	if (place_meeting(x+move_x,y,obj_collision)) move_x=0;
	if (place_meeting(x,y+move_y,obj_collision)) move_y=0;
	
	//--- RETURN IDLE
	if (move_x == 0) and ( move_y == 0 ) {
		state=CHARACTERS_STATES.IDLE;
	}else{
		//--- MAKE MOVE
		x+=move_x;
		y+=move_y;
	}
}
	
	
//--- PLAYER IS DEAD
if ( obj_player.state == CHARACTERS_STATES.DEAD ) {
	if ( state == CHARACTERS_STATES.CHASE ) {
		state = CHARACTERS_STATES.IDLE;
	}
	exit ;
}


//--- GOTO CHASE STATE
if ( state == CHARACTERS_STATES.IDLE ) or ( state = CHARACTERS_STATES.WALK) {
	//--- PLAYER ENTER CHASE RADIUS
	if ( distance_to_object(obj_player) <= my_chase_radius ) {
		state = CHARACTERS_STATES.CHASE;
	}
}

//--- CHASE STATE ---//
if ( state == CHARACTERS_STATES.CHASE) {
	//--- SETUP DIRECTION
	chase_direction = point_direction( x , y , obj_player.x , obj_player.y );
	
	//--- SETUP MOVE
	move_x = lengthdir_x(my_chase_speed, chase_direction);
	move_y = lengthdir_y(my_chase_speed, chase_direction);
	
	//--- CHECK COLLISIONS
	if ( place_meeting ( x + move_x , y , obj_collision) ) move_x = 0;
	if ( place_meeting ( x , y + move_y , obj_collision) ) move_y = 0;
	
	//--- RETURN IDLE
	if (( move_x = 0 ) and ( move_y = 0 )) or ( distance_to_object(obj_player) > my_idle_radius){
		state=CHARACTERS_STATES.IDLE;
	} else {
		//--- MAKE MOVE
		x += move_x;
		y += move_y;
	}
	


}


//--- HIT THE PLAYER
if ( state != CHARACTERS_STATES.HIT ) and ( place_meeting ( x , y , obj_player ) ) {
	if ( obj_player != CHARACTERS_STATES.HIT ) {
		var _xx = x ;
		var _yy = y ;
		
		var _pv = hit_power;
		//--- PLAYER HIT BACK
		with ( obj_player ) {
			state = CHARACTERS_STATES.HIT ;
			hit_speed = _pv ;
			hit_direction = point_direction ( _xx , _yy , x , y );
			hit_alpha = 1 ;
			current_lives--;
		}
		
		//--- HIT BACK
		state = CHARACTERS_STATES.HIT;
		hit_speed= _pv;
		hit_direction = point_direction( obj_player.x , obj_player.y , x , y );
		
	}
}


//--- GO TO HIT STATE
if ( state != CHARACTERS_STATES.HIT ) and ( place_meeting( x, y, obj_hand_weapon) ) {
	state = CHARACTERS_STATES.HIT;
	
	my_current_hp--;
	if ( my_current_hp <= 0 ) instance_destroy();
	
	hit_direction = point_direction ( obj_player.x , obj_player.y , x , y );
	hit_speed = 3;
	hit_alpha = 1;
	
}

//--- HIT STATE ---//
if ( state == CHARACTERS_STATES.HIT ) {
	//--- SETUP MOVE
	move_x = lengthdir_x(hit_speed,hit_direction);
	move_y = lengthdir_y(hit_speed,hit_direction);
	
	//--- CHECK COLLISION
	if(place_meeting(x + move_x , y ,obj_collision ) ) move_x = 0 ;
	if(place_meeting(x , y + move_y ,obj_collision ) ) move_y = 0 ;
	
	//--- MAKE MOVE
	x += move_x;
	y += move_y;
	
	//--- DECREMENT HIT SPEED
	hit_speed -= .2;
	
	//--- GO TO CHASE STATE
	if ( hit_speed <= 0 ) {
		move_x = 0 ;
		move_y = 0 ;
		hit_speed = 0 ;
		state= CHARACTERS_STATES.CHASE ;
	}
	
}




