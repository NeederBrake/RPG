var _targetX = obj_player.x - cam_width /2 ;
var _targetY = obj_player.y - cam_height /2 ;

//--- Ne pas sortir de la map
_targetX = clamp(_targetX,0, room_width - cam_width);
_targetY = clamp(_targetY,0, room_height - cam_height);


x = lerp(x , _targetX , .05); 
y = lerp(y, _targetY, .05) ;

camera_set_view_pos ( camera , x, y);