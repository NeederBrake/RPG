
//--- DEPTH
if(!place_meeting(x,y,obj_depth_collision)) depth  = -bbox_bottom;

//---- SPRITE & IMAGE INDEX ----//
var _cs = 16 ;

if ( state != CHARACTERS_STATES.IDLE ) and ( state != CHARACTERS_STATES.HIT) {
	if( state == CHARACTERS_STATES.WALK ) var _dir = walk_direction;
	else if  ( state == CHARACTERS_STATES.CHASE ) var _dir = chase_direction;
	
	if      ( _dir >= 100 ) and ( _dir <= 260 ) frame_x = 2 ;
	else if ( _dir >= 80  ) and ( _dir <= 100 ) frame_x = 1 ;
	else if ( _dir >= 260 ) and ( _dir <= 280 ) frame_x = 0 ;
	else frame_x = 3 ;
}
//--- ANIMATION
if ( floor ( frame_y + anim_speed ) <= anim_length - 1 ) {
	frame_y += anim_speed ;
} 
else 
{	frame_y = 0 ;
}

//--- DRAW SELF
draw_sprite_part(my_sprite , 0 , frame_x * _cs , floor(frame_y) * _cs , _cs , _cs , x - x_origin , y - y_origin);

//--- HIT SPRITE
if ( hit_alpha > 0 ){
	shader_set(sh_flashHit);
	draw_sprite_part_ext (my_sprite , 0 , frame_x * _cs , floor ( frame_y  )* _cs , _cs , _cs , x - x_origin , y - y_origin , 1,1 , c_white , hit_alpha );
	shader_reset();
	hit_alpha = lerp (hit_alpha , 0 , 0.07) // Lerp -> décrémente de manière souple
}


//--- LIFE BAR
if ( my_current_hp < my_max_hp ) {
	//--- EMPTY
	var _spr = spr_lifebar_empty ;
	var _offset = 4 ;
	
	var _xx = x - sprite_get_width(_spr) / 2;
	var _yy = y - _offset - my_size - sprite_get_height(_spr) ;
	draw_sprite( _spr , 0 , _xx , _yy );
	
	
	//-- PROGRESS
	_spr = spr_lifebar_full;
	_xx ++;
	
	var _ratio = ( 1 / my_max_hp ) * my_current_hp ;
	
	
	
	draw_sprite_ext ( _spr , 0 , _xx , _yy , _ratio , 1 , 0 , -1 , 1)
	
	
}






