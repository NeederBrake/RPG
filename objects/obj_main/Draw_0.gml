if (debug) {
	with ( obj_characters ) {
		draw_set_color(c_red);
		draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,true);
		
	
	}
	with ( obj_ennemies ) {
		//--- CHASE RADIUS
		draw_set_color(c_red);
		draw_circle(x, y, my_chase_radius, true);
	
	}
	
	with ( obj_ennemies ) {
		//--- IDLE RADIUS
		draw_set_color(c_green);
		draw_circle(x, y, my_idle_radius, true);
	
	}
	
	//--- COLLISION AND DEPTH
	with ( obj_collision ) {
		draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,true);
	}
	with ( obj_depth_collision ) {
		draw_set_color(c_blue);
		draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,true);
	}
}