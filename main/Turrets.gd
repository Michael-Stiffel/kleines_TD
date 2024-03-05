extends Node2D

var map
var tile_position
var enemy_array = []
var enemy 
var stats  = preload("res://stats.tscn") 
var towerData = stats.instantiate().get_tower_data()
var fire_ready = false
var Trange 
var Tdamage
var Tattackspeed
var Arrow = preload("res://arrow.tscn")
var button = 0 
var PopupIds = ["ATK_TEXT", "ASP_TEXT", "UP_ATK", "UP_ASP"]
var last_mouse_position
var mats
@onready var _pm = $PopupMenu
var cost_for_ATK = 1
var cost_for_ASP = 1
	
func _process(_delta):
	if enemy_array.size() != 0:
		select_enemy()
		if fire_ready:
			fire()
	

func select_enemy():
	var enemy_progress_array = []
	for i in enemy_array:
		enemy_progress_array.append(int(i.progress))
	var max_progress = enemy_progress_array.max()
	var enemy_index = enemy_progress_array.find(max_progress)
	enemy = enemy_array[enemy_index]


func fire():
	
	fire_ready = false
	var b = Arrow.instantiate()
	add_child(b)
	b.my_damage(Tdamage)
	b.position.x = b.position.x+64
	b.position.y = b.position.y+64
	var degree = b.get_angle_to(enemy.position)
	b.transform = b.transform.rotated_local(degree)  
	#enemy.on_hit(Tdamage)
	await get_tree().create_timer(1/Tattackspeed).timeout
	fire_ready = true
	
	
func _on_area_2d_body_entered(body):
	enemy_array.append((body.get_parent()).get_parent())
	
	

func _on_area_2d_body_exited(body):
	enemy_array.erase((body.get_parent()).get_parent())

func intialfuck(identifier):
	Trange = towerData[identifier]["range"]
	self.get_node("Area2D/CollisionShape2D").get_shape().radius =  Trange
	Tdamage = towerData[identifier]["damage"]
	Tattackspeed = towerData[identifier]["attackspeed"]
	cost_for_ATK = Tdamage
	cost_for_ASP = int(Tattackspeed *20)
	_pm.add_item("ATK: " + str(Tdamage) )
	_pm.add_item("ASP: " + str(Tattackspeed))
	_pm.add_item("Upgrade ATK" + "(" + str(cost_for_ATK) + ")")
	_pm.add_item("Upgrade ASP" + "(" + str(cost_for_ASP) + ")" )
#	_pm.connect("id_pressed", _on_popup_menu_id_pressed.bind())
	_pm.connect("index_pressed", _on_popup_menu_index_pressed.bind())
	




func _on_popup_menu_index_pressed(index):
	mats = get_node("../../../Camera2D/Material")
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


func _on_area_2d_input_event(_viewport, event, _shape_idx):
	if (event.is_action_released("ui_cancel")):
		last_mouse_position = get_global_mouse_position()
		_pm.popup(Rect2(last_mouse_position.x, last_mouse_position.y, 64, 64))
		


func upgrade_ATK(value):
		Tdamage = Tdamage + value
		
func upgrade_ASP(value):
		Tattackspeed = Tattackspeed + value
