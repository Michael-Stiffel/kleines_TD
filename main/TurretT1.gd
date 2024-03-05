extends "res://Turrets.gd"

var PopupIds = ["ATK_TEXT", "ASP_TEXT", "UP_ATK", "UP_ASP"]
var last_mouse_position
@onready var mats = get_node("../../../Camera2D/Material")
@onready var _pm = $PopupMenu
var cost_for_ATK = 1
var cost_for_ASP = 1

func _ready():
	self.intialfuck("TurretT1")
	cost_for_ATK = Tdamage
	cost_for_ASP = int(Tattackspeed *20)
	_pm.add_item("ATK: " + str(Tdamage) )
	_pm.add_item("ASP: " + str(Tattackspeed))
	_pm.add_item("Upgrade ATK" + "(" + str(cost_for_ATK) + ")")
	_pm.add_item("Upgrade ASP" + "(" + str(cost_for_ASP) + ")" )
#	_pm.connect("id_pressed", _on_popup_menu_id_pressed.bind())
	_pm.connect("index_pressed", _on_popup_menu_index_pressed.bind())
	




func _on_popup_menu_index_pressed(index):
	match PopupIds[index]:
		"UP_ATK":
			mats.buy_shit(cost_for_ATK)
			upgrade_ATK(1)
			cost_for_ATK = Tdamage 
			_pm.set_item_text(PopupIds.find("ATK_TEXT"), "ATK: " + str(Tdamage)) 
			_pm.set_item_text(index, "Upgrade ATK" + "(" + str(cost_for_ATK) + ")") 
		"UP_ASP":
			mats.buy_shit(cost_for_ASP)
			upgrade_ASP(0.25)
			cost_for_ASP = int(Tattackspeed *20)
			_pm.set_item_text(PopupIds.find("ASP_TEXT"), "ASP: " + str(Tattackspeed)) 
			_pm.set_item_text(index, "Upgrade ASP" + "(" + str(cost_for_ASP) + ")" ) 


func _on_area_2d_input_event(viewport, event, shape_idx):
	if (event.is_action_released("ui_cancel")):
		last_mouse_position = get_global_mouse_position()
		_pm.popup(Rect2(last_mouse_position.x, last_mouse_position.y, 64, 64))
		

