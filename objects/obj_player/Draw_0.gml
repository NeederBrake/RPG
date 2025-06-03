//draw_self(); //Dessine le sprite par défaut

if(!place_meeting(x,y,obj_depth_collision)) depth  = -y;
var _cs = 16 ; // cs = cell size



//--- SETUP SPRITE
switch ( state ) {
	case CHARACTERS_STATES.IDLE : sprite_index = spr_player_idle; break;
	case CHARACTERS_STATES.WALK : sprite_index = spr_player_walk; break;
	case CHARACTERS_STATES.ATTACK : sprite_index = spr_player_attack; break;
	case CHARACTERS_STATES.DEAD : sprite_index = spr_player_dead; break ;
	
}

//--- SETUP FRAME X
if ( state = CHARACTERS_STATES.IDLE ) or ( state == CHARACTERS_STATES.WALK ) {
	if ( x_direction == -1 )      frame_x = 2;
	else if ( x_direction == 1 )  frame_x = 3;
	else if ( y_direction == -1 ) frame_x = 1 ;
	else if ( y_direction == 1 )  frame_x = 0 ;

}
//--- SETUP FRAME Y
if ( state = CHARACTERS_STATES.WALK ) {
	var _animLength = 4;
	 if ( floor ( frame_y + anim_speed) <= _animLength - 1 ) frame_y += anim_speed;
	 else frame_y = 0 ;

}else {
	frame_y = 0;
}

//--- DRAW SPRITE
draw_sprite_part (sprite_index , 0 , frame_x * _cs , floor ( frame_y  )* _cs , _cs , _cs , x - 8 , y - 16);

//--- HIT SPRITE
if ( hit_alpha > 0 ){
	shader_set(sh_flashHit);
	draw_sprite_part_ext (sprite_index , 0 , frame_x * _cs , floor ( frame_y  )* _cs , _cs , _cs , x - 8 , y - 16 , 1,1 , c_white , hit_alpha );
	shader_reset();
	hit_alpha = lerp (hit_alpha , 0 , 0.07) // Lerp -> décrémente de manière souple
}