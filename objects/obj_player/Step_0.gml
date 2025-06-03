event_inherited();
//--- DEAD STATE ---//
if (state != CHARACTERS_STATES.DEAD ) and ( current_lives <= 0 ) {
	state = CHARACTERS_STATES.DEAD;
	frame_x = 0 ;
	frame_y = 0 ;
} else if ( state = CHARACTERS_STATES.DEAD ) { 
	exit ;
}





//----VARIABLES LOCALES----//




//---      INPUTS       ---//

// On récupère les inputs z,q,s,d ou les flèches
var _left  = keyboard_check( vk_left ) or keyboard_check(ord("Q")); // booléen
var _right = keyboard_check( vk_right) or keyboard_check(ord("D"));
var _up    = keyboard_check( vk_up   ) or keyboard_check(ord("Z"));
var _down  = keyboard_check( vk_down ) or keyboard_check(ord("S"));
//--- Action
input_action = keyboard_check_pressed(vk_space);

//---    MOUVEMENTS     ---//
// Variables générales de direction
// x -> horizontale
// y -> verticale
x_direction = _right - _left // -1 , 0 ou 1
y_direction = _down - _up

event_inherited();


//--- GO TO WALK STATE ---//
if ( state == CHARACTERS_STATES.IDLE)
{
	if (x_direction !=0 ) or (y_direction != 0)
	{
		state=CHARACTERS_STATES.WALK;
	}
}


//--- RETURN TO IDLE STATE
if ( state == CHARACTERS_STATES.WALK ) {
	if ( x_direction == 0 ) and ( y_direction == 0 ){
		state=CHARACTERS_STATES.IDLE;
	}
}



//--- WALK STATE ---//
if( state==CHARACTERS_STATES.WALK ) //si il y a des inputs
{	//Episode n°2 pour comprendre
	//Empêcher les mouvements + rapides en diagonale
	
	//Calcul de la direction
	move_direction = point_direction(x , y , x + x_direction , y + y_direction); //arguments : x1, y1, x2, y2
	
	//Calcul du ratio du mouvement
	move_x=lengthdir_x(move_speed,move_direction);
	move_y=lengthdir_y(move_speed,move_direction);
	
	//Check les collisions
	//arguments x , y , objets
	if ( place_meeting ( x + move_x, y , obj_collision) ) move_x = 0;
	if ( place_meeting ( x , y + move_y , obj_collision) ) move_y = 0;
	
	
	if( (move_x != 0 ) or (move_y!=0) )
	{	// Déplacement du PLAYER
		x += move_x;
		y += move_y;
	} else if ( move_x == 0 ) and ( move_y == 0 ) {
		state = CHARACTERS_STATES.IDLE;
	}
}


//--- INPUT ACTION
if(input_action ) {
	if ( state = CHARACTERS_STATES.IDLE ) or ( state = CHARACTERS_STATES.WALK) {
		//--- GO TO ATTACK STATE
		state = CHARACTERS_STATES.ATTACK;
		
		//---RESET ALARM
		alarm[0] = room_speed / 4 ;
	
	
		//---CREATE WEAPON
		var _w = instance_create_depth(x , y , depth + 1, obj_hand_weapon);
		_w.sprite_index = my_weapon; //On peut changer le paramètre d'une variable
		_w.image_index = frame_x;
	}
}
