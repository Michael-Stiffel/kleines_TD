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
var PopupIds = ["ATK_TEXT", "ASP_TEXT", "UP_ATK", "UP_ASP", "DEL"]
var last_mouse_position
var mats
var mats_return
var mats_return_for_ASP = 0
var mats_return_for_ATK = 0
@onready var _pm = $PopupMenu
var cost_for_ATK = 1
var cost_for_ASP = 1
var cost_for_tower
var Number_of_ATK_upgrades = 0
var Number_of_ASP_upgrades = 0
var StartTdamage
var StartTattackspeed
@onready var shoot_sound = get_node("../../../Audio/Tower_shoot") 
var range_texture
func _process(_delta):
	self.get_node("Area2D/CollisionShape2D").get_shape().radius =  Trange
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
	shoot_sound.play()
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
	StartTdamage = Tdamage
	StartTattackspeed = Tattackspeed
	cost_for_tower = towerData[identifier]["cost"]
	cost_for_ATK = Tdamage
	cost_for_ASP = int(Tattackspeed *20)
	_pm.add_item("ATK: " + str(Tdamage) )
	_pm.add_item("ASP: " + str(Tattackspeed))
	_pm.add_item("Upgrade ATK" + "(" + str(cost_for_ATK) + ")")
	_pm.add_item("Upgrade ASP" + "(" + str(cost_for_ASP) + ")" )
	_pm.add_item("Delete")
#	_pm.connect("id_pressed", _on_popup_menu_id_pressed.bind())
	_pm.connect("index_pressed", _on_popup_menu_index_pressed.bind())
	_pm.connect("popup_hide", _on_hidden_popup.bind())


func _on_hidden_popup():
	if(self.get_node(str(range_texture))):
		self.remove_child(range_texture)

func _on_popup_menu_index_pressed(index):
	var map_node = get_node("../../../Map_Node/TileMap")
	mats = get_node("../../../../CanvasLayer/Control/Material")
	match PopupIds[index]:
		"UP_ATK":
			var zu_teuer = mats.to_expensive(cost_for_ATK)
			if !zu_teuer:
				mats.buy_shit(cost_for_ATK)
				mats_return_for_ATK = mats_return_for_ATK +cost_for_ATK
				upgrade_ATK(1)
				cost_for_ATK = (StartTdamage+ Number_of_ATK_upgrades) 
				_pm.set_item_text(PopupIds.find("ATK_TEXT"), "ATK: " + str(Tdamage)) 
				_pm.set_item_text(index, "Upgrade ATK" + "(" + str(cost_for_ATK) + ")") 
		"UP_ASP":
			var zu_teuer = mats.to_expensive(cost_for_ASP)
			if !zu_teuer:
				mats.buy_shit(cost_for_ASP)
				mats_return_for_ASP = mats_return_for_ASP +cost_for_ASP
				upgrade_ASP(0.25)
				cost_for_ASP = int((StartTattackspeed+(Number_of_ASP_upgrades * 0.25))  *20)
				_pm.set_item_text(PopupIds.find("ASP_TEXT"), "ASP: " + str(Tattackspeed)) 
				_pm.set_item_text(index, "Upgrade ASP" + "(" + str(cost_for_ASP) + ")" ) 
		"DEL":
			var map_dic = map_node.get_MapDic()
			var current_tile = map_node.local_to_map(last_mouse_position)
			map_dic[str(current_tile)]["Buildable"] = true
			mats_return = mats_return_for_ASP + mats_return_for_ATK + cost_for_tower
			mats.sell_shit(mats_return) 
			self.queue_free()
			

func _on_area_2d_input_event(_viewport, event, _shape_idx):
	if (event.is_action_released("ui_cancel")):
		last_mouse_position = get_global_mouse_position()
		_pm.set_item_text(PopupIds.find("ASP_TEXT"), "ASP: " + str(Tattackspeed)) 
		_pm.set_item_text(PopupIds.find("ATK_TEXT"), "ATK: " + str(Tdamage)) 
		range_texture =  Sprite2D.new()	
		range_texture.position = Vector2(64,64)
		self.get_node("Area2D/CollisionShape2D").get_shape().radius =  Trange
		var scaling = Trange/ 300.0
		range_texture.scale = Vector2(scaling,scaling)
		var texture = load("res://res/PNG/range_overlay.png")
		range_texture.texture = texture
		range_texture.modulate = Color("ad54ff3c")
		self.add_child(range_texture)
		_pm.popup(Rect2(last_mouse_position.x, last_mouse_position.y, 64, 64))
		
		


func upgrade_ATK(value):
	Tdamage = Tdamage + value
	Number_of_ATK_upgrades=+1
		
		
func upgrade_ASP(value):
	Tattackspeed = Tattackspeed + value
	Number_of_ASP_upgrades=+1
