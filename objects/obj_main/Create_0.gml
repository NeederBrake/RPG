globalvar debug, coins ; //Variable dispo pr tt les objets
debug = false;
coins = 0 ;


//-- CAMERA
if (!instance_exists(obj_camera) ) var _cam = instance_create_layer ( 0 , 0 , "i_main" , obj_camera );


//-- CAMERA
if (!instance_exists(obj_inventory) ) var _inv = instance_create_layer ( 0 , 0 , "i_main" , obj_inventory );



