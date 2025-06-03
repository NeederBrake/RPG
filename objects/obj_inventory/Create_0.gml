globalvar inventory_mode,inventory ;
inventory_mode=false;


//--- CREATE STORAGE
inventory = new storage(6,4);

//--- DEBUG ITEMS
var _axe = new item();
var _mw = new item();
var _bone = new item();
var _medic = new item();
var _shrimp = new item();

with (_axe) {
	name = "hache de bûcheron";
	
	icon_sprite = spr_axe1 ;
	hand_sprite = spr_axe_1_hand ;
	
	type1 = ITEM_TYPES.EQUIPEMENT;
	type2 = ITEM_TYPES.MELEE ;
	type3 = ITEM_TYPES.WOOD_AXE ;
	
	stack = false ;
}
with (_mw) {
	name = "Bâton magique";
	
	icon_sprite = spr_magicwand_1 ;
	hand_sprite = spr_magicwand_hand_1 ;
	
	type1 = ITEM_TYPES.EQUIPEMENT;
	type2 = ITEM_TYPES.MAGIC ;
	type3 = undefined ;
	
	stack = false ;
}
with (_bone) {
	name = "Viel os";
	
	icon_sprite = spr_bone ;
	hand_sprite = spr_bone_hand ;
	
	type1 = ITEM_TYPES.EQUIPEMENT;
	type2 = ITEM_TYPES.MELEE ;
	type3 = undefined ;
	
	stack = false ;
}	
with (_medic) {
	name = "Kit de secours";
	
	icon_sprite = spr_medikit ;
	hand_sprite = undefined ;
	
	type1 = ITEM_TYPES.CONSOMABLE;
	type2 = ITEM_TYPES.HEAL ;
	type3 = undefined ;
	
	stack = true ;
}	
with (_shrimp) {
	name = "Queue de homard";
	
	icon_sprite = spr_shrimp ;
	hand_sprite = undefined ;
	
	type1 = ITEM_TYPES.CONSOMABLE;
	type2 = ITEM_TYPES.BUFF ;
	type3 = undefined ;
	
	stack = true ;
}	


inventory.items[0] = _axe ;
inventory.items[1] = _mw ;
inventory.items[2] = _bone ;
inventory.items[3] = _medic ;
inventory.items[4] = _shrimp ;



inventory.quantity[4] = _medic ;
inventory.quantity[12] = _shrimp ;