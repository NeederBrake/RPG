randomize();


//----VARIABLES
//--- MOVE
move_x = 0 ;
move_y = 0 ;
walk_direction = 0 ;

//--- HIT
hit_speed = 0 ;
hit_direction = 0 ;
hit_power = 3 ;
hit_alpha = 0 ;

//--- LIVES
my_var_hp = undefined ;
my_current_hp = undefined ;

//--- FIRST MOVE
//nbr de frames dans laquel l'alarm ce déclenche (ici 1)
alarm[0] = random_range(room_speed,room_speed*3) ; 

//--- STATE
state = CHARACTERS_STATES.IDLE ;


//--- ANIMATION
frame_x = 0 ;
frame_y = 0 ;
anim_speed = 6 / room_speed;
anim_length = 4 ;

//--- CHILDS VARS
//--- CONVENTIONELLE (éviter les bugs)
walk_speed = undefined ;
x_origin = undefined ;
y_origin = undefined ;
my_sprite = undefined ;

my_chase_radius = undefined ;
my_idle_radius = undefined ;
my_chase_speed = undefined ;
my_coins_drop = undefined ;
