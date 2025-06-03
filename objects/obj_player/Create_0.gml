//----CONVENTIONS----//
// Le nom d'une variable locale commence par _
// Le nom des enum est en majuscule
// [ VARIABLES GLOBALES  ] //

//-- LIFES
max_lives = 3 ;
current_lives = max_lives ;


//---- VARIABLES ----//
//---- Mouvement ----//
move_x = 0;
move_y = 0;

move_speed = 1;
move_direction = 0;


//--- HIT
hit_speed = 0 ;
hit_direction = 0 ;
hit_alpha = 0 ;


//----  DESSIN   ----//
frame_x = 0 ;
frame_y = 0 ;
anim_speed = 6 / room_speed;

//--- ETATS
state = CHARACTERS_STATES.IDLE;

//--- EQUIPEMENTS
my_weapon = spr_axe_1_hand;